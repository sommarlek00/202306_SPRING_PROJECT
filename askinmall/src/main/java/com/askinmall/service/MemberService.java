package com.askinmall.service;

import com.askinmall.domain.MemberVO;

public interface MemberService {
	
	String idCheck(String user_id);
	
	String nicknameCheck(String user_nickname);
	
	void join(MemberVO vo);
	
	MemberVO login(String user_id);
	
	void now_visit(String user_id);
	
	void modify(MemberVO vo);
	
	void pwChange(String user_id, String new_user_password);
	
	void delete(String user_id);
	
	void registerLeave(String user_id);
	
	String findID(String user_name, String user_email);
	
	String findPW(String user_id, String user_email);

}
