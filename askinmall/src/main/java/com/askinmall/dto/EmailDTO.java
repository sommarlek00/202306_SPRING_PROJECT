package com.askinmall.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class EmailDTO {
	
	private String senderName;
	private String senderMail;
	private String receiverMail;
	private String subject;
	private String message;
	
	public EmailDTO() {
		this.senderName = "ASKIN";
		this.senderMail = "ASKIN";
		this.subject = "ASKIN 회원가입 메일 인증 코드입니다.";
		this.message = "";
				
	}

}
