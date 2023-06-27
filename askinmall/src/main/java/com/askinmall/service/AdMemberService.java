package com.askinmall.service;

import java.util.List;

import com.askinmall.domain.Criteria;
import com.askinmall.domain.MemberVO;

public interface AdMemberService {
	
	void addUser(MemberVO vo);
	
	List<MemberVO> userList(Criteria cri);
	
	int getTotal(Criteria cri);
	
	MemberVO userModifyForm(String user_id);
	
	void modifyUser(MemberVO vo);
	
	void changeUserPW(String user_id, String new_user_password);
	
}
