package com.askinmall.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductVO {
	
	/*
	 CREATE TABLE PRODUCT_TB (
    PROD_NO      			NUMBER	CONSTRAINT PK_PROD_NO   	PRIMARY KEY,
    CATEGORY_CD				NUMBER                              NULL,
    PROD_NAME				VARCHAR2(50)						NOT NULL,
    PROD_PRICE				NUMBER								NOT NULL,
    PROD_DISCOUNT			NUMBER								NOT NULL,
    PROD_COMPANY			VARCHAR2(50)						NOT NULL,
    PROD_DETAIL				VARCHAR2(4000)  					NOT NULL,
    PROD_UPLOAD_FOLDER      VARCHAR2(50)                        NOT NULL,  
    PROD_IMG				VARCHAR2(50)						NOT NULL,
    PROD_STOCK			    NUMBER								NOT NULL,    
    PROD_BUY_STATE  		CHAR(1)								NOT NULL,
    UPLOAD_DATE		        DATE DEFAULT SYSDATE		        NOT NULL,
    UPDATE_DATE			    DATE DEFAULT SYSDATE		        NOT NULL,
    FOREIGN KEY(CATEGORY_CD) REFERENCES CATEGORY_TB(CATEGORY_CD)
	);
	 */
	
	private Integer prod_no;
	private int category_cd;
	private String prod_name;
	private int prod_price;
	private int prod_discount;
	private String prod_detail;
	private String prod_company;
	private String prod_upload_folder;
	private String prod_img;
	private int prod_stock;
	private String prod_buy_state;
	private Date upload_date;
	private Date update_date;
	
	private MultipartFile uploadFile;

}
