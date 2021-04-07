
/* Drop Tables */

DROP TABLE CFR_TRRSRT CASCADE CONSTRAINTS;
DROP TABLE CMMN_CODE CASCADE CONSTRAINTS;
DROP TABLE EVL CASCADE CONSTRAINTS;
DROP TABLE RESVE CASCADE CONSTRAINTS;
DROP TABLE CSTMR CASCADE CONSTRAINTS;
DROP TABLE HIST CASCADE CONSTRAINTS;
DROP TABLE HOTEL_OPTN CASCADE CONSTRAINTS;
DROP TABLE RUM_OPTN CASCADE CONSTRAINTS;
DROP TABLE RUM CASCADE CONSTRAINTS;
DROP TABLE HOTEL CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE CFR_TRRSRT
(
	TRRSRT_NO varchar2(4) NOT NULL,
	TRRSRT_NM varchar2(45) NOT NULL,
	TRRSRT_ADRES varchar2(120) NOT NULL,
	TRRSRT_PHOTO varchar2(300),
	PRIMARY KEY (TRRSRT_NO)
);


CREATE TABLE CMMN_CODE
(
	CMMN_CODE_NO varchar2(4) NOT NULL,
	CMMN_CODE_NM varchar2(25),
	PRIMARY KEY (CMMN_CODE_NO)
);


CREATE TABLE CSTMR
(
	CSTMR_NO varchar2(8) NOT NULL,
	CSTMR_EMAIL varchar2(40) NOT NULL,
	CSTMR_PASSWORD varchar2(13) NOT NULL,
	CSTMR_NM varchar2(30) NOT NULL,
	CSTMR_TELNO varchar2(11) NOT NULL,
	CSTMR_SRBDE varchar2(8),
	CSTMRGRAD_CODE varchar2(4) NOT NULL,
	MLG number(7,0) NOT NULL,
	SECSN_AT char NOT NULL,
	MNGR_AT char NOT NULL,
	PRIMARY KEY (CSTMR_NO)
);


CREATE TABLE EVL
(
	EVL_NO varchar2(8) NOT NULL,
	HOTEL_NO varchar2(6) NOT NULL,
	CSTMR_NO varchar2(8) NOT NULL,
	EVL_SCORE varchar2(1) NOT NULL,
	EVL_CN varchar2(500) NOT NULL,
	PRIMARY KEY (EVL_NO)
);


CREATE TABLE HIST
(
	CSTMR_NO_RGSDE varchar2(30) NOT NULL,
	DATA varchar2(300),
	PRIMARY KEY (CSTMR_NO_RGSDE)
);


CREATE TABLE HOTEL
(
	HOTEL_NO varchar2(6) NOT NULL,
	HOTEL_NM varchar2(50) NOT NULL,
	HOTEL_ADRES varchar2(120) NOT NULL,
	HOTEL_TELNO varchar2(11) NOT NULL,
	HOTEL_INTRCN varchar2(500),
	HOTEL_HMPG varchar2(40),
	HOTEL_PHOTO varchar2(300),
	PRIMARY KEY (HOTEL_NO)
);


CREATE TABLE HOTEL_OPTN
(
	HOTEL_NO varchar2(6) NOT NULL,
	HOTEL_OPTN_NO varchar2(4) NOT NULL,
	PRIMARY KEY (HOTEL_NO, HOTEL_OPTN_NO)
);


CREATE TABLE RESVE
(
	RESVE_NO varchar2(11) NOT NULL,
	CSTMR_NO varchar2(8) NOT NULL,
	RUM_NO varchar2(9) NOT NULL,
	SETLEDE varchar2(8) NOT NULL,
	SETLE_MN_CODE varchar2(4) NOT NULL,
	RESVE_PC number(7,0) NOT NULL,
	CHKIN_DATE varchar2(8) NOT NULL,
	CHCKT_DATE varchar2(8) NOT NULL,
	CANCL_AT char NOT NULL,
	FRST_UPDDE varchar2(10) NOT NULL,
	LAST_UPDDE varchar2(10) NOT NULL,
	FRST_UPDT_ID varchar2(8) NOT NULL,
	LAST_UPDT_ID varchar2(8) NOT NULL,
	PRIMARY KEY (RESVE_NO)
);


CREATE TABLE RUM
(
	RUM_NO varchar2(9) NOT NULL,
	HOTEL_NO varchar2(6) NOT NULL,
	RUM_NM varchar2(50) NOT NULL,
	RUM_PC number(7,0) NOT NULL,
	RUM_NMPR varchar2(2) NOT NULL,
	RUM_PHOTO varchar2(300),
	RUM_MG varchar2(3) NOT NULL,
	RESVE_CO number(8) NOT NULL,
	PRIMARY KEY (RUM_NO)
);


CREATE TABLE RUM_OPTN
(
	RUM_NO varchar2(9) NOT NULL,
	RUM_OPTN_CODE varchar2(4) NOT NULL,
	PRIMARY KEY (RUM_NO, RUM_OPTN_CODE)
);



/* Create Foreign Keys */

ALTER TABLE EVL
	ADD FOREIGN KEY (CSTMR_NO)
	REFERENCES CSTMR (CSTMR_NO)
;


ALTER TABLE RESVE
	ADD FOREIGN KEY (CSTMR_NO)
	REFERENCES CSTMR (CSTMR_NO)
;


ALTER TABLE EVL
	ADD FOREIGN KEY (HOTEL_NO)
	REFERENCES HOTEL (HOTEL_NO)
;


ALTER TABLE HOTEL_OPTN
	ADD FOREIGN KEY (HOTEL_NO)
	REFERENCES HOTEL (HOTEL_NO)
;


ALTER TABLE RUM
	ADD FOREIGN KEY (HOTEL_NO)
	REFERENCES HOTEL (HOTEL_NO)
;


ALTER TABLE RESVE
	ADD FOREIGN KEY (RUM_NO)
	REFERENCES RUM (RUM_NO)
;


ALTER TABLE RUM_OPTN
	ADD FOREIGN KEY (RUM_NO)
	REFERENCES RUM (RUM_NO)
;


