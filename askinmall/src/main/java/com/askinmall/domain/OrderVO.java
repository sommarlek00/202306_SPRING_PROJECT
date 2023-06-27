package com.askinmall.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderVO {
	
	/*
	 CREATE TABLE ORDER_TB (
    ORD_NO                  NUMBER  CONSTRAINT PK_ORD_NO        PRIMARY KEY,
    USER_ID                 VARCHAR2(15)                        NULL,
    ORD_NAME                VARCHAR2(30)						NOT NULL,
    ORD_ZIPCODE             CHAR(5) 							NOT NULL,
    ORD_ADDR                VARCHAR2(50)						NOT NULL,
    ORD_ADDR_DETAIL         VARCHAR2(50)						NOT NULL,
    ORD_PHONE               VARCHAR2(15)						NOT NULL,
    ORD_TOTAL_AMOUNT        NUMBER                              NOT NULL,
    ORD_DATE                DATE    DEFAULT SYSDATE             NOT NULL
	);
	 */

	private Long ord_no;
	private String user_id;
	private String ord_name;
	private String ord_zipcode;
	private String ord_addr;
	private String ord_addr_detail;
	private String ord_phone;
	private int ord_total_amount;
	private Date ord_date;
	private String pay_method;
	
}
