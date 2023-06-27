package com.askinmall.service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.askinmall.mapper.StatChartMapper;

import lombok.Setter;

@Service
public class StatChartServiceImpl implements StatChartService {

	@Setter(onMethod_ = {@Autowired})
	private StatChartMapper statChartMapper;

	@Override
	public JSONObject firstCategorySales() {

		List<Map<String, Object>> list = statChartMapper.firstCategorySales();
		
		JSONObject data = new JSONObject();
		
		JSONArray title = new JSONArray();
		
		JSONObject col1 = new JSONObject();
		col1.put("label", "1차카테고리이름");
		col1.put("type", "string");
		
		JSONObject col2 = new JSONObject();
		col2.put("label", "주문금액");
		col2.put("type", "number");
		
		title.add(col1);
		title.add(col2);
		
		data.put("cols", title);
		
		
		JSONArray body = new JSONArray();
		for(Map<String, Object> map : list) {
			JSONArray row = new JSONArray();
			
			JSONObject categoryName = new JSONObject();
			categoryName.put("v", map.get("categoryName"));
			
			JSONObject orderPrice = new JSONObject();
			orderPrice.put("v", map.get("orderPrice"));
			
			row.add(categoryName);
			row.add(orderPrice);
			
			JSONObject cell = new JSONObject();
			cell.put("c", row);
			
			body.add(cell);
		}
		
		data.put("rows", body);
		return data;
	}

	@Override
	public JSONObject monthlySales() {
		
		List<Map<String, Object>> list = statChartMapper.monthlySales();
		
		JSONObject data = new JSONObject();
		
		JSONArray title = new JSONArray();
		
		JSONObject col1 = new JSONObject();
		col1.put("label", "월별");
		col1.put("type", "string");
		
		JSONObject col2 = new JSONObject();
		col2.put("label", "주문건수");
		col2.put("type", "number");
		
		title.add(col1);
		title.add(col2);
		
		data.put("cols", title);
		
		JSONArray body = new JSONArray();
		for(Map<String, Object> map : list) {
			JSONArray row = new JSONArray();
			
			JSONObject payDate = new JSONObject();
			payDate.put("v", map.get("payDate"));
			
			JSONObject cnt = new JSONObject();
			cnt.put("v", map.get("cnt"));
			
			row.add(payDate);
			row.add(cnt);
			
			JSONObject cell = new JSONObject();
			cell.put("c", row);
			
			body.add(cell);
		}
		
		data.put("rows", body);
		
		return data;
	}

	@Override
	public JSONObject bestSellingProd() {

		List<Map<String, Object>> list = statChartMapper.bestSellingProd();
		
		JSONObject data = new JSONObject();
		
		JSONArray title = new JSONArray();
		
		JSONObject col1 = new JSONObject();
		col1.put("label", "상품명");
		col1.put("type", "string");
		
		JSONObject col2 = new JSONObject();
		col2.put("label", "판매량");
		col2.put("type", "number");
		
		JSONObject col3 = new JSONObject();
		col3.put("label", "상품금액");
		col3.put("type", "number");
		
		title.add(col1);
		title.add(col2);
		title.add(col3);
		
		data.put("cols", title);
		
		JSONArray body = new JSONArray();
		for(Map<String, Object> map : list) {
			JSONArray row = new JSONArray();
			
			JSONObject prodName = new JSONObject();
			prodName.put("v", map.get("prodName"));
			
			JSONObject sellAmount = new JSONObject();
			sellAmount.put("v", map.get("sellAmount"));
			
			JSONObject prodPrice = new JSONObject();
			prodPrice.put("v", map.get("prodPrice"));
			
			row.add(prodName);
			row.add(sellAmount);
			row.add(prodPrice);
			
			JSONObject cell = new JSONObject();
			cell.put("c", row);
			
			body.add(cell);
		}
		
		data.put("rows", body);
		
		return data;
	}
	
	
}
