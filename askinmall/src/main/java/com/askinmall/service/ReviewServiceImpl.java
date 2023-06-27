package com.askinmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.askinmall.domain.Criteria;
import com.askinmall.domain.ReviewVO;
import com.askinmall.mapper.ReviewMapper;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_ = {@Autowired})
	private ReviewMapper reviewMapper;

	@Override
	public List<ReviewVO> reviewList(Criteria cri, int prod_no) {
		return reviewMapper.reviewList(cri, prod_no);
	}

	@Override
	public int getTotal(int prod_no) {
		return reviewMapper.getTotal(prod_no);
	}

	@Override
	public void insertReview(ReviewVO vo) {
		reviewMapper.insertReview(vo);
	}

	@Override
	public void modfiyReview(ReviewVO vo) {
		reviewMapper.modfiyReview(vo);
	}

	@Override
	public void deleteReview(Long review_no) {
		reviewMapper.deleteReview(review_no);
	}

	
}
