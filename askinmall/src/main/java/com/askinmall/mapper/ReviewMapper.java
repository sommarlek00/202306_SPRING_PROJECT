package com.askinmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.askinmall.domain.Criteria;
import com.askinmall.domain.ReviewVO;

public interface ReviewMapper {

	List<ReviewVO> reviewList(@Param("cri") Criteria cri, @Param("prod_no") int prod_no);
	
	int getTotal(int prod_no);
	
	void insertReview(ReviewVO vo);
	
	void modfiyReview(ReviewVO vo);
	
	void deleteReview(Long review_no);
}
