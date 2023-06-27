package com.askinmall.service;

import com.askinmall.domain.AdminVO;

public interface AdminService {
	
	AdminVO adminLogin(String admin_id);
	
	void now_visit(String admin_id);

}
