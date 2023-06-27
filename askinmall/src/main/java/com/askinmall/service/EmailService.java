package com.askinmall.service;

import com.askinmall.dto.EmailDTO;

public interface EmailService {
	
	void sendMail(EmailDTO dto, String message);

}
