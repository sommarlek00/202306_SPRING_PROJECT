package com.askinmall.mapper;

import com.askinmall.domain.OrderVO;
import com.askinmall.domain.PaymentVO;

public interface OrderMapper {
	
	// 주문정보 저장
	void orderSave(OrderVO order_vo);
	
	// 주문상세 저장
	void orderDetailSave(Long ord_no);
	
	// 결제정보 저장
	void paymentSave(PaymentVO payment_vo);
	
}
