package com.askinmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.askinmall.domain.Criteria;
import com.askinmall.domain.MemberVO;
import com.askinmall.mapper.AdMemberMapper;

import lombok.Setter;

@Service
public class AdMemberServiceImpl implements AdMemberService {

	@Setter(onMethod_ = {@Autowired})
	private AdMemberMapper adMemberMapper;

	@Override
	public void addUser(MemberVO vo) {
		adMemberMapper.addUser(vo);
	}

	@Override
	public List<MemberVO> userList(Criteria cri) {
		return adMemberMapper.userList(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return adMemberMapper.getTotal(cri);
	}

	@Override
	public MemberVO userModifyForm(String user_id) {
		return adMemberMapper.userModifyForm(user_id);
	}

	@Override
	public void modifyUser(MemberVO vo) {
		adMemberMapper.modifyUser(vo);
	}

	@Override
	public void changeUserPW(String user_id, String new_user_password) {
		adMemberMapper.changeUserPW(user_id, new_user_password);
	}
	
}
