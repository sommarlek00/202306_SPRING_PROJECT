package com.askinmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.askinmall.domain.Criteria;
import com.askinmall.domain.MemberVO;

public interface AdMemberMapper {
	
	void addUser(MemberVO vo);
	
	List<MemberVO> userList(Criteria cri);
	int getTotal(Criteria cri);

	MemberVO userModifyForm(String user_id);
	
	void modifyUser(MemberVO vo);
	
	void changeUserPW(@Param("user_id") String user_id, @Param("new_user_password") String new_user_password);
	
}
