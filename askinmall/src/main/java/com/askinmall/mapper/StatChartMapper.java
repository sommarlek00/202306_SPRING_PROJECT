package com.askinmall.mapper;

import java.util.List;
import java.util.Map;

public interface StatChartMapper {
	
	List<Map<String, Object>> firstCategorySales();

	List<Map<String, Object>> monthlySales();
	
	List<Map<String, Object>> bestSellingProd();
	
}
