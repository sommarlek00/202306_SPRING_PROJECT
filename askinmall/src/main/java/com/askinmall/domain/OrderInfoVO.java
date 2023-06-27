package com.askinmall.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderInfoVO {
	
	private Long ord_no;
	private Integer prod_no;
	private int ord_detail_qty;
	private int ord_detail_amount;
	private String prod_name;
	private String prod_upload_folder;
	private String prod_img;

}
