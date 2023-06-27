package com.askinmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.askinmall.domain.CartVO;
import com.askinmall.dto.CartListDTO;
import com.askinmall.mapper.CartMapper;

import lombok.Setter;

@Service
public class CartServiceImpl implements CartService {

	@Setter(onMethod_= {@Autowired})
	private CartMapper cartMapper;
	
	@Override
	public List<CartListDTO> cartList(String user_id) {
		return cartMapper.cartList(user_id);
	}
	
	@Override
	public int cartTotalAmount(String user_id) {
		return cartMapper.cartTotalAmount(user_id);
	}

	@Override
	public int addCartProd(CartVO vo) {
		return cartMapper.addCartProd(vo);
	}

	@Override
	public int changeCartQty(Long cart_no, int cart_qty) {
		return cartMapper.changeCartQty(cart_no, cart_qty);
	}

	@Override
	public int deleteCartProd(Long cart_no) {
		return cartMapper.deleteCartProd(cart_no);
	}

	@Override
	public void emptyCart(String user_id) {
		cartMapper.emptyCart(user_id);
	}

}
