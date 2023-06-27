package com.askinmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.askinmall.domain.OrderVO;
import com.askinmall.domain.PaymentVO;
import com.askinmall.mapper.CartMapper;
import com.askinmall.mapper.OrderMapper;

import lombok.Setter;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Setter(onMethod_= {@Autowired})
	private OrderMapper orderMapper;
	
	@Setter(onMethod_= {@Autowired})
	private CartMapper cartMapper;

	@Override
	@Transactional
	public void orderSave(OrderVO order_vo, PaymentVO payment_vo) {
		
		orderMapper.orderSave(order_vo);
		
		orderMapper.orderDetailSave(order_vo.getOrd_no());
		
		payment_vo.setOrd_no(order_vo.getOrd_no());
		orderMapper.paymentSave(payment_vo);
		
		cartMapper.emptyCart(order_vo.getUser_id());
		
	}

}
