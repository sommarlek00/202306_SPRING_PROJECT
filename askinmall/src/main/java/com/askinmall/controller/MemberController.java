package com.askinmall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.askinmall.domain.MemberVO;
import com.askinmall.dto.LoginDTO;
import com.askinmall.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Setter(onMethod_ =  {@Autowired})
	private MemberService memberService;
	
	@Setter(onMethod_ = {@Autowired})
	private PasswordEncoder passwordEncoder;
	
	
	// 사용자 페이지
	// 회원 가입 페이지
	@GetMapping("/join")
	public void join() {
	}
	
	
	// 회원 가입 아이디 중복 체크
	@ResponseBody
	@GetMapping("/idCheck")
	public ResponseEntity<String> idCheck(String user_id){
		ResponseEntity<String> entity = null;
		
		String isUse = "";
		if(memberService.idCheck(user_id) != null) {
			isUse = "no";
		}else {
			isUse = "yes";
		}
		
		entity = new ResponseEntity<String>(isUse, HttpStatus.OK);
		return entity;
	}
	
	
	// 회원 가입 닉네임 중복 체크
	@ResponseBody
	@GetMapping("/nicknameCheck")
	public ResponseEntity<String> nicknameCheck(String user_nickname){
		ResponseEntity<String> entity = null;
		
		String isUse = "";
		if(memberService.nicknameCheck(user_nickname) != null) {
			isUse = "no";
		}else {
			isUse = "yes";
		}
		
		entity = new ResponseEntity<String>(isUse, HttpStatus.OK);
		return entity;
	}
	
	
	// 회원 가입 기능
	@PostMapping("/join")
	public String join(MemberVO vo) {
		log.info("회원가입: " + vo);
		
		vo.setUser_password(passwordEncoder.encode(vo.getUser_password()));
		memberService.join(vo);
		return "redirect:/member/login";
	}
	
	
	// 로그인 페이지
	@GetMapping("/login")
	public void login() {
	}
	
	
	// 로그인 기능
	@PostMapping("/login")
	public String login(LoginDTO dto, HttpSession session, RedirectAttributes rttr) {
		
		MemberVO vo = memberService.login(dto.getUser_id());
		
		String url = "";
		String msg = "";
		
		
		if(vo != null) {
			if(passwordEncoder.matches(dto.getUser_password(), vo.getUser_password())) {
				session.setAttribute("loginStatus", vo);
				memberService.now_visit(dto.getUser_id());
				
				String targetUrl = (String) session.getAttribute("targetUrl");
				
				url = (targetUrl != null) ? targetUrl : "/";
				
				if(targetUrl != null) {
					session.removeAttribute("targetUrl");
				}
				
			}else {
				url = "/member/login";
				msg = "failPW";
			}
		}else {
			url = "/member/login";
			msg = "failID";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		return "redirect:" + url;
	}
	
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	// 회원정보 수정, 마이페이지
	@GetMapping(value = {"/modify", "/mypage"})
	public void modify(Model model, HttpSession session) {
		String user_id  = ((MemberVO) session.getAttribute("loginStatus")).getUser_id();
		model.addAttribute("memberVO", memberService.login(user_id));
	}
	
	
	// 회원정보 수정
	@PostMapping("/modify")
	public String modify(MemberVO vo, HttpSession session, RedirectAttributes rttr) {
		
		String url = "";
		String msg = "";
		String user_id  = ((MemberVO) session.getAttribute("loginStatus")).getUser_id();
		
		String db_user_password = ((MemberVO) memberService.login(user_id)).getUser_password();
		
		if(passwordEncoder.matches(vo.getUser_password(), db_user_password)) {
			memberService.modify(vo);
			msg = "modify";
			url = "/";
		}else {
			msg = "failPW";
			url = "/member/modify";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		return "redirect:" + url;
	}
	
	
	// 비밀번호 변경
	@ResponseBody
	@PostMapping("/pwChange")
	public ResponseEntity<String> pwChange(String old_user_password, String new_user_password, HttpSession session){
		ResponseEntity<String> entity = null;
		String body = "";
		
		log.info("기존비번: " + old_user_password);
		log.info("변경비번: " + new_user_password);
		
		MemberVO vo = (MemberVO) session.getAttribute("loginStatus");
		String user_id = vo.getUser_id();
		
		String db_user_password = ((MemberVO) memberService.login(user_id)).getUser_password();
		
		if(passwordEncoder.matches(old_user_password, db_user_password)) {
			String enc_user_password = passwordEncoder.encode(new_user_password);
			memberService.pwChange(user_id, enc_user_password);
			body = "success";
		}else {
			body = "failPW";
		}
		
		entity = new ResponseEntity<String>(body, HttpStatus.OK);
		
		return entity;
	}
		
	
	// 회원 탈퇴
	@ResponseBody
	@PostMapping("/delete")
	public ResponseEntity<String> delete(String user_password, HttpSession session){
		ResponseEntity<String> entity = null;
		String body = "";
		
		String user_id = ((MemberVO) session.getAttribute("loginStatus")).getUser_id();
		String db_user_password = ((MemberVO) memberService.login(user_id)).getUser_password();
		
		if(passwordEncoder.matches(user_password, db_user_password)) {
			memberService.delete(user_id);
			session.invalidate();
			body = "success";
		}else {
			body = "failPW";
		}
		
		entity = new ResponseEntity<String>(body, HttpStatus.OK);
		
		return entity;
	}
	
	
	// 아이디 찾기
	@ResponseBody
	@GetMapping("/findID")
	public ResponseEntity<String> findID(String user_name, String user_email, RedirectAttributes rttr){
		ResponseEntity<String> entity = null;
		
		log.info("파라미터 확인: " + user_name + " " + user_email);
		
		String db_user_id = "";

		if(memberService.findID(user_name, user_email) != null) {
			db_user_id = memberService.findID(user_name, user_email);
		}else {
			db_user_id = "";
		}
		log.info("id: " + db_user_id);
		entity = new ResponseEntity<String>(db_user_id, HttpStatus.OK);
		
		return entity;
	}
	
	
}
