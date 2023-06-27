package com.askinmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.askinmall.domain.Criteria;
import com.askinmall.domain.OrderInfoVO;
import com.askinmall.domain.OrderVO;
import com.askinmall.mapper.AdOrderMapper;

import lombok.Setter;

@Service
public class AdOrderServiceImpl implements AdOrderService {

	@Setter(onMethod_= {@Autowired})
	private AdOrderMapper adOrderMapper;

	@Override
	public List<OrderVO> orderList(Criteria cri, String sDate, String eDate) {
		return adOrderMapper.orderList(cri, sDate, eDate);
	}

	@Override
	public int getTotal(Criteria cri, String sDate, String eDate) {
		return adOrderMapper.getTotal(cri, sDate, eDate);
	}

	@Override
	public List<OrderInfoVO> orderInfo(Long ord_no) {
		return adOrderMapper.orderInfo(ord_no);
	}

	@Override
	@Transactional
	public void deleteOrderInfoProd(Long ord_no, Integer prod_no, int ord_detail_amount) {
		adOrderMapper.deleteOrderInfoProd(ord_no, prod_no, ord_detail_amount);
		adOrderMapper.modifyPayment(ord_no, ord_detail_amount);
		adOrderMapper.modifyOrder(ord_no, ord_detail_amount);
	}

	@Override
	@Transactional
	public void deleteOrderDetail(Long ord_no) {
		adOrderMapper.deleteOrderDetail(ord_no);
		adOrderMapper.deletePayment(ord_no);
		adOrderMapper.deleteOrder(ord_no);
	}

	@Override
	public List<OrderVO> deletedOrderList(Criteria cri) {
		return adOrderMapper.deletedOrderList(cri);
	}

	@Override
	public int getTotalDeletedOrder(Criteria cri) {
		return adOrderMapper.getTotalDeletedOrder(cri);
	}


	
}
