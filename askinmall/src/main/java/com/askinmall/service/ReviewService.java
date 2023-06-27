package com.askinmall.service;

import java.util.List;

import com.askinmall.domain.Criteria;
import com.askinmall.domain.ReviewVO;

public interface ReviewService {

	List<ReviewVO> reviewList(Criteria cri, int prod_no);
	
	int getTotal(int prod_no);
	
	void insertReview(ReviewVO vo);
	
	void modfiyReview(ReviewVO vo);
	
	void deleteReview(Long review_no);
	
}
