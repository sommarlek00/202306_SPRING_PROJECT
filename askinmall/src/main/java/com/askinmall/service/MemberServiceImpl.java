package com.askinmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.askinmall.domain.MemberVO;
import com.askinmall.mapper.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memberMapper;
	
	@Override
	public String idCheck(String user_id) {
		return memberMapper.idCheck(user_id);
	}
	
	@Override
	public String nicknameCheck(String user_nickname) {
		return memberMapper.nicknameCheck(user_nickname);
	}

	@Override
	public void join(MemberVO vo) {
		memberMapper.join(vo);
	}

	@Override
	public MemberVO login(String user_id) {
		return memberMapper.login(user_id);
	}

	@Override
	public void now_visit(String user_id) {
		memberMapper.now_visit(user_id);
	}

	@Override
	public void modify(MemberVO vo) {
		memberMapper.modify(vo);
	}

	@Override
	public void pwChange(String user_id, String new_user_password) {
		memberMapper.pwChange(user_id, new_user_password);
	}

	@Override
	public void delete(String user_id) {
		memberMapper.delete(user_id);	
	}
	
	@Override
	public void registerLeave(String user_id) {
		memberMapper.registerLeave(user_id);
	}

	@Override
	public String findID(String user_name, String user_email) {
		return memberMapper.findID(user_name, user_email);
	}

	@Override
	public String findPW(String user_id, String user_email) {
		return memberMapper.findPW(user_id, user_email);
	}



	

}
