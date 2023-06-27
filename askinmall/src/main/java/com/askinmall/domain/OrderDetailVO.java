package com.askinmall.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderDetailVO {
	
	/*
	 CREATE TABLE ORDER_DETAIL_TB (
    ORD_NO                  NUMBER      NOT NULL REFERENCES ORDER_TB(ORD_NO),
    PROD_NO                 NUMBER     NOT NULL REFERENCES PRODUCT_TB(PROD_NO),
    ORD_DETAIL_QTY          NUMBER                              NOT NULL,
    ORD_DETAIL_AMOUNT       NUMBER                              NOT NULL,
    CONSTRAINTS PK_ORD_DETAIL PRIMARY KEY(ORD_NO, PROD_NO)
	);
	 */
	
	private Long ord_no;
	private int prod_no;
	private int ord_detail_qty;
	private int ord_detail_amount;

}
