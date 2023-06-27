package com.askinmall.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartListDTO {
	
	private int no;
	private Long cart_no;
	private int prod_no;
	private String prod_img;
	private String prod_upload_folder;
	private String prod_name;
	private int prod_price;
	private int cart_qty;
	private int unitprice;

}
