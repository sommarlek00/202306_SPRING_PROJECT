package com.askinmall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.askinmall.dto.EmailDTO;
import com.askinmall.service.EmailService;
import com.askinmall.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/email/*")
public class EmailController {
	
	@Setter(onMethod_ = {@Autowired})
	private EmailService emailService;
	
	@Setter(onMethod_ =  {@Autowired})
	private MemberService memberService;
	
	@Setter(onMethod_ = {@Autowired})
	private PasswordEncoder passwordEncoder;
	
	
	// 회원가입 메일 인증코드 전송
	@GetMapping("/send")
	public ResponseEntity<String> send(EmailDTO dto, HttpSession session){
		
		ResponseEntity<String> entity = null;
		String message = "\n메일 인증을 위한 인증코드를 확인하시고, 인증코드 입력란에 입력하세요";
		
		String authCode = "";
		for(int i=0; i<6; i++) {
			authCode += String.valueOf((int)(Math.random() * 10));
		}
		
		log.info("인증 코드: " + authCode);
		
		session.setAttribute("authCode", authCode);
		
		try {
			emailService.sendMail(dto, "인증코드: " + authCode + message);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	
	// 회원 가입 메일 인증코드 확인
	@GetMapping("/confirmAuthCode")
	public ResponseEntity<String> confirmAuthCode(String authCode, HttpSession session){
		ResponseEntity<String> entity = null;
		
		String confirm_authCode = (String) session.getAttribute("authCode");
		
		if(authCode.equals(confirm_authCode)) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			session.removeAttribute("authCode");
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
					
		return entity;
	}
	
	
	// 비밀번호 찾기. 임시 비밀번호 전송
	@ResponseBody
	@GetMapping("/sendTmpPW")
	public ResponseEntity<String> sendTmpPW(EmailDTO dto, String user_id, String user_email, RedirectAttributes rttr){
		
		ResponseEntity<String> entity = null;
		
		dto.setSubject("ASKIN 임시 비밀번호 입니다.");
		String msg = "\n임시 비밀번호로 로그인 후 보안을 위해 비밀번호를 재변경 해주세요";
		
		String tmp_pw = "";
		for(int i=0; i<6; i++) {
			tmp_pw += String.valueOf((int)(Math.random() * 10));
		}
		
		log.info("id: " + user_id);
		log.info("email: " + user_email);
		log.info("임시 비밀번호: " + tmp_pw);
		
		if(memberService.findPW(user_id, user_email)!= null) {
			String enc_user_password = passwordEncoder.encode(tmp_pw);
			memberService.pwChange(user_id, enc_user_password);
		
		
		try {
			emailService.sendMail(dto, "임시 비밀번호: " + tmp_pw + msg);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
			}
		return entity;
	}
	
	
}
