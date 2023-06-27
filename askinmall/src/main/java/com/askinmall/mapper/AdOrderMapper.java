package com.askinmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.askinmall.domain.Criteria;
import com.askinmall.domain.OrderInfoVO;
import com.askinmall.domain.OrderVO;

public interface AdOrderMapper {
	
	List<OrderVO> orderList(@Param("cri") Criteria cri, @Param("sDate") String sDate, @Param("eDate") String eDate);
	
	int getTotal(@Param("cri") Criteria cri, @Param("sDate") String sDate, @Param("eDate") String eDate);
	
	List<OrderInfoVO> orderInfo(Long ord_no);
	
	// 주문 상세 상품 삭제
	void deleteOrderInfoProd(@Param("ord_no") Long ord_no, @Param("prod_no") Integer prod_no, @Param("ord_detail_amount") int ord_detail_amount);
	// 결제정보 수정
	void modifyPayment(@Param("ord_no") Long ord_no, @Param("ord_detail_amount") int ord_detail_amount);
	// 주문정보 수정
	void modifyOrder(@Param("ord_no") Long ord_no, @Param("ord_detail_amount") int ord_detail_amount);
	
	
	// 주문 삭제
	// 1) 주문 상세 삭제
	void deleteOrderDetail(Long ord_no);
	// 2) 결제정보 삭제
	void deletePayment(Long ord_no);
	// 3) 주문정보 삭제
	void deleteOrder(Long ord_no);
	// 4) 백업 주문 테이블 저장
	void saveOrderToBackup(Long ord_no);
	
	List<OrderVO> deletedOrderList(@Param("cri") Criteria cri);
	
	int getTotalDeletedOrder(@Param("cri") Criteria cri);
	
}
