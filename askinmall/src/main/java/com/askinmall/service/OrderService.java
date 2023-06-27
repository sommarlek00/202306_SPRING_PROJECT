package com.askinmall.service;

import com.askinmall.domain.OrderVO;
import com.askinmall.domain.PaymentVO;

public interface OrderService {

	void orderSave(OrderVO order_vo, PaymentVO payment_vo);
	
}
