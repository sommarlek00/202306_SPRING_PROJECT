package com.askinmall.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.askinmall.service.StatChartService;

import lombok.Setter;

@Controller
@RequestMapping("/admin/chart/*")
public class StatChartController {
	
	@Setter(onMethod_ = {@Autowired})
	private StatChartService statChartService;
	
	
	// 관리자 기능
	// 차트 페이지
	@GetMapping("/chartList")
	public void chartList() {
	}
	
	
	// 1차 카테고리 별 판매
	@ResponseBody
	@GetMapping("/firstCategorySales")
	public ResponseEntity<JSONObject> firstCategorySales(){
		ResponseEntity<JSONObject> entity = null;
		
		entity = new ResponseEntity<JSONObject>(statChartService.firstCategorySales(), HttpStatus.OK);
		return entity;
	}
	
	
	// 월별 판매
	@ResponseBody
	@GetMapping("/monthlySales")
	public ResponseEntity<JSONObject> monthlySales(){
		ResponseEntity<JSONObject> entity = null;
		entity = new ResponseEntity<JSONObject>(statChartService.monthlySales(), HttpStatus.OK);
		
		return entity;
	}
	
	
	// 인기 판매 상품
	@ResponseBody
	@GetMapping("/bestSellingProd")
	public ResponseEntity<JSONObject> bestSellingProd(){
		ResponseEntity<JSONObject> entity = null;
		entity = new ResponseEntity<JSONObject>(statChartService.bestSellingProd(), HttpStatus.OK);
		return entity;
	}
	

}
