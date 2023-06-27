package com.askinmall.mapper;

import com.askinmall.domain.AdminVO;

public interface AdminMapper {
	
	AdminVO adminLogin(String admin_id);
	
	void now_visit(String admin_id);

}
