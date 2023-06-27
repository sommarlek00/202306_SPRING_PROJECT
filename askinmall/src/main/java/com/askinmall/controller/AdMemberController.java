package com.askinmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.askinmall.domain.Criteria;
import com.askinmall.domain.MemberVO;
import com.askinmall.dto.PageDTO;
import com.askinmall.service.AdMemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin/member/*")
public class AdMemberController {
	
	@Setter(onMethod_ = {@Autowired})
	private AdMemberService adMemberService;
	
	@Setter(onMethod_ = {@Autowired})
	private PasswordEncoder passwordEncoder;
	
	
	// 관리자 페이지
	// 회원 등록 페이지
	@GetMapping("/addUserForm")
	public void addUserForm() {
	}
	
	
	// 회원 등록 기능
	@PostMapping("/addUser")
	public String addUser(MemberVO vo) {
		vo.setUser_password(passwordEncoder.encode(vo.getUser_password()));
		adMemberService.addUser(vo);
		return "redirect:/admin/member/userList";
	}
	
	
	// 회원 목록 페이지
	@GetMapping("/userList")
	public void userList(@ModelAttribute("cri") Criteria cri, Model model) {
		List<MemberVO> list = adMemberService.userList(cri);
		model.addAttribute("userList", list);
		int total = adMemberService.getTotal(cri);
		
		PageDTO pageDTO = new PageDTO(total, cri);
		model.addAttribute("pageMaker", pageDTO);
	}
	
	
	// 회원 수정, 상세 페이지
	@GetMapping(value = {"/userDetail", "/userModifyForm"})
	public void userModifyForm(String user_id, @ModelAttribute("cri") Criteria cri, Model model) {
		MemberVO memberVO = adMemberService.userModifyForm(user_id);	
		model.addAttribute("member", memberVO);
	}
	
	
	// 회원 수정 기능
	@PostMapping("/modifyUser")
	public String modifyUser(MemberVO vo, RedirectAttributes rttr) {
		adMemberService.modifyUser(vo);
		rttr.addFlashAttribute("msg", "modify");
		return "redirect:/admin/member/userList";
	}
	
	
	// 회원 수정 비밀번호 재설정
	@ResponseBody
	@PostMapping("/changeUserPW")
	public ResponseEntity<String> changeUserPW(String user_id, String new_user_password){
		
		ResponseEntity<String> entity = null;
		
		log.info("아이디: " + user_id);
		log.info("비밀번호: " + new_user_password);
			
		String enc_user_password = passwordEncoder.encode(new_user_password);
		adMemberService.changeUserPW(user_id, enc_user_password);

		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		return entity;
	}
	
	
}
