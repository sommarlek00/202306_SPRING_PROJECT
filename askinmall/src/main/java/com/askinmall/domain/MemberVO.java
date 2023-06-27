package com.askinmall.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
	
	/*
	 CREATE TABLE USER_TB (
    USER_ID       			VARCHAR2(15) CONSTRAINT PK_USER_ID	PRIMARY KEY,
    USER_PASSWORD           CHAR(60)						    NOT NULL,
    USER_NAME              	VARCHAR2(30)						NOT NULL,
    USER_ZIPCODE         	CHAR(5) 							NOT NULL,
    USER_ADDR              	VARCHAR2(100)						NOT NULL,
    USER_ADDR_DETAIL        VARCHAR2(100)						NOT NULL,
    USER_PHONE            	VARCHAR2(15)						NOT NULL,
    USER_NICKNAME           VARCHAR2(30)						NOT NULL UNIQUE,
    USER_EMAIL             	VARCHAR2(50)						NOT NULL,
    USER_EMAIL_STATE      	CHAR(1)	DEFAULT 'Y'					NOT NULL,
    SIGNUP_DATE      	    DATE  DEFAULT SYSDATE               NOT NULL,
    UPDATE_DATE             DATE  DEFAULT SYSDATE	            NOT NULL,
    LOGIN_DATE   	        DATE  DEFAULT SYSDATE               NOT NULL
);

	 */
	
	private String user_id;
	private String user_password;
	private String user_name;
	private String user_zipcode;
	private String user_addr;
	private String user_addr_detail;
	private String user_phone;
	private String user_nickname;
	private String user_email;
	private String user_email_state;
	private Date signup_date;
	private Date update_date;
	private Date login_date;

}
