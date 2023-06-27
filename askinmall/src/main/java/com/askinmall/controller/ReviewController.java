package com.askinmall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.askinmall.domain.Criteria;
import com.askinmall.domain.MemberVO;
import com.askinmall.domain.ReviewVO;
import com.askinmall.dto.PageDTO;
import com.askinmall.service.ReviewService;

import lombok.Setter;

@RestController
@RequestMapping("/review/*")
public class ReviewController {
	
	@Setter(onMethod_ = {@Autowired})
	private ReviewService reviewService;
	
	
	// 사용자 페이지
	// 상품 후기
	@GetMapping("/list/{prod_no}/{page}")
	public ResponseEntity<Map<String, Object>> reviewList(@PathVariable("prod_no")int prod_no, @PathVariable("page") int page){
		
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		Criteria cri = new Criteria();
		cri.setPageNum(page);
		
		List<ReviewVO> list = reviewService.reviewList(cri, prod_no);
		map.put("list", list);
		
		PageDTO pageMaker = new PageDTO(reviewService.getTotal(prod_no), cri);
		map.put("pageMaker", pageMaker);
		
		entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		return entity;
	}
	
	
	// 상품후기 입력
	@PostMapping(value = "/insertReview", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertReview(@RequestBody ReviewVO vo, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		String user_id  = ((MemberVO) session.getAttribute("loginStatus")).getUser_id();
		vo.setUser_id(user_id);
		
		reviewService.insertReview(vo);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		return entity;
	}
	
	
	// 상품후기 수정
	@PatchMapping(value = "/modfiyReview", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modfiyReview(@RequestBody ReviewVO vo, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		reviewService.modfiyReview(vo);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		return entity;
	}
	
	
	// 상품후기 삭제
	@DeleteMapping(value = "/deleteReview/{review_no}")
	public ResponseEntity<String> deleteReview(@PathVariable("review_no") Long review_no, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		reviewService.deleteReview(review_no);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		return entity;
	}

	
}
