package com.askinmall.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminVO {
	
	/*
	CREATE TABLE ADMIN_TB (
		    ADMIN_ID    VARCHAR2(15) CONSTRAINT PK_ADMIN_ID    PRIMARY KEY,
		    ADMIN_PASSWORD    CHAR(60)    NOT NULL,
		    ADMIN_LOGIN_DATE    DATE
		);
	*/
	
	private String admin_id;
	private String admin_password;
	private Date   admin_login_date;
	
}
