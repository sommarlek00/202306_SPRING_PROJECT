package com.askinmall.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.askinmall.kakaopay.ApproveResponse;
import com.askinmall.kakaopay.ReadyResponse;

@Service
public class KakaoPayService {
	
	// 결제 준비 요청
	public ReadyResponse payReady(String cid, Long partner_order_id, String partner_user_id, String item_name,
								  int quantity, int total_amount, int tax_free_amount,
								  String approval_url, String cancel_url, String fail_url) {
		
		String url = "https://kapi.kakao.com/v1/payment/ready";
		
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", cid);
		parameters.add("partner_order_id", String.valueOf(partner_order_id));
		parameters.add("partner_user_id", partner_user_id);
		parameters.add("item_name", item_name);
		parameters.add("quantity", String.valueOf(quantity));
		parameters.add("total_amount", String.valueOf(total_amount));
		parameters.add("tax_free_amount", "0");
		parameters.add("approval_url", approval_url);
		parameters.add("cancel_url", cancel_url);
		parameters.add("fail_url", fail_url);
		
		System.out.println("파라미터 확인: " + parameters);
		
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String,String>>(parameters, getHeaders());
		
		RestTemplate template = new RestTemplate();
		ReadyResponse readyResponse = template.postForObject(url, requestEntity, ReadyResponse.class);
		
		return readyResponse;
	}
	
	
	// 결제 승인 요청
	public ApproveResponse payApprove(String cid, String tid, long partner_order_id, String partner_user_id, String pg_token) {
		
		String url = "https://kapi.kakao.com/v1/payment/approve";
		
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", cid);
		parameters.add("tid", tid);
		parameters.add("partner_order_id", String.valueOf(partner_order_id));
		parameters.add("partner_user_id", partner_user_id);
		parameters.add("pg_token", pg_token);
		
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String,String>>(parameters, getHeaders());
		
		RestTemplate template = new RestTemplate();
		ApproveResponse approveResponse = template.postForObject(url, requestEntity, ApproveResponse.class);
		
		return approveResponse;
	}
	
	
	// 공통 헤더 정보
	private HttpHeaders getHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK 6652a814467595d8b41874b8f602a913");
		headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		return headers;
	}
	
}
