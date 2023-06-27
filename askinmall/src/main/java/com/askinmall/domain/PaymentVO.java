package com.askinmall.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PaymentVO {
	
	/*
	  CREATE TABLE PAYMENT_TB(
    PAY_NO      NUMBER CONSTRAINT PK_PAY_NO PRIMARY KEY,
    ORD_NO      NUMBER NOT NULL,
    USER_ID     VARCHAR2(15) NOT NULL,
    PAY_METHOD  VARCHAR2(15) NOT NULL,
    PAY_PRICE   NUMBER NOT NULL,
    PAY_USER    VARCHAR2(15) NOT NULL,
    PAY_BANK    VARCHAR2(50) NOT NULL,
    PAY_DATE    DATE  DEFAULT SYSDATE,
    PAY_MEMO    VARCHAR2(100) NULL
	);
	 */
	
	private Integer pay_no;
	private long ord_no;
	private String user_id;
	private String pay_method;
	private int pay_price;
	private String pay_user;
	private String pay_bank;
	private Date pay_date;
	private String pay_memo;

}
