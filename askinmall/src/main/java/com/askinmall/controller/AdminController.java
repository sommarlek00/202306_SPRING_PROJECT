package com.askinmall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.askinmall.domain.AdminVO;
import com.askinmall.service.AdminService;

import lombok.Setter;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Setter(onMethod_ = {@Autowired})
	private AdminService adminService;
	
	@Setter(onMethod_ = {@Autowired})
	private PasswordEncoder passwordEncoder;
	
	// 관리자 페이지
	// 로그인 페이지
	@GetMapping("")
	public String login() {
		return "/admin/adminLogin";
	}
	
	
	// 관리자 로그인
	@PostMapping("/adminLogin")
	public String adminLogin(AdminVO vo, HttpSession session, RedirectAttributes rttr) {
		
		AdminVO db_vo = adminService.adminLogin(vo.getAdmin_id());
		
		String url = "";
		String msg = "";
		
		if(db_vo != null) {
			if(passwordEncoder.matches(vo.getAdmin_password(), db_vo.getAdmin_password())) {
				session.setAttribute("adminStatus", db_vo);
				url = "admin/adminMenu";
				
				adminService.now_visit(vo.getAdmin_id());
			}else {
				url = "admin/";
				msg = "failPW";
			}
		}else {
			url = "admin/";
			msg = "failID";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		return "redirect:/" + url;
	}
	
	
	// 관리자 메뉴
	@GetMapping("/adminMenu")
	public void adminMenu() {
		
	}
	
	
	// 관리자 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/admin/";
	}
	
	
}
