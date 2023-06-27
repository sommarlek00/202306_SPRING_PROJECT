package com.askinmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.askinmall.domain.CartVO;
import com.askinmall.dto.CartListDTO;

public interface CartMapper {
	
	List<CartListDTO> cartList(String user_id);
	
	int cartTotalAmount(String user_id);

	int addCartProd(CartVO vo);
	
	int changeCartQty(@Param("cart_no")Long cart_no, @Param("cart_qty") int cart_qty);
	
	int deleteCartProd(Long cart_no);
	
	void emptyCart(String user_id);
}
