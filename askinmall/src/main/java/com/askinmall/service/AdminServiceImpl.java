package com.askinmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.askinmall.domain.AdminVO;
import com.askinmall.mapper.AdminMapper;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Setter(onMethod_ = {@Autowired})
	private AdminMapper adminMapper;

	@Override
	public AdminVO adminLogin(String admin_id) {
		return adminMapper.adminLogin(admin_id);
	}

	@Override
	public void now_visit(String admin_id) {
		adminMapper.now_visit(admin_id);
		
	}

}
