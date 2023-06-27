package com.askinmall.mapper;

import org.apache.ibatis.annotations.Param;

import com.askinmall.domain.MemberVO;

public interface MemberMapper {

	// 아이디 중복 체크
	String idCheck(String user_id);
	
	// 닉네임 중복 체크
	String nicknameCheck(String user_nickname);
	
	// 회원가입
	void join(MemberVO vo);
	
	// 로그인, 회원 수정 폼
	MemberVO login(String user_id);
	
	// 로그인 시간 업데이트
	void now_visit(String user_id);
	
	// 회원정보 수정
	void modify(MemberVO vo);
	
	// 비밀번호 변경
	void pwChange(@Param("user_id") String user_id,@Param("new_user_password") String new_user_password);
	
	// 회원 탈퇴
	void delete(String user_id);
	
	// 회원 탈퇴 신청
	void registerLeave(String user_id);
	
	// 아이디 찾기
	String findID(@Param("user_name") String user_name, @Param("user_email") String user_email);
	
	// 비밀번호 찾기
	String findPW(@Param("user_id") String user_id, @Param("user_email") String user_email);	
	
}
