package com.askinmall.service;

import java.util.List;

import com.askinmall.domain.CartVO;
import com.askinmall.dto.CartListDTO;

public interface CartService {

	List<CartListDTO> cartList(String user_id);
	
	int cartTotalAmount(String user_id);
	
	int addCartProd(CartVO vo);
	
	int changeCartQty(Long cart_no, int cart_qty);
	
	int deleteCartProd(Long cart_no);

	void emptyCart(String user_id);
}
