package com.askinmall.kakaopay;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReadyResponse {
	
	private String tid;
	private String next_redirect_pc_url;

}
