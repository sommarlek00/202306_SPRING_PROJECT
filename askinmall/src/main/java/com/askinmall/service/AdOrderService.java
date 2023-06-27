package com.askinmall.service;

import java.util.List;

import com.askinmall.domain.Criteria;
import com.askinmall.domain.OrderInfoVO;
import com.askinmall.domain.OrderVO;

public interface AdOrderService {
	
	List<OrderVO> orderList(Criteria cri, String sDate, String eDate);
	
	int getTotal(Criteria cri, String sDate, String eDate);
	
	List<OrderInfoVO> orderInfo(Long ord_no);
	
	void deleteOrderInfoProd(Long ord_no, Integer prod_no, int ord_detail_amount);
	
	void deleteOrderDetail(Long ord_no);
	
	List<OrderVO> deletedOrderList(Criteria cri);
	
	int getTotalDeletedOrder(Criteria cri);

}
