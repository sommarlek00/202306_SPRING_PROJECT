package com.askinmall.service;

import org.json.simple.JSONObject;

public interface StatChartService {
	
	JSONObject firstCategorySales();
	
	JSONObject monthlySales();
	
	JSONObject bestSellingProd();
	
}
