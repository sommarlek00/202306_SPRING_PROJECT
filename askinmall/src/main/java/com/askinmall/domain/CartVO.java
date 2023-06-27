package com.askinmall.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartVO {
	
	/*
	 CREATE TABLE CART_TB (
    CART_NO                 NUMBER  CONSTRAINT PK_CART_NO      PRIMARY KEY,
    PROD_NO                 NUMBER                             NULL,
    USER_ID                 VARCHAR2(15)                       NULL,
    CART_QTY                NUMBER                             NOT NULL,
    FOREIGN KEY(PROD_NO) REFERENCES PRODUCT_TB(PROD_NO),
    FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID)
	);
	 */

	private Long cart_no;
	private Integer prod_no;
	private String user_id;
	private int cart_qty;
}
