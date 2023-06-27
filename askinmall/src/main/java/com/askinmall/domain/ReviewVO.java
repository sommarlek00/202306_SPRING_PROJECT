package com.askinmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	
	/*
	 CREATE TABLE REVIEW_TB (
    REVIEW_NO               NUMBER    CONSTRAINT PK_REVIEW_NO PRIMARY KEY,
    USER_ID       	        VARCHAR2(15)                        NULL,
    PROD_NO                 NUMBER                              NULL,
    REVIEW_CONTENT          VARCHAR2(200)                       NOT NULL,
    REVIEW_RATING           NUMBER                              NOT NULL,
    UPLOAD_DATE             DATE    DEFAULT SYSDATE             NOT NULL,
    FOREIGN KEY(USER_ID) REFERENCES USER_TB(USER_ID),
    FOREIGN KEY(PROD_NO) REFERENCES PRODUCT_TB(PROD_NO)
	);
	 */

	
	private Long review_no;
	private String user_id;
	private int prod_no;
	private String review_content;
	private int review_rating;
	private Date upload_date;
	
}
