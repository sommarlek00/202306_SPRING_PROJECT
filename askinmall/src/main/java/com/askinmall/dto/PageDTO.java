package com.askinmall.dto;

import com.askinmall.domain.Criteria;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	private Criteria cri;
	
	public PageDTO(int total, Criteria cri) {
		this.cri = cri;
		this.total = total;
		
		int pageSize = 10;
		int endPageInfo = pageSize -1;
		
		this.endPage = (int) Math.ceil(cri.getPageNum() / (double) pageSize) * pageSize;
		
		this.startPage = this.endPage - endPageInfo;
		int realEnd = (int) Math.ceil((total * 1.0) / cri.getAmount());
		if(realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
