package com.askinmall.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CategoryVO {
	
	/*
	 CREATE TABLE CATEGORY_TB (
    CATEGORY_CD            	NUMBER CONSTRAINT PK_CATEGORY_CD  PRIMARY KEY,
    CATEGORY_CD_PRT     	NUMBER                            NULL,                                       
    CATEGORY_NAME           VARCHAR2(50)         	          NOT NULL,
    FOREIGN KEY(CATEGORY_CD_PRT) REFERENCES CATEGORY_TB(CATEGORY_CD)
	);  
	 */

	private Integer category_cd;
	private int category_cd_prt;
	private String category_name;
	
}
