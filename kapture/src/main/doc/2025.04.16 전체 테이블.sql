--------------------------------------------------------
--  파일이 생성됨 - 수요일-4월-16-2025   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ADMIN_LOGS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."ADMIN_LOGS" 
   (	"LOG_ID" NUMBER, 
	"USER_NO" NUMBER, 
	"ACTION" VARCHAR2(100 BYTE), 
	"DETAILS" VARCHAR2(1000 BYTE), 
	"E_CREATED_AT" TIMESTAMP (6) DEFAULT SYSDATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table AREA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AREA" 
   (	"SI" VARCHAR2(100 BYTE), 
	"GU" VARCHAR2(100 BYTE), 
	"DONG" VARCHAR2(100 BYTE), 
	"NX" VARCHAR2(20 BYTE), 
	"NY" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BASKET
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."BASKET" 
   (	"BASKET_NO" NUMBER, 
	"TOUR_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"NUM_PEOPLE" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BOOKINGS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."BOOKINGS" 
   (	"BOOKING_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"TOUR_NO" NUMBER, 
	"BOOKING_DATE" DATE, 
	"TOTAL_PRICE" NUMBER, 
	"B_CREATED_AT" DATE DEFAULT SYSDATE, 
	"B_UPDATED_AT" DATE DEFAULT SYSDATE, 
	"PEOPLE" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FAQ
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."FAQ" 
   (	"FAQ_NO" NUMBER, 
	"CATEGORY" VARCHAR2(100 BYTE), 
	"QUESTION" VARCHAR2(1000 BYTE), 
	"ANSWER" VARCHAR2(1000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table GUIDE_IMG
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."GUIDE_IMG" 
   (	"P_FILE_NO" NUMBER, 
	"P_GUIDE_NO" NUMBER, 
	"P_FILE_PATH" VARCHAR2(100 BYTE), 
	"P_FILE_NAME" VARCHAR2(255 BYTE), 
	"P_FILE_ORG_NAME" VARCHAR2(255 BYTE), 
	"P_FILE_SIZE" VARCHAR2(255 BYTE), 
	"P_FILE_TYPE" VARCHAR2(255 BYTE), 
	"P_FILE_EXTENSION" VARCHAR2(255 BYTE), 
	"P_UPLOAD_DATE" VARCHAR2(255 BYTE) DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table GUIDE_SCHEDULES
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."GUIDE_SCHEDULES" 
   (	"SCHEDULE_NO" NUMBER, 
	"GUIDE_NO" NUMBER, 
	"TOUR_NO" NUMBER, 
	"SCHEDULE_DATE" DATE, 
	"STATUS" VARCHAR2(20 BYTE) DEFAULT 'AVAILABLE'
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table GUIDES
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."GUIDES" 
   (	"GUIDE_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"LANGUAGE" VARCHAR2(200 BYTE), 
	"EXPERIENCE" VARCHAR2(1000 BYTE), 
	"G_CREATED_AT" DATE DEFAULT SYSDATE, 
	"G_UPDATED_AT" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table IMG
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."IMG" 
   (	"FILE_NO" NUMBER, 
	"TOUR_NO" NUMBER, 
	"FILE_PATH" VARCHAR2(100 BYTE), 
	"FILE_NAME" VARCHAR2(100 BYTE), 
	"FILE_ORG_NAME" VARCHAR2(100 BYTE), 
	"FILE_TYPE" VARCHAR2(100 BYTE), 
	"FILE_SIZE" VARCHAR2(100 BYTE), 
	"FILE_EXTENSION" VARCHAR2(100 BYTE), 
	"I_UPLOAD_DATE" VARCHAR2(100 BYTE) DEFAULT SYSDATE, 
	"THUMBNAIL" VARCHAR2(20 BYTE) DEFAULT 'N'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table INQUIRIES
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."INQUIRIES" 
   (	"INQUIRY_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"CATEGORY" VARCHAR2(50 BYTE), 
	"QUESTION" VARCHAR2(1000 BYTE), 
	"ANSWER" VARCHAR2(1000 BYTE), 
	"INQ_CREATED_AT" DATE DEFAULT SYSDATE, 
	"INQ_UPDATED_AT" DATE DEFAULT SYSDATE, 
	"QNA_TITLE" VARCHAR2(200 BYTE), 
	"QNA_STATUS" VARCHAR2(50 BYTE) DEFAULT '답변대기'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table NOTICES
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."NOTICES" 
   (	"NOTICE_NO" NUMBER, 
	"TITLE" VARCHAR2(255 BYTE), 
	"CONTENT" VARCHAR2(1000 BYTE), 
	"N_CREATED_AT" DATE DEFAULT SYSDATE, 
	"N_UPDATED_AT" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PARTNERSHIP
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."PARTNERSHIP" 
   (	"PARTNERSHIP_NO" NUMBER, 
	"TITLE" VARCHAR2(100 BYTE), 
	"CONTENT" VARCHAR2(1000 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"EMAIL" VARCHAR2(50 BYTE), 
	"PHONE" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PAYMENTS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."PAYMENTS" 
   (	"PAYMENT_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"TOUR_NO" NUMBER, 
	"AMOUNT" NUMBER, 
	"PAYMENT_DATE" DATE DEFAULT SYSDATE, 
	"PAYMENT_STATUS" VARCHAR2(20 BYTE), 
	"METHOD" VARCHAR2(20 BYTE), 
	"MERCHANT_ID" VARCHAR2(50 BYTE), 
	"NUM_PEOPLE" NUMBER, 
	"BASKET_NO" NUMBER, 
	"ETC" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PROMOTIONS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."PROMOTIONS" 
   (	"PROMO_ID" NUMBER, 
	"CODE" VARCHAR2(100 BYTE), 
	"DISCOUNT" NUMBER, 
	"EXPIRY_DATE" DATE, 
	"STATUS" VARCHAR2(20 BYTE) DEFAULT 'ACTIVE'
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REGION
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REGION" 
   (	"SI_NAME" VARCHAR2(50 BYTE), 
	"SI_NO" NUMBER(*,0), 
	"GU_NAME" VARCHAR2(50 BYTE), 
	"GU_NO" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REQUEST_COMMENTS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REQUEST_COMMENTS" 
   (	"COMMENT_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"REQUEST_NO" NUMBER, 
	"MESSAGE" VARCHAR2(1000 BYTE), 
	"RQC_CREATED_AT" DATE DEFAULT SYSTIMESTAMP, 
	"RQC_UPDATED_AT" DATE DEFAULT SYSTIMESTAMP, 
	"PARENT_COMMENT_NO" NUMBER, 
	"DELETEYN" VARCHAR2(20 BYTE) DEFAULT 'N'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REQUESTS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REQUESTS" 
   (	"REQUEST_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"TITLE" VARCHAR2(255 BYTE), 
	"REGION" VARCHAR2(255 BYTE), 
	"BUDGET" NUMBER, 
	"STATUS" VARCHAR2(20 BYTE) DEFAULT NULL, 
	"RQ_CREATED_AT" DATE DEFAULT SYSTIMESTAMP, 
	"RQ_UPDATED_AT" DATE DEFAULT SYSTIMESTAMP, 
	"DESCRIPTION" CLOB, 
	"CURRENCY" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("DESCRIPTION") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "SYSTEM"."REQUESTS"."STATUS" IS '0 : 답변대기, 1 : 답변중, 2 : 답변완료';
--------------------------------------------------------
--  DDL for Table REVIEWS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REVIEWS" 
   (	"REVIEW_NO" NUMBER, 
	"TOUR_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"RATING" NUMBER, 
	"COMMENT" VARCHAR2(500 BYTE), 
	"R_CREATED_AT" DATE DEFAULT SYSDATE, 
	"R_UPDATED_AT" DATE DEFAULT SYSDATE, 
	"TITLE" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TERMS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."TERMS" 
   (	"TERMS_ID" NUMBER, 
	"TITLE" VARCHAR2(100 BYTE), 
	"CONTENT" CLOB, 
	"TE_UPDATED_AT" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("CONTENT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table THEME
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."THEME" 
   (	"THEME_NO" NUMBER, 
	"THEME_NAME" VARCHAR2(20 BYTE), 
	"THEME_PARENT_NO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TOURS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."TOURS" 
   (	"TOUR_NO" NUMBER, 
	"GUIDE_NO" NUMBER, 
	"TITLE" VARCHAR2(255 BYTE), 
	"DURATION" VARCHAR2(20 BYTE), 
	"PRICE" NUMBER, 
	"MAX_PEOPLE" NUMBER, 
	"TOUR_DATE" DATE, 
	"T_CREATED_AT" DATE DEFAULT SYSDATE, 
	"T_UPDATED_AT" DATE DEFAULT SYSDATE, 
	"DELETEYN" VARCHAR2(20 BYTE), 
	"SI_NO" NUMBER, 
	"GU_NO" NUMBER, 
	"THEME_NO" NUMBER, 
	"DESCRIPTION" CLOB, 
	"VEHICLE" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("DESCRIPTION") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."USERS" 
   (	"USER_NO" NUMBER, 
	"PASSWORD" VARCHAR2(200 BYTE), 
	"EMAIL" VARCHAR2(200 BYTE), 
	"PHONE" VARCHAR2(50 BYTE), 
	"ROLE" VARCHAR2(20 BYTE), 
	"BIRTHDAY" DATE, 
	"ADDRESS" VARCHAR2(200 BYTE), 
	"GENDER" VARCHAR2(20 BYTE), 
	"U_CREATED_AT" DATE DEFAULT SYSDATE, 
	"U_UPDATED_AT" DATE DEFAULT SYSDATE, 
	"USER_FIRSTNAME" VARCHAR2(50 BYTE), 
	"USER_LASTNAME" VARCHAR2(20 BYTE), 
	"SOCIAL_TYPE" VARCHAR2(50 BYTE), 
	"ISFOREIGNER" VARCHAR2(20 BYTE) DEFAULT 'Y', 
	"PUSHYN" VARCHAR2(10 BYTE) DEFAULT 'N', 
	"UNREGISTERYN" VARCHAR2(10 BYTE) DEFAULT 'N', 
	"LAST_LOGIN" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table WISHLIST
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."WISHLIST" 
   (	"TOUR_NO" NUMBER, 
	"GUIDE_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"W_CREATED_AT" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SYSTEM.ADMIN_LOGS
SET DEFINE OFF;
REM INSERTING into SYSTEM.AREA
SET DEFINE OFF;
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강북구','번2동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강북구','번3동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강북구','수유1동','60','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강북구','수유2동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강북구','수유3동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강북구','우이동','60','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강북구','인수동','60','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','도봉구',null,'61','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','도봉구','창제1동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','도봉구','창제2동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','도봉구','창제3동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','도봉구','창제4동','61','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','도봉구','창제5동','61','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','도봉구','도봉제1동','61','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','도봉구','도봉제2동','61','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','도봉구','쌍문제1동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','도봉구','쌍문제2동','61','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','도봉구','쌍문제3동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','도봉구','쌍문제4동','61','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','도봉구','방학제1동','61','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','도봉구','방학제2동','61','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','도봉구','방학제3동','61','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','노원구',null,'61','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','노원구','월계1동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','노원구','월계2동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','노원구','월계3동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','노원구','공릉1동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','노원구','공릉2동','62','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','노원구','하계1동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','노원구','하계2동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','노원구','중계본동','62','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','노원구','중계1동','62','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','노원구','중계4동','62','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','노원구','중계2.3동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','노원구','상계1동','61','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','노원구','상계2동','61','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','노원구','상계3.4동','61','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','노원구','상계5동','61','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','노원구','상계6.7동','61','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','노원구','상계8동','61','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','노원구','상계9동','61','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','노원구','상계10동','61','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','은평구',null,'59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','은평구','녹번동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','은평구','불광제1동','59','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','은평구','불광제2동','59','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','은평구','갈현제1동','59','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','은평구','갈현제2동','59','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','은평구','구산동','59','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','은평구','대조동','59','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','은평구','응암제1동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','은평구','응암제2동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','은평구','응암제3동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','은평구','역촌동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','은평구','신사제1동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','은평구','신사제2동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','은평구','증산동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','은평구','수색동','58','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','은평구','진관동','59','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서대문구',null,'59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서대문구','천연동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서대문구','북아현동','59','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서대문구','충현동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서대문구','신촌동','59','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서대문구','연희동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서대문구','홍제제1동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서대문구','홍제제3동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서대문구','홍제제2동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서대문구','홍은제1동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서대문구','홍은제2동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서대문구','남가좌제1동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서대문구','남가좌제2동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서대문구','북가좌제1동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서대문구','북가좌제2동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','마포구',null,'59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','마포구','아현동','59','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','마포구','공덕동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','마포구','도화동','59','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','마포구','용강동','59','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','마포구','대흥동','59','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','마포구','염리동','59','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','마포구','신수동','59','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','마포구','서강동','59','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','마포구','서교동','59','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','마포구','합정동','59','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','마포구','망원제1동','59','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','마포구','망원제2동','59','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','마포구','연남동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','마포구','성산제1동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','마포구','성산제2동','59','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','마포구','상암동','58','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','양천구',null,'58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','양천구','목1동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','양천구','목2동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','양천구','목3동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','양천구','목4동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','양천구','목5동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','양천구','신월1동','57','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','양천구','신월2동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','양천구','신월3동','57','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','양천구','신월4동','57','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','양천구','신월5동','57','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','양천구','신월6동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','양천구','신월7동','57','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','양천구','신정1동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','양천구','신정2동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','양천구','신정3동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','양천구','신정4동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','양천구','신정6동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','양천구','신정7동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강서구',null,'58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강서구','염창동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강서구','등촌제1동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강서구','등촌제2동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강서구','등촌제3동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강서구','화곡제1동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강서구','화곡제2동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강서구','화곡제3동','57','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강서구','화곡제4동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강서구','화곡본동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강서구','화곡제6동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강서구','화곡제8동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강서구','가양제1동','57','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강서구','가양제2동','58','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강서구','가양제3동','58','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강서구','발산제1동','57','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강서구','우장산동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강서구','공항동','57','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강서구','방화제1동','57','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강서구','방화제2동','57','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강서구','방화제3동','57','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','구로구',null,'58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','구로구','신도림동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','구로구','구로제1동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','구로구','구로제2동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','구로구','구로제3동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','구로구','구로제4동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','구로구','구로제5동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','구로구','가리봉동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','구로구','고척제1동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','구로구','고척제2동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','구로구','개봉제1동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','구로구','개봉제2동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','구로구','개봉제3동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','구로구','오류제1동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','구로구','오류제2동','57','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강동구','고덕제1동','63','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강동구','고덕제2동','63','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강동구','암사제1동','63','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강동구','암사제2동','62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강동구','암사제3동','63','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강동구','천호제1동','63','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강동구','천호제2동','62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강동구','천호제3동','62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강동구','성내제1동','62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강동구','성내제2동','62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강동구','성내제3동','63','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강동구','길동','63','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강동구','둔촌제1동','63','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강동구','둔촌제2동','63','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시',null,null,'98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','중구',null,'97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','중구','중앙동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','중구','동광동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','중구','대청동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','중구','보수동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','중구','부평동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','중구','광복동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','중구','남포동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','중구','영주제1동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','중구','영주제2동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','서구',null,'97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','서구','동대신제1동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','서구','동대신제2동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','서구','동대신제3동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','서구','서대신제1동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','서구','서대신제3동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','서구','서대신제4동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','서구','부민동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','서구','아미동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','서구','초장동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','서구','충무동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','서구','남부민제1동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','서구','남부민제2동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','서구','암남동','97','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동구',null,'98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동구','초량제1동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동구','초량제2동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동구','초량제3동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동구','초량제6동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동구','수정제1동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동구','수정제2동','97','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동구','수정제4동','97','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동구','수정제5동','97','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동구','좌천동','98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동구','범일제1동','98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동구','범일제2동','98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동구','범일제5동','98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','영도구',null,'98','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','영도구','남항동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','영도구','영선제1동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','영도구','영선제2동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','영도구','신선동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','영도구','봉래제1동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','영도구','봉래제2동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','영도구','청학제1동','98','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','영도구','청학제2동','98','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','영도구','동삼제1동','98','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','영도구','동삼제2동','98','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','영도구','동삼제3동','98','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','부산진구',null,'97','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','부산진구','부전제1동','98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','부산진구','부전제2동','98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','부산진구','연지동','97','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','부산진구','초읍동','97','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','부산진구','양정제1동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','부산진구','양정제2동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','부산진구','전포제1동','98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','부산진구','전포제2동','98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','부산진구','부암제1동','97','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','부산진구','부암제3동','97','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','부산진구','당감제1동','97','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','부산진구','당감제2동','97','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','부산진구','당감제4동','97','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','부산진구','가야제1동','97','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','부산진구','가야제2동','97','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','부산진구','개금제1동','97','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','부산진구','개금제2동','97','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','부산진구','개금제3동','97','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','부산진구','범천제1동','98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','부산진구','범천제2동','98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동래구',null,'98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동래구','수민동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동래구','복산동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동래구','명륜동','98','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동래구','온천제1동','98','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동래구','온천제2동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동래구','온천제3동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동래구','사직제1동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동래구','사직제2동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동래구','사직제3동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동래구','안락제1동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동래구','안락제2동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동래구','명장제1동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','동래구','명장제2동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','남구',null,'98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','남구','대연제1동','98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','남구','대연제3동','98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','남구','대연제4동','98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','남구','대연제5동','98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','남구','대연제6동','98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','남구','용호제1동','99','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','남구','용호제2동','99','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','남구','용호제3동','99','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','남구','용호제4동','99','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','남구','용당동','98','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','남구','감만제1동','98','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','남구','감만제2동','98','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','남구','우암동','98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','남구','문현제1동','98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','남구','문현제2동','98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','남구','문현제3동','98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','남구','문현제4동','98','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','북구',null,'96','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','북구','구포제1동','97','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','북구','구포제2동','96','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','북구','구포제3동','97','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','북구','금곡동','97','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','북구','화명제1동','97','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','북구','화명제2동','97','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','북구','화명제3동','97','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','북구','덕천제1동','97','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','북구','덕천제2동','97','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','북구','덕천제3동','97','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','북구','만덕제1동','97','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','북구','만덕제2동','97','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','북구','만덕제3동','97','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','해운대구',null,'99','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','해운대구','우제1동','99','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','해운대구','우제2동','99','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','해운대구','우제3동','99','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','해운대구','중제1동','99','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','해운대구','중제2동','100','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','해운대구','좌제1동','100','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','해운대구','좌제2동','100','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','해운대구','좌제3동','100','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','해운대구','좌제4동','100','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','해운대구','송정동','100','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','해운대구','반여제1동','99','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','해운대구','반여제2동','99','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','해운대구','반여제3동','99','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','해운대구','반여제4동','99','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','해운대구','반송제1동','99','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','해운대구','반송제2동','99','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','해운대구','재송제1동','99','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','해운대구','재송제2동','99','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사하구',null,'96','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사하구','괴정제1동','96','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사하구','괴정제2동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사하구','괴정제3동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사하구','괴정제4동','96','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사하구','당리동','96','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사하구','하단제1동','96','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사하구','하단제2동','96','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사하구','신평제1동','96','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사하구','신평제2동','96','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사하구','장림제1동','96','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사하구','장림제2동','96','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사하구','다대제1동','96','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사하구','다대제2동','96','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사하구','구평동','96','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사하구','감천제1동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사하구','감천제2동','97','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','금정구',null,'98','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','금정구','서제1동','98','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','금정구','서제2동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','금정구','서제3동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','금정구','금사회동동','98','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','금정구','부곡제1동','98','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','금정구','부곡제2동','98','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','금정구','부곡제3동','98','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','금정구','부곡제4동','98','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','금정구','장전제1동','98','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','금정구','장전제2동','98','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','금정구','선두구동','98','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','금정구','청룡노포동','98','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','금정구','남산동','98','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','금정구','구서제1동','98','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','금정구','구서제2동','98','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','금정구','금성동','97','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','강서구',null,'96','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','강서구','대저1동','96','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','강서구','대저2동','96','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','강서구','강동동','95','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','강서구','명지1동','95','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','강서구','명지2동','95','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','강서구','가락동','95','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','강서구','녹산동','94','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','강서구','가덕도동','93','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','연제구',null,'98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','연제구','거제제1동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','연제구','거제제2동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','연제구','거제제3동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','연제구','거제제4동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','연제구','연산제1동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','연제구','연산제2동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','연제구','연산제3동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','연제구','연산제4동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','연제구','연산제5동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','연제구','연산제6동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','연제구','연산제8동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','연제구','연산제9동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','수영구',null,'99','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','수영구','남천제1동','99','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','수영구','남천제2동','99','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','수영구','수영동','99','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','수영구','망미제1동','98','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','수영구','망미제2동','99','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','수영구','광안제1동','99','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','수영구','광안제2동','99','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','수영구','광안제3동','99','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','수영구','광안제4동','99','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','수영구','민락동','99','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사상구',null,'96','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사상구','삼락동','96','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사상구','모라제1동','96','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사상구','모라제3동','96','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사상구','덕포제1동','96','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사상구','덕포제2동','96','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사상구','괘법동','96','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사상구','감전동','96','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사상구','주례제1동','97','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사상구','주례제2동','97','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사상구','주례제3동','97','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사상구','학장동','96','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','사상구','엄궁동','96','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','기장군',null,'100','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','기장군','기장읍','100','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','기장군','장안읍','101','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','기장군','정관읍','100','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','기장군','일광읍','101','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('부산광역시','기장군','철마면','99','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시',null,null,'89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','중구',null,'89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','중구','동인동','89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','중구','삼덕동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','중구','성내1동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','중구','성내2동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','중구','성내3동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','중구','대신동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','중구','남산1동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','중구','남산2동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','중구','남산3동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','중구','남산4동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','중구','대봉1동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','중구','대봉2동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구',null,'90','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','신암1동','89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','신암2동','89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','신암3동','89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','신암4동','89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','신암5동','89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','신천1.2동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','신천3동','89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','신천4동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','효목1동','90','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','효목2동','90','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','도평동','90','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','불로.봉무동','90','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','지저동','90','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','동촌동','90','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','방촌동','90','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','해안동','90','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','안심1동','91','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','안심2동','90','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','안심3동','91','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','안심4동','91','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','혁신동','91','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','동구','공산동','90','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','서구',null,'88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','서구','내당1동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','서구','내당2.3동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','서구','내당4동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','서구','비산1동','88','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','서구','비산2.3동','88','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','서구','비산4동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','서구','비산5동','88','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','서구','비산6동','88','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','서구','비산7동','88','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','서구','평리1동','88','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','서구','평리2동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','서구','평리3동','88','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','서구','평리4동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','서구','평리5동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','서구','평리6동','88','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','서구','상중이동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','서구','원대동','88','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','남구',null,'89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','남구','이천동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','남구','봉덕1동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','남구','봉덕2동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','남구','봉덕3동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','남구','대명1동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','남구','대명2동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','남구','대명3동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','남구','대명4동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','남구','대명5동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','구로구','수궁동','57','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','구로구','항동','57','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','금천구',null,'59','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','금천구','가산동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','금천구','독산제1동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','금천구','독산제2동','59','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','금천구','독산제3동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','금천구','독산제4동','59','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','금천구','시흥제1동','58','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','금천구','시흥제2동','59','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','금천구','시흥제3동','59','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','금천구','시흥제4동','59','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','금천구','시흥제5동','59','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','영등포구',null,'58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','영등포구','영등포본동','59','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','영등포구','영등포동','59','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','영등포구','여의동','59','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','영등포구','당산제1동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','영등포구','당산제2동','59','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','영등포구','도림동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','영등포구','문래동','59','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','영등포구','양평제1동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','영등포구','양평제2동','58','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','영등포구','신길제1동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','영등포구','신길제3동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','영등포구','신길제4동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','영등포구','신길제5동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','영등포구','신길제6동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','영등포구','신길제7동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','영등포구','대림제1동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','영등포구','대림제2동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','영등포구','대림제3동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동작구',null,'59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동작구','노량진제1동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동작구','노량진제2동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동작구','상도제1동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동작구','상도제2동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동작구','상도제3동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동작구','상도제4동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동작구','흑석동','60','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동작구','사당제1동','60','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동작구','사당제2동','60','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동작구','사당제3동','60','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동작구','사당제4동','60','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동작구','사당제5동','60','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동작구','대방동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동작구','신대방제1동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동작구','신대방제2동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구',null,'59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구','보라매동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구','청림동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구','성현동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구','행운동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구','낙성대동','60','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구','청룡동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구','은천동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구','중앙동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구','인헌동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구','남현동','60','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구','서원동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구','신원동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구','서림동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구','신사동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구','신림동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구','난향동','59','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구','조원동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구','대학동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구','삼성동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구','미성동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','관악구','난곡동','59','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서초구',null,'61','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서초구','서초1동','61','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서초구','서초2동','61','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서초구','서초3동','60','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서초구','서초4동','61','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서초구','잠원동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서초구','반포본동','60','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서초구','반포1동','60','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서초구','반포2동','60','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서초구','반포3동','60','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서초구','반포4동','60','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서초구','방배본동','60','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서초구','방배1동','60','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서초구','방배2동','60','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서초구','방배3동','60','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서초구','방배4동','60','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서초구','양재1동','61','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서초구','양재2동','61','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','서초구','내곡동','61','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구',null,'61','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','신사동','61','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','논현1동','61','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','논현2동','61','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','압구정동','61','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','청담동','61','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','삼성1동','61','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','삼성2동','61','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','대치1동','61','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','대치2동','61','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','대치4동','61','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','역삼1동','61','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','역삼2동','61','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','도곡1동','61','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','도곡2동','61','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','개포1동','61','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','개포2동','62','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','개포3동','62','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','개포4동','61','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','세곡동','62','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','일원본동','62','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','일원1동','62','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강남구','수서동','62','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구',null,'62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','풍납1동','62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','풍납2동','62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','거여1동','63','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','거여2동','63','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','마천1동','63','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','마천2동','63','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','방이1동','62','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','방이2동','62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','오륜동','63','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','오금동','62','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','송파1동','62','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','송파2동','62','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','석촌동','62','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','삼전동','62','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','가락본동','62','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','가락1동','62','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','가락2동','62','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','문정1동','62','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','문정2동','62','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','장지동','63','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','위례동','63','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','잠실본동','62','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','잠실2동','62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','잠실3동','62','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','잠실4동','62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','잠실6동','62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','송파구','잠실7동','62','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강동구',null,'62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강동구','강일동','63','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강동구','상일제1동','63','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강동구','상일제2동','63','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강동구','명일제1동','63','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강동구','명일제2동','63','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시',null,null,'60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','종로구',null,'60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','종로구','청운효자동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','종로구','사직동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','종로구','삼청동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','종로구','부암동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','종로구','평창동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','종로구','무악동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','종로구','교남동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','종로구','가회동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','종로구','종로1.2.3.4가동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','종로구','종로5.6가동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','종로구','이화동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','종로구','혜화동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','종로구','창신제1동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','종로구','창신제2동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','종로구','창신제3동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','종로구','숭인제1동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','종로구','숭인제2동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중구',null,'60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중구','소공동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중구','회현동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중구','명동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중구','필동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중구','장충동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중구','광희동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중구','을지로동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중구','신당동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중구','다산동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중구','약수동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중구','청구동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중구','신당제5동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중구','동화동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중구','황학동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중구','중림동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','용산구',null,'60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','용산구','후암동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','용산구','용산2가동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','용산구','남영동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','용산구','청파동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','용산구','원효로제1동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','용산구','원효로제2동','59','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','용산구','효창동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','용산구','용문동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','용산구','한강로동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','용산구','이촌제1동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','용산구','이촌제2동','59','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','용산구','이태원제1동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','용산구','이태원제2동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','용산구','한남동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','용산구','서빙고동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','용산구','보광동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성동구',null,'61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성동구','왕십리제2동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성동구','왕십리도선동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성동구','마장동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성동구','사근동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성동구','행당제1동','61','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성동구','행당제2동','61','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성동구','응봉동','61','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성동구','금호1가동','61','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성동구','금호2.3가동','61','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성동구','금호4가동','61','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성동구','옥수동','60','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성동구','성수1가제1동','61','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성동구','성수1가제2동','61','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성동구','성수2가제1동','61','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성동구','성수2가제3동','61','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성동구','송정동','61','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성동구','용답동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','광진구',null,'62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','광진구','화양동','61','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','광진구','군자동','62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','광진구','중곡제1동','62','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','광진구','중곡제2동','62','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','광진구','중곡제3동','62','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','광진구','중곡제4동','62','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','광진구','능동','62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','광진구','광장동','62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','광진구','자양제1동','62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','광진구','자양제2동','62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','광진구','자양제3동','61','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','광진구','자양제4동','61','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','광진구','구의제1동','62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','광진구','구의제2동','62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','광진구','구의제3동','62','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동대문구',null,'61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동대문구','용신동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동대문구','제기동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동대문구','전농제1동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동대문구','전농제2동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동대문구','답십리제1동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동대문구','답십리제2동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동대문구','장안제1동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동대문구','장안제2동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동대문구','청량리동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동대문구','회기동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동대문구','휘경제1동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동대문구','휘경제2동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동대문구','이문제1동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','동대문구','이문제2동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중랑구',null,'62','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중랑구','면목제2동','62','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중랑구','면목제4동','62','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중랑구','면목제5동','62','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중랑구','면목본동','62','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중랑구','면목제7동','62','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중랑구','면목제3.8동','62','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중랑구','상봉제1동','62','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중랑구','상봉제2동','62','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중랑구','중화제1동','62','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중랑구','중화제2동','62','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중랑구','묵제1동','62','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중랑구','묵제2동','62','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중랑구','망우본동','62','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중랑구','망우제3동','62','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중랑구','신내1동','62','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','중랑구','신내2동','62','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성북구',null,'61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성북구','성북동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성북구','삼선동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성북구','동선동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성북구','돈암제1동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성북구','돈암제2동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성북구','안암동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성북구','보문동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성북구','정릉제1동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성북구','정릉제2동','60','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성북구','정릉제3동','60','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성북구','정릉제4동','60','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성북구','길음제1동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성북구','길음제2동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성북구','종암동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성북구','월곡제1동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성북구','월곡제2동','61','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성북구','장위제1동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성북구','장위제2동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성북구','장위제3동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','성북구','석관동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강북구',null,'61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강북구','삼양동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강북구','미아동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강북구','송중동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강북구','송천동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강북구','삼각산동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('서울특별시','강북구','번1동','61','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','시흥시','정왕4동','56','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','시흥시','배곧1동','56','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','시흥시','배곧2동','56','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','시흥시','과림동','57','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','시흥시','연성동','57','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','시흥시','장곡동','57','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','시흥시','능곡동','57','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','시흥시','거북섬동','55','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','군포시',null,'59','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','군포시','군포1동','59','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','군포시','군포2동','59','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','군포시','산본1동','59','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','군포시','산본2동','59','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','군포시','금정동','59','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','군포시','재궁동','59','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','군포시','오금동','59','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','군포시','수리동','59','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','군포시','궁내동','59','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','군포시','대야동','59','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','군포시','광정동','59','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','군포시','송부동','59','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의왕시',null,'60','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의왕시','고천동','60','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의왕시','부곡동','60','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의왕시','오전동','60','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의왕시','내손1동','60','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의왕시','내손2동','60','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의왕시','청계동','60','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','하남시',null,'64','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','하남시','천현동','64','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','하남시','신장1동','64','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','하남시','신장2동','64','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','하남시','덕풍1동','64','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','하남시','덕풍2동','64','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','하남시','덕풍3동','64','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','하남시','감북동','63','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','하남시','감일동','63','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','하남시','위례동','63','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','하남시','춘궁동','64','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','하남시','초이동','63','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','하남시','미사1동','64','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','하남시','미사2동','63','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','하남시','미사3동','63','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시처인구',null,'64','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시처인구','포곡읍','64','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시처인구','모현읍','64','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시처인구','이동읍','64','117');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시처인구','남사읍','63','117');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시처인구','원삼면','66','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시처인구','백암면','67','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시처인구','양지면','65','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시처인구','중앙동','64','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시처인구','역북동','64','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시처인구','삼가동','63','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시처인구','유림동','64','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시처인구','동부동','64','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시기흥구',null,'62','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시기흥구','신갈동','62','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시기흥구','영덕1동','62','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시기흥구','영덕2동','62','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시기흥구','구갈동','63','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시기흥구','상갈동','62','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시기흥구','보라동','62','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시기흥구','기흥동','62','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시기흥구','서농동','62','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시기흥구','구성동','62','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시기흥구','마북동','62','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시기흥구','동백1동','63','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시기흥구','동백2동','63','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시기흥구','동백3동','63','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시기흥구','상하동','63','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시기흥구','보정동','62','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시수지구',null,'62','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시수지구','풍덕천1동','62','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시수지구','풍덕천2동','62','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시수지구','신봉동','62','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시수지구','죽전1동','62','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시수지구','죽전2동','62','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시수지구','죽전3동','62','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시수지구','동천동','62','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시수지구','상현1동','62','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시수지구','상현2동','62','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시수지구','상현3동','62','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','용인시수지구','성복동','62','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','파주시',null,'56','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','파주시','문산읍','56','133');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','파주시','파주읍','57','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','파주시','법원읍','58','133');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','파주시','조리읍','57','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','파주시','월롱면','57','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','파주시','탄현면','55','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','파주시','광탄면','58','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','파주시','파평면','57','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','파주시','적성면','59','135');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','파주시','장단면','55','133');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','파주시','금촌1동','56','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','파주시','금촌2동','56','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','파주시','금촌3동','56','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','파주시','교하동','56','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','파주시','운정1동','56','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','파주시','운정2동','56','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','파주시','운정3동','56','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','파주시','운정4동','56','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','파주시','운정5동','55','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','파주시','운정6동','55','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','이천시',null,'68','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','이천시','장호원읍','71','117');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','이천시','부발읍','69','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','이천시','신둔면','67','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','이천시','백사면','69','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','이천시','호법면','68','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','이천시','마장면','66','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','이천시','대월면','69','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','이천시','모가면','69','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','이천시','설성면','69','117');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','이천시','율면','70','117');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','이천시','창전동','68','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','이천시','증포동','68','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','이천시','중리동','68','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','이천시','관고동','68','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안성시',null,'65','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안성시','공도읍','63','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안성시','보개면','65','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안성시','금광면','66','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안성시','서운면','65','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안성시','미양면','64','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안성시','대덕면','64','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안성시','양성면','64','116');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안성시','원곡면','63','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안성시','일죽면','69','116');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안성시','죽산면','68','116');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안성시','삼죽면','67','116');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안성시','고삼면','65','116');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안성시','안성1동','65','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안성시','안성2동','65','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안성시','안성3동','65','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','김포시',null,'55','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','김포시','통진읍','53','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','김포시','고촌읍','56','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','김포시','양촌읍','54','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','김포시','대곶면','53','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','김포시','월곶면','53','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','김포시','하성면','54','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','김포시','김포본동','55','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','김포시','장기본동','55','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','김포시','사우동','55','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','김포시','풍무동','55','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','김포시','장기동','55','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','김포시','구래동','54','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','김포시','마산동','54','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','김포시','운양동','55','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시',null,'57','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','봉담읍','59','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','우정읍','57','116');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','향남읍','59','117');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','남양읍','57','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','매송면','59','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','비봉면','58','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','마도면','56','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','송산면','56','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','서신면','55','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','팔탄면','59','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','장안면','57','116');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','양감면','59','116');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','정남면','60','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','새솔동','57','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','진안동','61','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','병점1동','61','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','병점2동','61','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','반월동','61','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','기배동','60','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','화산동','61','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','동탄1동','62','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','동탄2동','62','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','동탄3동','61','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','동탄4동','62','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','동탄5동','62','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','동탄6동','62','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','동탄7동','62','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','동탄8동','62','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','화성시','동탄9동','63','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광주시',null,'65','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광주시','초월읍','65','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광주시','곤지암읍','66','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광주시','도척면','66','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광주시','퇴촌면','66','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광주시','남종면','65','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광주시','남한산성면','64','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광주시','경안동','65','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광주시','송정동','65','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광주시','쌍령동','65','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광주시','탄벌동','64','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광주시','광남1동','64','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광주시','광남2동','64','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광주시','오포1동','64','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광주시','오포2동','65','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광주시','신현동','63','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광주시','능평동','63','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양주시',null,'61','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양주시','백석읍','60','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양주시','은현면','61','133');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양주시','남면','60','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양주시','광적면','60','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양주시','장흥면','59','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양주시','양주1동','61','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양주시','양주2동','62','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양주시','회천1동','61','133');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양주시','회천2동','61','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양주시','회천3동','61','133');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양주시','옥정1동','62','133');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양주시','옥정2동','62','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','포천시',null,'64','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','포천시','소흘읍','63','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','포천시','군내면','64','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','포천시','내촌면','64','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','포천시','가산면','63','133');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','포천시','신북면','64','135');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','포천시','창수면','63','136');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','포천시','영중면','64','136');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','포천시','일동면','66','135');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','포천시','이동면','66','137');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','포천시','영북면','65','138');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','포천시','관인면','64','140');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','포천시','화현면','65','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','포천시','포천동','64','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','포천시','선단동','63','133');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','여주시',null,'71','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','여주시','가남읍','70','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','여주시','점동면','72','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','여주시','흥천면','70','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','여주시','금사면','69','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','여주시','세종대왕면','70','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','여주시','대신면','70','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','여주시','북내면','72','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','여주시','강천면','73','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','여주시','산북면','68','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','여주시','여흥동','71','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','여주시','중앙동','71','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','여주시','오학동','71','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','연천군',null,'61','138');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','연천군','연천읍','61','138');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','연천군','전곡읍','61','137');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','연천군','군남면','60','138');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','연천군','청산면','61','136');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','연천군','백학면','59','137');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','연천군','미산면','60','137');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','연천군','왕징면','60','137');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','연천군','신서면','62','140');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','연천군','중면','60','139');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','연천군','장남면','58','136');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','가평군',null,'69','133');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','가평군','가평읍','69','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','가평군','설악면','69','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','가평군','청평면','67','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','가평군','상면','66','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','가평군','조종면','66','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','가평군','북면','70','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양평군',null,'69','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양평군','양평읍','69','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양평군','강상면','69','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양평군','강하면','67','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양평군','양서면','66','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양평군','옥천면','68','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양평군','서종면','66','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양평군','단월면','72','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양평군','청운면','72','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양평군','양동면','73','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양평군','지평면','71','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양평군','용문면','70','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','양평군','개군면','70','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도',null,null,'69','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시상당구',null,'69','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시상당구','낭성면','71','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시상당구','미원면','72','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시상당구','가덕면','70','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시상당구','남일면','69','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시상당구','문의면','69','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시상당구','중앙동','69','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시상당구','성안동','69','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시상당구','탑대성동','69','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시상당구','영운동','69','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시상당구','금천동','69','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시상당구','용담.명암.산성동','69','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시상당구','용암1동','69','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시상당구','용암2동','69','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시서원구',null,'69','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시서원구','남이면','68','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시서원구','현도면','68','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시서원구','사직1동','69','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시서원구','사직2동','69','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시서원구','사창동','68','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시서원구','모충동','69','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시서원구','산남동','69','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시서원구','분평동','69','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시서원구','수곡1동','69','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시서원구','수곡2동','69','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시서원구','성화.개신.죽림동','68','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시흥덕구',null,'67','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시흥덕구','오송읍','66','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시흥덕구','강내면','67','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시흥덕구','옥산면','67','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시흥덕구','운천.신봉동','69','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시흥덕구','복대1동','68','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시흥덕구','복대2동','68','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시흥덕구','가경동','68','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시흥덕구','봉명1동','68','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시흥덕구','봉명2.송정동','68','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시흥덕구','강서제1동','68','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시흥덕구','강서제2동','68','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시청원구',null,'69','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시청원구','내수읍','70','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시청원구','오창읍','68','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시청원구','북이면','70','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시청원구','우암동','69','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시청원구','내덕1동','69','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시청원구','내덕2동','69','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시청원구','율량.사천동','69','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','청주시청원구','오근장동','69','108');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시',null,'76','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','주덕읍','74','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','살미면','77','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','수안보면','78','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','대소원면','75','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','신니면','73','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','남구','대명6동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','남구','대명9동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','남구','대명10동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','남구','대명11동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구',null,'89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','고성동','89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','칠성동','89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','침산1동','89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','침산2동','89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','침산3동','89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','산격1동','89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','산격2동','89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','산격3동','89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','산격4동','89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','대현동','89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','복현1동','89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','복현2동','89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','검단동','89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','무태조야동','89','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','관문동','88','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','태전1동','88','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','태전2동','88','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','구암동','88','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','관음동','88','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','읍내동','88','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','동천동','88','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','노원동','89','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','북구','국우동','88','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구',null,'89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','범어1동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','범어2동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','범어3동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','범어4동','90','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','만촌1동','90','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','만촌2동','90','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','만촌3동','90','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','수성1가동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','수성2.3가동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','수성4가동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','황금1동','90','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','황금2동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','중동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','상동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','파동','89','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','두산동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','지산1동','90','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','지산2동','89','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','범물1동','90','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','범물2동','90','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','고산1동','91','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','고산2동','91','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','수성구','고산3동','91','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구',null,'88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','성당동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','두류1.2동','89','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','두류3동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','감삼동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','죽전동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','장기동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','용산1동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','용산2동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','이곡1동','87','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','이곡2동','87','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','신당동','87','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','본리동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','월성1동','88','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','월성2동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','진천동','88','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','유천동','87','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','상인1동','88','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','상인2동','88','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','상인3동','88','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','도원동','88','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','송현1동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','송현2동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달서구','본동','88','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달성군',null,'86','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달성군','화원읍','87','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달성군','논공읍','86','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달성군','다사읍','86','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달성군','유가읍','87','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달성군','옥포읍','87','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달성군','현풍읍','86','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달성군','가창면','89','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달성군','하빈면','86','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','달성군','구지면','86','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','군위군',null,'88','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','군위군','군위읍','88','98');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','군위군','소보면','86','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','군위군','효령면','88','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','군위군','부계면','90','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','군위군','우보면','90','98');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','군위군','의흥면','91','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','군위군','산성면','90','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대구광역시','군위군','삼국유사면','92','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시',null,null,'55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','중구',null,'54','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','중구','연안동','53','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','중구','신포동','54','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','중구','신흥동','54','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','중구','도원동','54','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','중구','율목동','54','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','중구','동인천동','54','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','중구','개항동','54','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','중구','영종동','52','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','중구','영종1동','53','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','중구','영종2동','53','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','중구','운서동','51','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','중구','용유동','50','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','동구',null,'54','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','동구','만석동','54','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','동구','화수1.화평동','54','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','동구','화수2동','54','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','동구','송현1.2동','54','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','동구','송현3동','54','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','동구','송림1동','54','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','동구','송림2동','54','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','동구','송림3.5동','54','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','동구','송림4동','54','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','동구','송림6동','54','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','동구','금창동','54','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구',null,'54','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구','숭의2동','54','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구','숭의1.3동','54','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구','숭의4동','54','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구','용현1.4동','54','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구','용현2동','54','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구','용현3동','54','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구','용현5동','54','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구','학익1동','54','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구','학익2동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구','도화1동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구','도화2.3동','54','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구','주안1동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구','주안2동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구','주안3동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구','주안4동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구','주안5동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구','주안6동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구','주안7동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구','주안8동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구','관교동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','미추홀구','문학동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','연수구',null,'55','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','연수구','옥련1동','54','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','연수구','옥련2동','54','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','연수구','선학동','55','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','연수구','연수1동','55','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','연수구','연수2동','55','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','연수구','연수3동','55','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','연수구','청학동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','연수구','동춘1동','55','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','연수구','동춘2동','55','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','연수구','동춘3동','55','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','연수구','송도1동','54','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','연수구','송도2동','54','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','연수구','송도3동','54','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','연수구','송도4동','54','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','연수구','송도5동','54','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','남동구',null,'56','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','남동구','구월1동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','남동구','구월2동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','남동구','구월3동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','남동구','구월4동','56','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','남동구','간석1동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','남동구','간석2동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','남동구','간석3동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','남동구','간석4동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','남동구','만수1동','56','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','남동구','만수2동','56','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','남동구','만수3동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','남동구','만수4동','56','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','남동구','만수5동','56','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','남동구','만수6동','56','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','남동구','장수서창동','56','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','남동구','서창2동','56','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','남동구','남촌도림동','55','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','남동구','논현1동','56','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','남동구','논현2동','55','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','남동구','논현고잔동','55','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구',null,'55','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','부평1동','55','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','부평2동','55','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','부평3동','55','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','부평4동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','부평5동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','부평6동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','산곡1동','55','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','산곡2동','55','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','산곡3동','55','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','산곡4동','55','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','청천1동','55','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','청천2동','55','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','갈산1동','56','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','갈산2동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','삼산1동','56','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','삼산2동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','부개1동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','부개2동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','부개3동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','일신동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','십정1동','55','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','부평구','십정2동','55','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','계양구',null,'56','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','계양구','효성1동','55','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','계양구','효성2동','55','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','계양구','계산1동','55','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','계양구','계산2동','56','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','계양구','계산3동','56','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','계양구','계산4동','56','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','계양구','작전1동','56','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','계양구','작전2동','55','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','계양구','작전서운동','56','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','계양구','계양1동','56','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','계양구','계양2동','56','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','계양구','계양3동','56','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구',null,'55','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','검암경서동','55','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','연희동','55','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','청라1동','54','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','청라2동','54','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','청라3동','54','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','가정1동','55','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','가정2동','55','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','가정3동','55','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','석남1동','55','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','석남2동','55','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','석남3동','55','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','신현원창동','55','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','가좌1동','55','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','가좌2동','55','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','가좌3동','55','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','가좌4동','55','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','검단동','54','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','불로대곡동','55','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','원당동','55','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','당하동','55','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','오류왕길동','54','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','마전동','54','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','서구','아라동','55','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','강화군',null,'51','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','강화군','강화읍','51','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','강화군','선원면','51','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','강화군','불은면','51','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','강화군','길상면','51','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','강화군','화도면','50','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','강화군','양도면','50','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','강화군','내가면','50','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','강화군','하점면','50','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','강화군','양사면','50','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','강화군','송해면','51','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','강화군','교동면','48','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','강화군','삼산면','49','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','강화군','서도면','47','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','옹진군',null,'54','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','옹진군','북도면','50','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','옹진군','백령면','21','135');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','옹진군','대청면','21','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','옹진군','덕적면','46','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','옹진군','영흥면','51','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','옹진군','자월면','48','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('인천광역시','옹진군','연평면','38','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시',null,null,'58','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','동구',null,'60','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','동구','충장동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','동구','동명동','60','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','동구','계림1동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','동구','계림2동','60','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','동구','산수1동','60','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','동구','산수2동','60','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','동구','지산1동','60','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','동구','지산2동','60','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','동구','서남동','60','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','동구','학동','60','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','동구','학운동','60','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','동구','지원1동','60','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','동구','지원2동','60','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','서구',null,'59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','서구','양동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','서구','양3동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','서구','농성1동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','서구','농성2동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','서구','광천동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','서구','유덕동','58','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','서구','치평동','58','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','서구','상무1동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','서구','상무2동','58','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','서구','화정1동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','서구','화정2동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','서구','화정3동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','서구','화정4동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','서구','서창동','58','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','서구','금호1동','58','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','서구','금호2동','58','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','서구','풍암동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','서구','동천동','58','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','남구',null,'59','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','남구','양림동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','남구','방림1동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','남구','방림2동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','남구','봉선1동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','남구','봉선2동','59','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','남구','사직동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','남구','월산동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','남구','월산4동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','남구','월산5동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','남구','백운1동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','남구','백운2동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','남구','주월1동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','남구','주월2동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','남구','진월동','59','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','남구','효덕동','59','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','남구','송암동','59','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','남구','대촌동','58','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구',null,'59','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','중흥1동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','중흥동','59','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','중앙동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','임동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','신안동','59','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','용봉동','59','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','운암1동','59','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','운암2동','59','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','운암3동','59','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','동림동','58','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','우산동','59','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','풍향동','60','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','문화동','60','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','문흥1동','59','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','문흥2동','59','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','두암1동','60','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','두암2동','60','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','두암3동','60','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','삼각동','59','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','일곡동','59','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','매곡동','59','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','오치1동','59','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','오치2동','59','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','석곡동','60','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','건국동','59','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','양산동','59','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','북구','신용동','58','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구',null,'57','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구','송정1동','57','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구','송정2동','57','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구','도산동','57','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구','신흥동','57','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구','어룡동','57','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구','우산동','57','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구','월곡1동','57','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구','월곡2동','57','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구','비아동','58','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구','첨단1동','58','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구','첨단2동','58','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구','신가동','58','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구','운남동','58','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구','수완동','58','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구','하남동','57','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구','임곡동','56','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구','동곡동','57','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구','평동','57','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구','삼도동','55','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구','본량동','56','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('광주광역시','광산구','신창동','58','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시',null,null,'67','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','동구',null,'68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','동구','중앙동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','동구','효동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','동구','신인동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','동구','판암1동','69','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','동구','판암2동','69','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','동구','용운동','69','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','동구','대동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','동구','자양동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','동구','가양1동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','동구','가양2동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','동구','용전동','68','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','동구','성남동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','동구','홍도동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','동구','삼성동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','동구','대청동','69','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','동구','산내동','69','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','중구',null,'68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','중구','은행선화동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','중구','목동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','중구','중촌동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','중구','대흥동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','중구','문창동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','중구','석교동','68','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','중구','대사동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','중구','부사동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','중구','용두동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','중구','오류동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','중구','태평1동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','중구','태평2동','67','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','중구','유천1동','67','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','중구','유천2동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','중구','문화1동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','중구','문화2동','68','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','중구','산성동','67','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구',null,'67','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','복수동','67','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','도마1동','67','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','도마2동','67','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','정림동','67','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','변동','67','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','용문동','67','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','탄방동','67','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','괴정동','67','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','가장동','67','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','내동','67','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','갈마1동','67','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','갈마2동','67','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','월평1동','67','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','월평2동','67','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','월평3동','67','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','가수원동','67','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','도안동','67','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','관저1동','66','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','관저2동','66','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','기성동','67','98');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','둔산1동','67','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','둔산2동','67','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','만년동','67','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','서구','둔산3동','68','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','유성구',null,'67','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','유성구','진잠동','66','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','유성구','학하동','66','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','유성구','상대동','66','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','유성구','온천1동','66','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','유성구','온천2동','66','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','유성구','노은1동','66','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','유성구','노은2동','66','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','유성구','노은3동','66','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','유성구','신성동','67','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','유성구','전민동','68','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','유성구','구즉동','67','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','유성구','관평동','68','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','유성구','원신흥동','67','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','대덕구',null,'68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','대덕구','오정동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','대덕구','대화동','68','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','대덕구','회덕동','68','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','대덕구','비래동','68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','대덕구','송촌동','68','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','대덕구','중리동','68','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','대덕구','신탄진동','68','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','대덕구','석봉동','68','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','대덕구','덕암동','68','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','대덕구','목상동','68','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','대덕구','법1동','68','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('대전광역시','대덕구','법2동','68','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시',null,null,'102','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','중구',null,'102','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','중구','학성동','102','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','중구','반구1동','102','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','중구','반구2동','102','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','중구','복산동','102','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','중구','중앙동','102','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','중구','우정동','102','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','중구','태화동','102','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','중구','다운동','101','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','중구','병영1동','102','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','중구','병영2동','102','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','중구','약사동','102','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','중구','성안동','102','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','남구',null,'102','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','남구','신정1동','102','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','남구','신정2동','102','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','남구','신정3동','102','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','남구','신정4동','102','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','남구','신정5동','102','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','남구','달동','102','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','남구','삼산동','102','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','남구','삼호동','101','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','남구','무거동','101','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','남구','옥동','101','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','남구','대현동','102','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','남구','수암동','102','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','남구','선암동','102','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','남구','야음장생포동','102','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','동구',null,'104','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','동구','방어동','104','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','동구','일산동','104','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','동구','화정동','104','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','동구','대송동','104','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','동구','전하1동','104','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','동구','전하2동','104','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','동구','남목1동','104','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','동구','남목2동','104','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','동구','남목3동','104','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','북구',null,'103','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','북구','농소1동','102','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','북구','농소2동','102','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','북구','농소3동','102','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','북구','강동동','104','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','북구','효문동','103','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','북구','송정동','103','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','북구','양정동','103','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','북구','염포동','103','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','울주군',null,'101','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','울주군','온산읍','102','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','울주군','언양읍','98','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','울주군','온양읍','101','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','울주군','범서읍','100','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','울주군','청량읍','102','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','울주군','삼남읍','98','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','울주군','서생면','102','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','울주군','웅촌면','100','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','울주군','두동면','100','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','울주군','두서면','99','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','울주군','상북면','98','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('울산광역시','울주군','삼동면','99','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시',null,null,'66','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시',null,'66','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','조치원읍','66','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','연기면','65','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','연동면','66','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','부강면','67','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','금남면','65','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','장군면','64','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','연서면','65','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','전의면','64','108');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','전동면','65','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','소정면','63','108');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','한솔동','65','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','새롬동','65','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','나성동','65','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','도담동','65','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','어진동','65','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','해밀동','65','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','아름동','65','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','종촌동','65','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','고운동','65','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','소담동','66','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','반곡동','66','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','보람동','66','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','대평동','65','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('세종특별자치시','세종특별자치시','다정동','65','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도',null,null,'60','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시장안구',null,'60','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시장안구','파장동','60','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시장안구','율천동','60','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시장안구','정자1동','60','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시장안구','정자2동','60','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시장안구','정자3동','60','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시장안구','영화동','61','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시장안구','송죽동','60','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시장안구','조원1동','61','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시장안구','조원2동','60','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시장안구','연무동','61','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시권선구',null,'60','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시권선구','세류1동','60','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시권선구','세류2동','61','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시권선구','세류3동','61','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시권선구','평동','60','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시권선구','서둔동','60','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시권선구','구운동','60','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시권선구','금곡동','59','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시권선구','호매실동','60','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시권선구','권선1동','61','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시권선구','권선2동','61','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시권선구','곡선동','61','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시권선구','입북동','60','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시팔달구',null,'61','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시팔달구','매교동','61','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시팔달구','매산동','60','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시팔달구','고등동','60','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시팔달구','화서1동','60','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시팔달구','화서2동','60','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시팔달구','지동','61','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시팔달구','우만1동','61','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시팔달구','우만2동','61','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시팔달구','인계동','61','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시팔달구','행궁동','61','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시영통구',null,'61','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시영통구','매탄1동','61','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시영통구','매탄2동','61','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시영통구','매탄3동','61','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시영통구','매탄4동','61','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시영통구','원천동','61','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시영통구','영통1동','62','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시영통구','영통2동','61','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시영통구','영통3동','62','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시영통구','망포1동','61','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시영통구','망포2동','61','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시영통구','광교1동','61','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','수원시영통구','광교2동','62','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시수정구',null,'63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시수정구','신흥1동','63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시수정구','신흥2동','63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시수정구','신흥3동','63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시수정구','태평1동','62','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시수정구','태평2동','63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시수정구','태평3동','63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시수정구','태평4동','63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시수정구','수진1동','63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시수정구','수진2동','62','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시수정구','단대동','63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시수정구','산성동','63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시수정구','양지동','63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시수정구','복정동','62','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시수정구','위례동','63','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시수정구','신촌동','62','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시수정구','고등동','62','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시수정구','시흥동','62','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시중원구',null,'63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시중원구','성남동','63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시중원구','중앙동','63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시중원구','금광1동','63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시중원구','금광2동','63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시중원구','은행1동','63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시중원구','은행2동','63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시중원구','상대원1동','63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시중원구','상대원2동','63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시중원구','상대원3동','63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시중원구','하대원동','63','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시중원구','도촌동','63','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구',null,'62','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','분당동','63','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','수내1동','62','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','수내2동','62','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','수내3동','62','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','정자동','62','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','정자1동','62','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','정자2동','62','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','정자3동','62','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','서현1동','62','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','서현2동','63','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','이매1동','62','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','이매2동','62','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','야탑1동','63','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','야탑2동','62','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','야탑3동','63','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','판교동','62','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','삼평동','62','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','백현동','62','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','금곡동','62','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','구미1동','62','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','구미동','62','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','성남시분당구','운중동','62','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의정부시',null,'61','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의정부시','의정부1동','61','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의정부시','의정부2동','61','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의정부시','호원1동','61','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의정부시','호원2동','61','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의정부시','장암동','61','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의정부시','신곡1동','61','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의정부시','신곡2동','61','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의정부시','송산1동','62','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의정부시','송산2동','62','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의정부시','송산3동','62','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의정부시','자금동','61','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의정부시','가능동','61','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의정부시','흥선동','61','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','의정부시','녹양동','61','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시만안구',null,'59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시만안구','안양1동','59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시만안구','안양2동','59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시만안구','안양3동','59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시만안구','안양4동','59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시만안구','안양5동','59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시만안구','안양6동','59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시만안구','안양7동','59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시만안구','안양8동','59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시만안구','안양9동','59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시만안구','석수1동','59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시만안구','석수2동','59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시만안구','충훈동','58','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시만안구','박달1동','59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시만안구','박달2동','59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시동안구',null,'59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시동안구','비산1동','59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시동안구','비산2동','59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시동안구','비산3동','59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시동안구','부흥동','59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시동안구','달안동','59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시동안구','관양동','60','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시동안구','인덕원동','60','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시동안구','부림동','60','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시동안구','평촌동','60','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시동안구','평안동','60','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시동안구','귀인동','60','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시동안구','호계1동','60','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시동안구','호계2동','59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시동안구','호계3동','60','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시동안구','범계동','59','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시동안구','신촌동','60','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안양시동안구','갈산동','60','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시원미구',null,'57','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시원미구','심곡1동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시원미구','심곡2동','57','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시원미구','심곡3동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시원미구','원미1동','57','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시원미구','원미2동','57','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시원미구','소사동','57','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시원미구','역곡1동','57','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시원미구','역곡2동','57','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시원미구','춘의동','57','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시원미구','도당동','57','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시원미구','약대동','56','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시원미구','중동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시원미구','중1동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시원미구','중2동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시원미구','중3동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시원미구','중4동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시원미구','상동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시원미구','상1동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시원미구','상2동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시원미구','상3동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시소사구',null,'57','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시소사구','심곡본1동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시소사구','심곡본동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시소사구','소사본동','57','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시소사구','소사본1동','57','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시소사구','범박동','57','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시소사구','옥길동','57','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시소사구','괴안동','57','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시소사구','역곡3동','57','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시소사구','송내1동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시소사구','송내2동','56','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시오정구',null,'57','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시오정구','성곡동','57','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시오정구','원종1동','57','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시오정구','원종2동','57','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시오정구','고강본동','57','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시오정구','고강1동','57','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시오정구','오정동','57','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','부천시오정구','신흥동','56','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광명시',null,'58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광명시','광명1동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광명시','광명2동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광명시','광명3동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광명시','광명4동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광명시','광명5동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광명시','광명6동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광명시','광명7동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광명시','철산1동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광명시','철산2동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광명시','철산3동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광명시','철산4동','58','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광명시','하안1동','58','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광명시','하안2동','58','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광명시','하안3동','58','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광명시','하안4동','58','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광명시','소하1동','58','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광명시','소하2동','58','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광명시','일직동','58','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','광명시','학온동','58','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시',null,'62','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','팽성읍','61','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','안중읍','59','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','포승읍','58','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','청북읍','59','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','진위면','62','117');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','서탄면','61','117');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','고덕면','61','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','오성면','60','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','현덕면','59','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','중앙동','61','116');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','서정동','61','116');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','송탄동','62','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','지산동','61','116');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','송북동','61','116');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','신장1동','61','116');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','신장2동','61','116');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','신평동','62','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','원평동','62','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','통복동','62','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','비전1동','62','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','비전2동','62','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','용이동','63','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','세교동','62','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','동삭동','62','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','평택시','고덕동','61','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','동두천시',null,'61','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','동두천시','생연1동','61','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','동두천시','생연2동','61','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','동두천시','중앙동','61','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','동두천시','보산동','61','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','동두천시','불현동','61','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','동두천시','송내동','61','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','동두천시','소요동','61','135');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','동두천시','상패동','61','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시상록구',null,'58','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시상록구','일동','58','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시상록구','이동','58','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시상록구','사동','58','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시상록구','사이동','58','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시상록구','해양동','57','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시상록구','본오1동','58','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시상록구','본오2동','58','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시상록구','본오3동','58','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시상록구','부곡동','58','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시상록구','월피동','58','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시상록구','성포동','58','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시상록구','반월동','59','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시상록구','안산동','58','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시단원구',null,'57','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시단원구','와동','57','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시단원구','고잔동','57','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시단원구','중앙동','57','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시단원구','호수동','57','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시단원구','원곡동','57','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시단원구','백운동','57','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시단원구','신길동','57','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시단원구','초지동','57','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시단원구','선부1동','57','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시단원구','선부2동','57','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시단원구','선부3동','57','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','안산시단원구','대부동','53','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구',null,'57','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구','주교동','57','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구','원신동','58','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구','흥도동','58','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구','성사1동','57','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구','성사2동','57','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구','효자동','59','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구','삼송1동','58','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구','삼송2동','58','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구','창릉동','58','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구','고양동','59','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구','관산동','58','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구','능곡동','57','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구','화정1동','57','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구','화정2동','57','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구','행주동','57','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구','행신1동','57','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구','행신2동','57','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구','행신3동','57','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구','행신4동','58','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구','화전동','58','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시덕양구','대덕동','58','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산동구',null,'56','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산동구','식사동','57','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산동구','중산1동','56','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산동구','중산2동','56','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산동구','정발산동','56','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산동구','풍산동','57','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산동구','백석1동','57','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산동구','백석2동','57','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산동구','마두1동','57','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산동구','마두2동','56','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산동구','장항1동','56','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산동구','장항2동','56','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산동구','고봉동','57','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산서구',null,'56','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산서구','일산1동','56','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산서구','일산2동','56','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산서구','일산3동','56','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산서구','탄현1동','56','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산서구','탄현2동','56','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산서구','주엽1동','56','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산서구','주엽2동','56','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산서구','대화동','56','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산서구','송포동','56','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산서구','덕이동','56','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','고양시일산서구','가좌동','55','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','과천시',null,'60','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','과천시','중앙동','60','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','과천시','원문동','60','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','과천시','갈현동','60','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','과천시','별양동','60','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','과천시','부림동','60','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','과천시','과천동','60','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','과천시','문원동','60','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','구리시',null,'62','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','구리시','갈매동','62','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','구리시','동구동','63','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','구리시','인창동','63','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','구리시','교문1동','62','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','구리시','교문2동','63','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','구리시','수택1동','63','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','구리시','수택2동','63','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','구리시','수택3동','63','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','남양주시',null,'64','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','남양주시','와부읍','64','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','남양주시','진접읍','63','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','남양주시','화도읍','65','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','남양주시','진건읍','63','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','남양주시','오남읍','64','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','남양주시','퇴계원읍','63','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','남양주시','별내면','62','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','남양주시','수동면','66','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','남양주시','조안면','65','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','남양주시','호평동','64','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','남양주시','평내동','64','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','남양주시','금곡동','64','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','남양주시','양정동','63','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','남양주시','다산1동','63','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','남양주시','다산2동','63','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','남양주시','별내동','62','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','오산시',null,'62','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','오산시','중앙동','62','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','오산시','대원1동','62','117');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','오산시','대원2동','62','117');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','오산시','남촌동','61','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','오산시','신장1동','61','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','오산시','신장2동','61','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','오산시','세마동','61','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','오산시','초평동','61','117');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','시흥시',null,'57','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','시흥시','대야동','57','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','시흥시','신천동','57','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','시흥시','신현동','57','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','시흥시','은행동','57','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','시흥시','매화동','57','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','시흥시','목감동','58','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','시흥시','군자동','57','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','시흥시','월곶동','56','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','시흥시','정왕본동','56','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','시흥시','정왕1동','56','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','시흥시','정왕2동','56','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경기도','시흥시','정왕3동','56','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','공주시','우성면','61','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','공주시','사곡면','61','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','공주시','신풍면','60','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','공주시','중학동','63','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','공주시','웅진동','63','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','공주시','금학동','63','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','공주시','옥룡동','63','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','공주시','신관동','63','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','공주시','월송동','63','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','보령시',null,'54','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','보령시','웅천읍','54','98');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','보령시','주포면','53','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','보령시','오천면','52','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','보령시','천북면','52','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','보령시','청소면','53','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','보령시','청라면','55','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','보령시','남포면','54','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','보령시','주산면','54','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','보령시','미산면','55','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','보령시','성주면','54','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','보령시','주교면','53','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','보령시','대천1동','53','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','보령시','대천2동','53','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','보령시','대천3동','54','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','보령시','대천4동','54','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','보령시','대천5동','52','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','아산시',null,'60','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','아산시','염치읍','60','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','아산시','배방읍','62','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','아산시','송악면','61','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','아산시','탕정면','61','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','아산시','음봉면','61','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','아산시','둔포면','61','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','아산시','영인면','60','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','아산시','인주면','58','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','아산시','선장면','58','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','아산시','도고면','58','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','아산시','신창면','59','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','아산시','온양1동','60','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','아산시','온양2동','60','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','아산시','온양3동','61','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','아산시','온양4동','60','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','아산시','온양5동','60','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','아산시','온양6동','61','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서산시',null,'51','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서산시','대산읍','51','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서산시','인지면','50','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서산시','부석면','50','108');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서산시','팔봉면','49','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서산시','지곡면','51','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서산시','성연면','51','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서산시','음암면','52','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서산시','운산면','53','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서산시','해미면','53','108');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서산시','고북면','52','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서산시','부춘동','51','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서산시','동문1동','51','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서산시','동문2동','51','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서산시','수석동','51','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서산시','석남동','51','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','논산시',null,'62','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','논산시','강경읍','61','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','논산시','연무읍','62','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','논산시','성동면','61','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','논산시','광석면','62','98');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','논산시','노성면','63','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','논산시','상월면','63','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','논산시','부적면','63','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','논산시','연산면','64','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','논산시','벌곡면','65','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','논산시','양촌면','65','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','논산시','가야곡면','63','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','논산시','은진면','62','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','논산시','채운면','62','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','논산시','취암동','62','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','논산시','부창동','62','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','계룡시',null,'65','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','계룡시','두마면','65','98');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','계룡시','엄사면','65','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','계룡시','신도안면','65','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','계룡시','금암동','65','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','당진시',null,'54','112');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','당진시','합덕읍','56','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','당진시','송악읍','55','112');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','당진시','고대면','53','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','당진시','석문면','53','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','당진시','대호지면','52','112');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','당진시','정미면','53','112');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','당진시','면천면','55','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','당진시','순성면','55','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','당진시','우강면','57','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','당진시','신평면','56','112');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','당진시','송산면','55','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','당진시','당진1동','54','112');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','당진시','당진2동','54','112');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','당진시','당진3동','54','112');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','금산군',null,'69','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','금산군','금산읍','69','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','금산군','금성면','69','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','금산군','제원면','70','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','금산군','부리면','70','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','금산군','군북면','70','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','금산군','남일면','70','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','금산군','남이면','68','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','금산군','진산면','67','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','금산군','복수면','68','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','금산군','추부면','69','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','부여군',null,'59','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','부여군','부여읍','59','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','부여군','규암면','59','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','부여군','은산면','58','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','부여군','외산면','55','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','부여군','내산면','57','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','부여군','구룡면','57','98');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','부여군','홍산면','56','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','부여군','옥산면','56','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','부여군','남면','57','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','부여군','충화면','57','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','부여군','양화면','59','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','부여군','임천면','59','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','부여군','장암면','59','98');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','부여군','세도면','60','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','부여군','석성면','61','98');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','부여군','초촌면','61','98');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서천군',null,'55','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서천군','장항읍','55','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서천군','서천읍','55','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서천군','마서면','55','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서천군','화양면','57','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서천군','기산면','56','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서천군','한산면','57','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서천군','마산면','57','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서천군','시초면','56','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서천군','문산면','56','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서천군','판교면','55','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서천군','종천면','55','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서천군','비인면','54','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','서천군','서면','53','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','청양군',null,'57','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','청양군','청양읍','57','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','청양군','운곡면','58','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','청양군','대치면','58','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','청양군','정산면','60','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','청양군','목면','61','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','청양군','청남면','60','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','청양군','장평면','59','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','청양군','남양면','57','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','청양군','화성면','56','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','청양군','비봉면','57','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','홍성군',null,'55','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','홍성군','홍성읍','55','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','홍성군','광천읍','54','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','홍성군','홍북읍','55','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','홍성군','금마면','56','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','홍성군','홍동면','55','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','홍성군','장곡면','55','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','홍성군','은하면','53','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','홍성군','결성면','53','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','홍성군','서부면','52','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','홍성군','갈산면','53','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','홍성군','구항면','54','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','예산군',null,'58','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','예산군','예산읍','58','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','예산군','삽교읍','56','108');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','예산군','대술면','59','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','고흥군','풍양면','65','62');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','고흥군','도덕면','64','61');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','고흥군','금산면','63','59');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','고흥군','도화면','67','60');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','고흥군','포두면','67','62');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','고흥군','봉래면','69','59');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','고흥군','점암면','68','63');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','고흥군','과역면','67','64');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','고흥군','남양면','67','65');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','고흥군','동강면','67','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','고흥군','대서면','66','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','고흥군','두원면','66','63');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','고흥군','영남면','69','62');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','고흥군','동일면','69','60');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','보성군',null,'62','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','보성군','보성읍','62','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','보성군','벌교읍','67','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','보성군','노동면','62','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','보성군','미력면','63','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','보성군','겸백면','64','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','보성군','율어면','64','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','보성군','복내면','63','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','보성군','문덕면','64','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','보성군','조성면','65','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','보성군','득량면','64','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','보성군','회천면','63','64');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','보성군','웅치면','61','65');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','화순군',null,'61','72');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','화순군','화순읍','61','72');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','화순군','한천면','61','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','화순군','춘양면','60','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','화순군','청풍면','60','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','화순군','이양면','61','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','화순군','능주면','60','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','화순군','도곡면','59','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','화순군','도암면','59','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','화순군','이서면','62','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','화순군','백아면','63','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','화순군','동복면','63','72');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','화순군','사평면','63','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','화순군','동면','62','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장흥군',null,'59','64');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장흥군','장흥읍','59','64');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장흥군','관산읍','60','61');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장흥군','대덕읍','59','60');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장흥군','용산면','59','62');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장흥군','안양면','61','63');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장흥군','장동면','61','65');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장흥군','장평면','61','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장흥군','유치면','58','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장흥군','부산면','59','65');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장흥군','회진면','60','59');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','강진군',null,'57','63');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','강진군','강진읍','57','63');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','강진군','군동면','58','63');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','강진군','칠량면','57','61');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','강진군','대구면','57','60');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','강진군','도암면','56','61');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','강진군','신전면','56','60');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','강진군','성전면','56','64');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','강진군','작천면','57','64');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','강진군','병영면','58','65');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','강진군','옴천면','57','65');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','강진군','마량면','58','59');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','해남군',null,'54','61');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','해남군','해남읍','54','61');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','해남군','삼산면','54','60');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','해남군','화산면','52','60');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','해남군','현산면','53','59');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','해남군','송지면','52','57');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','해남군','북평면','54','58');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','해남군','북일면','55','59');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','해남군','옥천면','55','61');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','해남군','계곡면','55','63');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','해남군','마산면','53','62');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','해남군','황산면','51','61');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','해남군','산이면','51','63');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','해남군','문내면','49','62');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','해남군','화원면','49','64');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영암군',null,'56','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영암군','영암읍','56','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영암군','삼호읍','51','65');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영암군','덕진면','56','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영암군','금정면','56','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영암군','신북면','55','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영암군','시종면','54','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영암군','도포면','55','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영암군','군서면','55','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영암군','서호면','54','65');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영암군','학산면','53','65');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영암군','미암면','53','64');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','무안군',null,'52','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','무안군','무안읍','52','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','무안군','일로읍','52','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','무안군','삼향읍','51','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','무안군','몽탄면','52','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','무안군','청계면','51','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','무안군','현경면','50','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','무안군','망운면','50','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','무안군','해제면','48','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','무안군','운남면','49','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','함평군',null,'52','72');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','함평군','함평읍','52','72');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','함평군','손불면','51','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','함평군','신광면','52','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','함평군','학교면','53','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','함평군','엄다면','52','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','함평군','대동면','53','72');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','함평군','나산면','54','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','함평군','해보면','54','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','함평군','월야면','54','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영광군',null,'52','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영광군','영광읍','52','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영광군','백수읍','51','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영광군','홍농읍','51','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영광군','대마면','53','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영광군','묘량면','53','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영광군','불갑면','52','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영광군','군서면','52','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영광군','군남면','51','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영광군','염산면','50','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영광군','법성면','51','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','영광군','낙월면','45','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장성군',null,'57','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장성군','장성읍','57','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장성군','진원면','58','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장성군','남면','58','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장성군','동화면','56','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장성군','삼서면','55','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장성군','삼계면','55','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장성군','황룡면','57','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장성군','서삼면','57','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장성군','북일면','57','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장성군','북이면','57','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','장성군','북하면','59','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','완도군',null,'57','56');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','완도군','완도읍','57','56');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','완도군','금일읍','62','57');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','완도군','노화읍','53','53');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','완도군','군외면','55','57');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','완도군','신지면','58','56');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','완도군','고금면','58','58');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','완도군','약산면','59','58');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','완도군','청산면','59','53');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','완도군','소안면','55','53');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','완도군','금당면','62','58');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','완도군','보길면','53','53');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','완도군','생일면','61','56');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','진도군',null,'48','59');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','진도군','진도읍','48','59');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','진도군','군내면','48','60');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','진도군','고군면','49','60');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','진도군','의신면','48','58');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','진도군','임회면','46','58');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','진도군','지산면','46','58');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','진도군','조도면','44','55');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','신안군',null,'50','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','신안군','지도읍','47','72');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','신안군','압해읍','49','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','신안군','증도면','46','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','신안군','임자면','45','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','신안군','자은면','44','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','신안군','비금면','42','65');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','신안군','도초면','42','64');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','신안군','흑산면','33','64');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','신안군','하의면','44','62');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','신안군','신의면','45','62');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','신안군','장산면','46','63');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','신안군','안좌면','45','65');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','신안군','팔금면','46','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','신안군','암태면','45','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도',null,null,'87','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시남구',null,'102','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시남구','구룡포읍','105','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시남구','연일읍','102','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시남구','오천읍','103','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시남구','대송면','102','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시남구','동해면','104','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시남구','장기면','105','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시남구','호미곶면','106','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시남구','상대동','102','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시남구','해도동','102','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시남구','송도동','102','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시남구','청림동','103','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시남구','제철동','103','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시남구','효곡동','102','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시남구','대이동','102','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시북구',null,'102','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시북구','흥해읍','102','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시북구','신광면','100','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시북구','청하면','102','98');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시북구','송라면','102','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시북구','기계면','100','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시북구','죽장면','97','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시북구','기북면','99','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시북구','중앙동','102','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시북구','양학동','102','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시북구','죽도동','102','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시북구','용흥동','102','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시북구','우창동','102','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시북구','두호동','102','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시북구','장량동','102','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','포항시북구','환여동','103','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시',null,'100','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','감포읍','105','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','안강읍','100','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','건천읍','98','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','외동읍','102','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','문무대왕면','104','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','양남면','104','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','내남면','100','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','산내면','97','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','서면','97','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','현곡면','100','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','강동면','101','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','천북면','101','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','중부동','100','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','황오동','100','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','성건동','100','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','황남동','100','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','선도동','99','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','월성동','100','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','용강동','100','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','황성동','100','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','동천동','100','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','불국동','101','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경주시','보덕동','101','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시',null,'80','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','아포읍','83','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','농소면','81','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','남면','82','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','개령면','81','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','감문면','81','98');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','어모면','80','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','봉산면','79','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','대항면','79','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','감천면','80','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','조마면','80','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','구성면','79','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','지례면','79','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','부항면','77','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','대덕면','78','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','증산면','79','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','자산동','80','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','평화남산동','80','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','양금동','80','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','대신동','80','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','대곡동','80','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','지좌동','81','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','김천시','율곡동','81','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시',null,'91','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','풍산읍','88','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','와룡면','91','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','북후면','90','108');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','서후면','90','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','풍천면','87','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','일직면','90','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','남후면','90','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','남선면','91','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','임하면','92','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','길안면','94','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','임동면','94','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','예안면','93','108');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','도산면','92','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','녹전면','91','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','중구동','91','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','명륜동','91','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','용상동','91','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','서구동','90','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','태화동','90','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','평화동','90','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','안기동','90','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','옥동','90','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','송하동','90','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','안동시','강남동','91','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시',null,'84','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','선산읍','83','98');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','고아읍','84','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','산동읍','86','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','무을면','82','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','옥성면','83','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','도개면','84','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','해평면','85','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','장천면','87','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','송정동','84','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','원평동','84','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','도량동','84','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','지산동','84','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','선주원남동','84','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','형곡1동','84','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','형곡2동','84','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','신평1동','85','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','신평2동','85','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','비산동','85','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','광평동','85','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','상모사곡동','84','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','임오동','85','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','인동동','86','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','진미동','86','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','양포동','86','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','구미시','공단동','85','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영주시',null,'89','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영주시','풍기읍','87','112');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영주시','이산면','89','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영주시','평은면','90','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영주시','문수면','89','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영주시','장수면','88','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영주시','안정면','87','112');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영주시','봉현면','87','112');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영주시','순흥면','88','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영주시','단산면','88','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영주시','부석면','89','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영주시','상망동','89','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영주시','하망동','89','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영주시','영주1동','89','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영주시','영주2동','89','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영주시','휴천1동','89','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영주시','휴천2동','89','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영주시','휴천3동','89','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영주시','가흥1동','89','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영주시','가흥2동','88','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영천시',null,'95','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영천시','금호읍','94','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영천시','청통면','93','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영천시','신녕면','92','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영천시','화산면','93','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영천시','화북면','94','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영천시','화남면','94','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영천시','자양면','96','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영천시','임고면','95','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영천시','고경면','97','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영천시','북안면','96','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영천시','대창면','94','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영천시','동부동','95','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영천시','중앙동','95','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영천시','서부동','95','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영천시','완산동','95','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영천시','남부동','95','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시',null,'81','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','함창읍','81','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','중동면','83','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','사벌국면','82','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','낙동면','82','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','청리면','80','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','공성면','80','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','외남면','80','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','내서면','79','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','모동면','77','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','모서면','77','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','화동면','77','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','화서면','77','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','화북면','77','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','외서면','80','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','은척면','79','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','공검면','81','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','이안면','80','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','화남면','76','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','남원동','81','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','북문동','81','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','계림동','81','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','동문동','81','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','동성동','81','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','상주시','신흥동','81','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','문경시',null,'81','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','문경시','문경읍','80','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','문경시','가은읍','79','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','문경시','영순면','82','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','문경시','산양면','82','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','문경시','호계면','82','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','문경시','산북면','82','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','문경시','동로면','83','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','문경시','마성면','80','108');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','문경시','농암면','78','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','문경시','점촌1동','81','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','문경시','점촌2동','81','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','문경시','점촌3동','82','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','문경시','점촌4동','81','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','문경시','점촌5동','81','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경산시',null,'91','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경산시','하양읍','93','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경산시','진량읍','93','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경산시','압량읍','92','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경산시','와촌면','93','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경산시','자인면','93','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경산시','용성면','94','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경산시','남산면','93','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경산시','남천면','91','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경산시','중방동','91','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경산시','중앙동','91','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경산시','남부동','91','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경산시','서부1동','91','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경산시','서부2동','91','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경산시','북부동','92','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','경산시','동부동','92','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','의성군',null,'90','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','의성군','의성읍','90','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','의성군','단촌면','90','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','의성군','점곡면','91','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','의성군','옥산면','92','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','의성군','사곡면','92','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','의성군','춘산면','92','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','의성군','가음면','91','98');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','의성군','금성면','90','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','의성군','봉양면','88','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','의성군','비안면','87','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','의성군','구천면','86','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','의성군','단밀면','85','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','의성군','단북면','85','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','의성군','안계면','86','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','의성군','다인면','84','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','의성군','신평면','87','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','의성군','안평면','88','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','의성군','안사면','86','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','청송군',null,'96','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','청송군','청송읍','96','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','청송군','주왕산면','98','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','청송군','부남면','97','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','청송군','현동면','96','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','청송군','현서면','94','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','청송군','안덕면','95','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','청송군','파천면','96','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','청송군','진보면','96','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영양군',null,'97','108');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영양군','영양읍','97','108');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영양군','입암면','97','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영양군','청기면','96','108');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영양군','일월면','98','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영양군','수비면','99','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영양군','석보면','98','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영덕군',null,'102','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영덕군','영덕읍','102','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영덕군','강구면','102','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영덕군','남정면','102','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영덕군','달산면','101','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영덕군','지품면','100','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영덕군','축산면','103','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영덕군','영해면','103','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영덕군','병곡면','103','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','영덕군','창수면','102','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','청도군',null,'91','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','청도군','화양읍','91','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','청도군','청도읍','92','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','청도군','각남면','90','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','청도군','풍각면','89','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','청도군','각북면','89','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','청도군','이서면','90','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','청도군','운문면','95','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','청도군','금천면','94','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','청도군','매전면','94','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','고령군',null,'83','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','고령군','대가야읍','83','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','고령군','덕곡면','82','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','고령군','운수면','84','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','고령군','성산면','85','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','고령군','다산면','86','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','고령군','개진면','85','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','고령군','우곡면','84','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','고령군','쌍림면','83','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','성주군',null,'83','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','성주군','성주읍','83','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','성주군','선남면','85','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','성주군','용암면','84','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','성주군','수륜면','82','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','성주군','가천면','81','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','성주군','금수면','81','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','성주군','대가면','82','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','성주군','벽진면','82','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','성주군','초전면','83','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','성주군','월항면','84','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','칠곡군',null,'85','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','칠곡군','왜관읍','85','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','칠곡군','북삼읍','84','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','칠곡군','석적읍','85','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','칠곡군','지천면','87','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','칠곡군','동명면','88','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','칠곡군','가산면','88','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','칠곡군','약목면','85','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','칠곡군','기산면','85','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','예천군',null,'86','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','예천군','예천읍','86','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','예천군','용문면','85','108');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','예천군','감천면','87','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','예천군','보문면','87','108');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','예천군','호명면','86','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','예천군','유천면','85','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','예천군','용궁면','83','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','예천군','개포면','84','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','예천군','지보면','85','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','예천군','풍양면','83','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','예천군','효자면','85','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','예천군','은풍면','86','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','봉화군',null,'90','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','봉화군','봉화읍','91','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','봉화군','물야면','90','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','봉화군','봉성면','92','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','봉화군','법전면','93','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','봉화군','춘양면','94','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','봉화군','소천면','95','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','봉화군','재산면','95','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','봉화군','명호면','93','112');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','봉화군','상운면','91','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','봉화군','석포면','96','116');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','울진군',null,'102','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','울진군','울진읍','102','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','울진군','평해읍','103','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','울진군','북면','101','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','울진군','근남면','102','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','울진군','기성면','103','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','울진군','온정면','101','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','울진군','죽변면','102','117');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','울진군','후포면','103','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','울진군','금강송면','99','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','울진군','매화면','102','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','울릉군',null,'127','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','울릉군','울릉읍','127','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','울릉군','서면','126','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','울릉군','북면','127','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상북도','울릉군','독도','144','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도',null,null,'91','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시의창구',null,'90','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시의창구','동읍','91','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시의창구','북면','89','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시의창구','대산면','91','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시의창구','의창동','90','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시의창구','팔룡동','90','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시의창구','명곡동','90','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시의창구','봉림동','91','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시성산구',null,'91','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시성산구','반송동','91','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시성산구','용지동','91','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시성산구','중앙동','91','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시성산구','상남동','91','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시성산구','사파동','91','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시성산구','가음정동','91','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시성산구','성주동','91','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시성산구','웅남동','90','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산합포구',null,'89','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산합포구','구산면','89','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산합포구','진동면','88','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산합포구','진북면','87','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산합포구','진전면','86','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산합포구','현동','89','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산합포구','가포동','89','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산합포구','월영동','89','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산합포구','문화동','89','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산합포구','중앙동','89','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산합포구','완월동','89','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산합포구','자산동','89','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산합포구','교방동','89','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산합포구','오동동','89','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산합포구','합포동','89','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산합포구','산호동','89','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산회원구',null,'89','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산회원구','내서읍','88','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산회원구','회원1동','89','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산회원구','회원2동','89','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산회원구','석전동','89','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산회원구','회성동','89','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산회원구','양덕1동','89','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산회원구','양덕2동','89','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산회원구','합성1동','89','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산회원구','합성2동','89','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산회원구','구암1동','89','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산회원구','구암2동','89','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시마산회원구','봉암동','89','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시진해구',null,'91','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시진해구','충무동','91','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시진해구','여좌동','91','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시진해구','태백동','91','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시진해구','경화동','91','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시진해구','병암동','91','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시진해구','석동','91','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시진해구','이동','91','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시진해구','자은동','91','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시진해구','덕산동','91','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시진해구','풍호동','91','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시진해구','웅천동','92','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시진해구','웅동1동','93','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창원시진해구','웅동2동','93','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시',null,'81','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','문산읍','82','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','내동면','80','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','정촌면','81','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','금곡면','82','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','진성면','83','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','일반성면','84','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','이반성면','85','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','사봉면','84','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','지수면','83','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','대곡면','82','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','금산면','81','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','집현면','80','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','미천면','81','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','명석면','79','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','대평면','78','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','수곡면','77','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','천전동','80','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','성북동','80','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','중앙동','80','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','상봉동','80','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','상대동','81','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','하대동','81','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','상평동','81','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','초장동','81','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','평거동','79','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','신안동','80','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','이현동','80','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','판문동','80','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','가호동','81','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','진주시','충무공동','81','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','통영시',null,'87','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','통영시','산양읍','86','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','통영시','용남면','87','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','통영시','도산면','85','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','통영시','광도면','86','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','통영시','욕지면','84','63');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','통영시','한산면','88','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','통영시','사량면','83','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','통영시','도천동','86','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','통영시','명정동','86','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','통영시','중앙동','87','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','통영시','정량동','87','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','통영시','북신동','87','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','통영시','미수동','86','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','통영시','봉평동','86','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','통영시','무전동','87','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','사천시',null,'80','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','사천시','사천읍','80','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','사천시','정동면','81','72');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','사천시','사남면','80','72');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','사천시','용현면','80','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','사천시','축동면','80','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','사천시','곤양면','78','72');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','사천시','곤명면','78','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','사천시','서포면','78','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','사천시','동서동','80','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','사천시','선구동','80','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','사천시','동서금동','80','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','사천시','벌용동','80','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','예산군','신양면','58','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','예산군','광시면','57','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','예산군','대흥면','57','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','예산군','응봉면','56','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','예산군','덕산면','55','108');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','예산군','봉산면','55','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','예산군','고덕면','56','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','예산군','신암면','57','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','예산군','오가면','57','108');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','태안군',null,'48','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','태안군','태안읍','48','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','태안군','안면읍','49','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','태안군','고남면','50','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','태안군','남면','48','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','태안군','근흥면','47','108');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','태안군','소원면','46','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','태안군','원북면','48','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','태안군','이원면','48','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도',null,null,'51','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시',null,'50','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','용당1동','50','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','용당2동','50','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','연동','50','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','산정동','50','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','연산동','50','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','원산동','50','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','대성동','50','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','목원동','50','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','동명동','50','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','삼학동','50','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','만호동','50','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','유달동','50','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','죽교동','50','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','북항동','50','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','용해동','50','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','이로동','50','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','상동','50','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','하당동','51','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','신흥동','51','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','삼향동','51','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','옥암동','51','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','부흥동','51','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','목포시','부주동','51','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시',null,'73','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','돌산읍','74','63');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','소라면','72','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','율촌면','71','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','화양면','72','65');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','남면','75','60');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','화정면','73','63');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','삼산면','67','50');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','동문동','74','65');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','한려동','74','65');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','중앙동','74','65');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','충무동','74','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','광림동','74','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','서강동','74','65');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','대교동','74','65');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','국동','74','65');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','월호동','74','65');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','여서동','74','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','문수동','74','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','미평동','74','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','둔덕동','73','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','만덕동','74','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','쌍봉동','73','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','시전동','73','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','여천동','73','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','주삼동','73','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','삼일동','73','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','여수시','묘도동','74','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시',null,'70','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','승주읍','68','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','해룡면','71','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','서면','70','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','황전면','69','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','월등면','68','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','주암면','65','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','송광면','66','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','외서면','66','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','낙안면','67','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','별량면','69','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','상사면','69','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','향동','70','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','매곡동','70','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','삼산동','70','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','조곡동','70','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','덕연동','70','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','풍덕동','70','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','남제동','70','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','저전동','70','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','장천동','70','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','중앙동','70','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','도사동','70','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','왕조1동','70','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','순천시','왕조2동','70','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','나주시',null,'56','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','나주시','남평읍','58','72');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','나주시','세지면','56','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','나주시','왕곡면','55','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','나주시','반남면','55','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','나주시','공산면','54','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','나주시','동강면','53','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','나주시','다시면','54','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','나주시','문평면','54','72');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','나주시','노안면','56','72');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','나주시','금천면','57','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','나주시','산포면','57','72');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','나주시','다도면','58','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','나주시','봉황면','57','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','나주시','송월동','56','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','나주시','영강동','56','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','나주시','금남동','56','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','나주시','성북동','56','72');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','나주시','영산동','56','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','나주시','이창동','56','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','나주시','빛가람동','57','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','광양시',null,'73','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','광양시','광양읍','71','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','광양시','봉강면','71','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','광양시','옥룡면','72','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','광양시','옥곡면','73','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','광양시','진상면','74','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','광양시','진월면','74','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','광양시','다압면','73','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','광양시','골약동','73','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','광양시','중마동','73','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','광양시','광영동','74','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','광양시','금호동','74','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','광양시','태인동','74','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','담양군',null,'61','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','담양군','담양읍','61','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','담양군','봉산면','60','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','담양군','고서면','60','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','담양군','가사문학면','61','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','담양군','창평면','61','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','담양군','대덕면','62','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','담양군','무정면','61','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','담양군','금성면','61','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','담양군','용면','61','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','담양군','월산면','60','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','담양군','수북면','60','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','담양군','대전면','59','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','곡성군',null,'66','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','곡성군','곡성읍','66','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','곡성군','오곡면','66','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','곡성군','삼기면','65','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','곡성군','석곡면','65','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','곡성군','목사동면','66','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','곡성군','죽곡면','67','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','곡성군','고달면','67','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','곡성군','옥과면','63','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','곡성군','입면','64','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','곡성군','겸면','64','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','곡성군','오산면','63','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','구례군',null,'69','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','구례군','구례읍','69','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','구례군','문척면','70','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','구례군','간전면','71','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','구례군','토지면','70','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','구례군','마산면','70','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','구례군','광의면','69','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','구례군','용방면','69','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','구례군','산동면','69','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','고흥군',null,'66','62');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','고흥군','고흥읍','66','62');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전라남도','고흥군','도양읍','64','61');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','노은면','73','116');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','앙성면','73','117');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','중앙탑면','75','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','금가면','76','116');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','동량면','77','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','산척면','77','116');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','엄정면','76','117');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','소태면','75','117');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','성내.충인동','77','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','교현.안림동','77','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','교현2동','76','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','용산동','77','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','지현동','77','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','문화동','76','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','호암.직동','77','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','달천동','76','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','봉방동','76','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','칠금.금릉동','76','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','연수동','77','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','충주시','목행.용탄동','76','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','제천시',null,'81','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','제천시','봉양읍','80','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','제천시','금성면','81','116');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','제천시','청풍면','81','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','제천시','수산면','81','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','제천시','덕산면','81','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','제천시','한수면','79','112');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','제천시','백운면','78','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','제천시','송학면','82','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','제천시','교동','81','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','제천시','의림지동','81','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','제천시','중앙동','81','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','제천시','남현동','81','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','제천시','영서동','81','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','제천시','용두동','81','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','제천시','신백동','82','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','제천시','청전동','81','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','제천시','화산동','81','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','보은군',null,'73','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','보은군','보은읍','73','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','보은군','속리산면','75','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','보은군','장안면','74','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','보은군','마로면','75','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','보은군','탄부면','74','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','보은군','삼승면','73','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','보은군','수한면','73','103');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','보은군','회남면','71','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','보은군','회인면','71','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','보은군','내북면','72','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','보은군','산외면','73','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','옥천군',null,'71','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','옥천군','옥천읍','71','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','옥천군','동이면','71','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','옥천군','안남면','72','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','옥천군','안내면','72','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','옥천군','청성면','74','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','옥천군','청산면','74','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','옥천군','이원면','71','98');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','옥천군','군서면','70','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','옥천군','군북면','70','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','영동군',null,'74','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','영동군','영동읍','74','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','영동군','용산면','75','99');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','영동군','황간면','77','98');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','영동군','추풍령면','78','98');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','영동군','매곡면','77','97');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','영동군','상촌면','77','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','영동군','양강면','74','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','영동군','용화면','74','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','영동군','학산면','73','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','영동군','양산면','72','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','영동군','심천면','73','98');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','증평군',null,'71','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','증평군','증평읍','71','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','증평군','도안면','71','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','진천군',null,'68','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','진천군','진천읍','68','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','진천군','덕산읍','69','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','진천군','초평면','70','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','진천군','문백면','68','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','진천군','백곡면','67','112');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','진천군','이월면','68','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','진천군','광혜원면','68','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','괴산군',null,'74','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','괴산군','괴산읍','74','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','괴산군','감물면','76','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','괴산군','장연면','77','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','괴산군','연풍면','78','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','괴산군','칠성면','75','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','괴산군','문광면','74','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','괴산군','청천면','73','107');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','괴산군','청안면','72','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','괴산군','사리면','72','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','괴산군','소수면','73','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','괴산군','불정면','75','112');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','음성군',null,'72','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','음성군','음성읍','72','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','음성군','금왕읍','71','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','음성군','소이면','74','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','음성군','원남면','72','112');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','음성군','맹동면','70','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','음성군','대소면','69','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','음성군','삼성면','69','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','음성군','생극면','71','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','음성군','감곡면','71','117');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','단양군',null,'84','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','단양군','단양읍','84','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','단양군','매포읍','83','116');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','단양군','대강면','84','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','단양군','가곡면','84','115');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','단양군','영춘면','86','117');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','단양군','어상천면','84','117');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','단양군','적성면','83','114');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청북도','단양군','단성면','83','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도',null,null,'68','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시동남구',null,'63','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시동남구','목천읍','65','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시동남구','풍세면','63','108');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시동남구','광덕면','62','108');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시동남구','북면','65','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시동남구','성남면','65','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시동남구','수신면','65','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시동남구','병천면','66','109');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시동남구','동면','66','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시동남구','중앙동','63','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시동남구','문성동','63','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시동남구','원성1동','63','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시동남구','원성2동','63','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시동남구','봉명동','63','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시동남구','일봉동','63','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시동남구','신방동','63','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시동남구','청룡동','63','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시동남구','신안동','63','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시서북구',null,'63','112');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시서북구','성환읍','63','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시서북구','성거읍','64','112');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시서북구','직산읍','63','112');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시서북구','입장면','64','113');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시서북구','성정1동','63','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시서북구','성정2동','63','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시서북구','쌍용1동','63','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시서북구','쌍용2동','63','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시서북구','쌍용3동','63','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시서북구','백석동','62','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시서북구','불당1동','62','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시서북구','불당2동','62','110');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시서북구','부성1동','63','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','천안시서북구','부성2동','63','111');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','공주시',null,'63','102');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','공주시','유구읍','60','105');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','공주시','이인면','62','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','공주시','탄천면','61','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','공주시','계룡면','63','100');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','공주시','반포면','65','101');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','공주시','의당면','63','104');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('충청남도','공주시','정안면','63','106');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','사천시','향촌동','81','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','사천시','남양동','80','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','김해시',null,'95','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','김해시','진영읍','92','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','김해시','주촌면','93','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','김해시','진례면','92','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','김해시','한림면','93','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','김해시','생림면','94','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','김해시','상동면','95','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','김해시','대동면','96','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','김해시','동상동','94','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','김해시','회현동','94','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','김해시','부원동','94','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','김해시','내외동','94','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','김해시','북부동','94','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','김해시','칠산서부동','94','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','김해시','활천동','95','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','김해시','삼안동','95','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','김해시','불암동','95','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','김해시','장유1동','93','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','김해시','장유2동','93','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','김해시','장유3동','93','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','밀양시',null,'92','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','밀양시','삼랑진읍','93','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','밀양시','하남읍','91','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','밀양시','부북면','91','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','밀양시','상동면','92','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','밀양시','산외면','93','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','밀양시','산내면','94','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','밀양시','단장면','94','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','밀양시','상남면','92','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','밀양시','초동면','91','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','밀양시','무안면','90','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','밀양시','청도면','90','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','밀양시','내일동','92','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','밀양시','내이동','92','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','밀양시','삼문동','92','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','밀양시','가곡동','92','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','밀양시','교동','92','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거제시',null,'90','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거제시','일운면','92','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거제시','동부면','90','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거제시','남부면','90','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거제시','거제면','89','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거제시','둔덕면','88','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거제시','사등면','88','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거제시','연초면','91','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거제시','하청면','91','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거제시','장목면','91','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거제시','장승포동','92','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거제시','능포동','92','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거제시','아주동','91','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거제시','옥포1동','91','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거제시','옥포2동','91','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거제시','장평동','90','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거제시','고현동','90','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거제시','상문동','90','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거제시','수양동','91','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','양산시',null,'97','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','양산시','물금읍','96','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','양산시','동면','98','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','양산시','원동면','95','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','양산시','상북면','97','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','양산시','하북면','98','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','양산시','중앙동','97','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','양산시','양주동','97','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','양산시','삼성동','97','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','양산시','강서동','97','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','양산시','서창동','99','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','양산시','소주동','99','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','양산시','평산동','99','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','양산시','덕계동','99','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','의령군',null,'83','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','의령군','의령읍','83','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','의령군','가례면','83','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','의령군','칠곡면','82','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','의령군','대의면','81','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','의령군','화정면','82','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','의령군','용덕면','84','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','의령군','정곡면','84','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','의령군','지정면','85','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','의령군','낙서면','85','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','의령군','부림면','84','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','의령군','봉수면','83','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','의령군','궁류면','83','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','의령군','유곡면','84','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함안군',null,'86','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함안군','가야읍','86','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함안군','칠원읍','88','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함안군','함안면','86','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함안군','군북면','85','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함안군','법수면','85','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함안군','대산면','86','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함안군','칠서면','87','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함안군','칠북면','88','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함안군','산인면','86','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함안군','여항면','86','76');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창녕군',null,'87','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창녕군','창녕읍','87','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창녕군','남지읍','87','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창녕군','고암면','88','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창녕군','성산면','87','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창녕군','대합면','87','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창녕군','이방면','85','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창녕군','유어면','86','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창녕군','대지면','87','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창녕군','계성면','88','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창녕군','영산면','88','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창녕군','장마면','87','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창녕군','도천면','88','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창녕군','길곡면','89','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','창녕군','부곡면','89','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','고성군',null,'85','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','고성군','고성읍','85','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','고성군','삼산면','84','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','고성군','하일면','82','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','고성군','하이면','81','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','고성군','상리면','82','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','고성군','대가면','84','72');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','고성군','영현면','82','72');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','고성군','영오면','83','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','고성군','개천면','83','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','고성군','구만면','85','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','고성군','회화면','85','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','고성군','마암면','85','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','고성군','동해면','86','72');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','고성군','거류면','86','71');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','남해군',null,'77','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','남해군','남해읍','77','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','남해군','이동면','78','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','남해군','상주면','79','65');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','남해군','삼동면','79','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','남해군','미조면','80','65');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','남해군','남면','77','66');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','남해군','서면','76','67');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','남해군','고현면','77','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','남해군','설천면','77','69');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','남해군','창선면','79','68');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','하동군',null,'74','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','하동군','하동읍','74','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','하동군','화개면','72','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','하동군','악양면','74','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','하동군','적량면','75','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','하동군','횡천면','75','73');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','하동군','고전면','76','72');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','하동군','금남면','76','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','하동군','진교면','77','72');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','하동군','양보면','76','72');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','하동군','북천면','77','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','하동군','청암면','75','74');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','하동군','옥종면','77','75');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','하동군','금성면','75','70');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','산청군',null,'76','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','산청군','산청읍','76','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','산청군','차황면','77','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','산청군','오부면','76','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','산청군','생초면','76','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','산청군','금서면','76','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','산청군','삼장면','76','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','산청군','시천면','76','77');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','산청군','단성면','78','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','산청군','신안면','78','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','산청군','생비량면','79','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','산청군','신등면','79','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함양군',null,'74','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함양군','함양읍','74','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함양군','마천면','73','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함양군','휴천면','74','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함양군','유림면','75','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함양군','수동면','75','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함양군','지곡면','74','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함양군','안의면','75','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함양군','서하면','73','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함양군','서상면','73','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함양군','백전면','72','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','함양군','병곡면','73','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거창군',null,'77','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거창군','거창읍','77','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거창군','주상면','77','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거창군','웅양면','77','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거창군','고제면','76','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거창군','북상면','75','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거창군','위천면','75','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거창군','마리면','76','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거창군','남상면','77','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거창군','남하면','77','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거창군','신원면','77','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거창군','가조면','79','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','거창군','가북면','78','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','합천군',null,'81','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','합천군','합천읍','81','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','합천군','봉산면','79','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','합천군','묘산면','80','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','합천군','가야면','81','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','합천군','야로면','81','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','합천군','율곡면','82','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','합천군','초계면','83','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','합천군','쌍책면','83','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','합천군','덕곡면','85','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','합천군','청덕면','84','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','합천군','적중면','83','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','합천군','대양면','82','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','합천군','쌍백면','81','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','합천군','삼가면','81','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','합천군','가회면','79','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','합천군','대병면','79','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('경상남도','합천군','용주면','81','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도',null,null,'52','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시',null,'53','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','한림읍','48','36');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','애월읍','49','37');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','구좌읍','59','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','조천읍','55','39');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','한경면','46','35');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','추자면','48','48');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','우도면','60','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','일도1동','53','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','일도2동','53','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','이도1동','53','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','이도2동','53','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','삼도1동','53','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','삼도2동','53','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','용담1동','52','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','용담2동','52','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','건입동','53','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','화북동','53','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','삼양동','54','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','봉개동','54','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','아라동','53','37');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','오라동','52','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','연동','52','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','노형동','52','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','외도동','51','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','이호동','51','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','제주시','도두동','52','38');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','서귀포시',null,'52','33');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','서귀포시','대정읍/마라도포함','48','32');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','서귀포시','남원읍','56','33');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','서귀포시','성산읍','60','37');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','서귀포시','안덕면','49','32');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','서귀포시','표선면','58','34');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','서귀포시','송산동','53','32');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','서귀포시','정방동','53','32');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','서귀포시','중앙동','53','32');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','서귀포시','천지동','53','32');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','서귀포시','효돈동','54','33');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','서귀포시','영천동','54','33');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','서귀포시','동홍동','53','33');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','서귀포시','서홍동','53','33');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','서귀포시','대륜동','52','32');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','서귀포시','대천동','52','32');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','서귀포시','중문동','51','32');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('제주특별자치도','서귀포시','예래동','50','32');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('이어도',null,null,'28','8');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('이어도',null,null,'28','8');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도',null,null,'73','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시',null,'73','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','신북읍','73','135');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','동면','73','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','동산면','74','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','신동면','72','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','남면','70','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','서면','72','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','사북면','71','137');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','북산면','75','136');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','동내면','73','133');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','남산면','71','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','교동','73','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','조운동','73','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','약사명동','73','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','근화동','72','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','소양동','73','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','후평1동','73','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','후평2동','73','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','후평3동','73','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','효자1동','73','133');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','효자2동','73','133');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','효자3동','73','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','석사동','73','133');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','퇴계동','73','133');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','강남동','72','133');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','춘천시','신사우동','73','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시',null,'76','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','문막읍','74','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','소초면','78','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','호저면','76','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','지정면','75','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','부론면','73','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','귀래면','76','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','흥업면','76','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','판부면','78','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','신림면','79','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','중앙동','77','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','원인동','77','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','개운동','77','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','명륜1동','77','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','명륜2동','77','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','단구동','77','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','일산동','77','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','학성동','77','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','단계동','76','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','우산동','76','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','태장1동','77','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','태장2동','77','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','봉산동','77','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','행구동','77','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','무실동','76','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','원주시','반곡관설동','77','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시',null,'92','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시','주문진읍','91','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시','성산면','92','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시','왕산면','92','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시','구정면','92','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시','강동면','94','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시','옥계면','95','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시','사천면','92','133');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시','연곡면','92','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시','홍제동','92','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시','중앙동','93','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시','옥천동','93','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시','교1동','92','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시','교2동','93','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시','포남1동','93','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시','포남2동','93','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시','초당동','93','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시','송정동','93','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시','내곡동','92','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시','강남동','93','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시','성덕동','93','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','강릉시','경포동','92','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','동해시',null,'97','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','동해시','천곡동','97','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','동해시','송정동','97','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','동해시','북삼동','97','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','동해시','부곡동','96','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','동해시','동호동','96','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','동해시','발한동','96','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','동해시','묵호동','97','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','동해시','북평동','97','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','동해시','망상동','96','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','동해시','삼화동','96','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','태백시',null,'95','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','태백시','황지동','95','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','태백시','황연동','95','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','태백시','삼수동','95','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','태백시','상장동','95','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','태백시','문곡소도동','94','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','태백시','장성동','95','117');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','태백시','구문소동','95','117');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','태백시','철암동','96','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','속초시',null,'87','141');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','속초시','영랑동','87','141');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','속초시','동명동','87','141');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','속초시','금호동','87','141');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','속초시','교동','87','141');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','속초시','노학동','87','141');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','속초시','조양동','87','141');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','속초시','청호동','87','141');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','속초시','대포동','87','140');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','삼척시',null,'98','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','삼척시','도계읍','96','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','삼척시','원덕읍','101','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','삼척시','근덕면','99','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','삼척시','하장면','94','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','삼척시','노곡면','98','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','삼척시','미로면','97','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','삼척시','가곡면','98','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','삼척시','신기면','96','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','삼척시','남양동','98','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','삼척시','교동','98','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','삼척시','정라동','98','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','삼척시','성내동','97','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','홍천군',null,'75','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','홍천군','홍천읍','75','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','홍천군','화촌면','77','131');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','홍천군','두촌면','78','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','홍천군','내촌면','79','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','홍천군','서석면','81','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','홍천군','영귀미면','76','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','홍천군','남면','73','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','홍천군','서면','72','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','홍천군','북방면','75','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','홍천군','내면','84','132');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','횡성군',null,'77','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','횡성군','횡성읍','77','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','횡성군','우천면','79','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','횡성군','안흥면','80','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','횡성군','둔내면','81','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','횡성군','갑천면','79','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','횡성군','청일면','80','127');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','횡성군','공근면','77','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','횡성군','서원면','75','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','횡성군','강림면','80','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','영월군',null,'86','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','영월군','영월읍','86','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','영월군','상동읍','92','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','영월군','산솔면','89','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','영월군','김삿갓면','88','118');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','영월군','북면','85','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','영월군','남면','85','119');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','영월군','한반도면','83','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','영월군','주천면','82','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','영월군','무릉도원면','82','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','평창군',null,'84','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','평창군','평창읍','84','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','평창군','미탄면','86','122');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','평창군','방림면','84','124');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','평창군','대화면','85','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','평창군','봉평면','84','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','평창군','용평면','85','128');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','평창군','진부면','87','129');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','평창군','대관령면','89','130');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','정선군',null,'89','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','정선군','정선읍','89','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','정선군','고한읍','92','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','정선군','사북읍','92','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','정선군','신동읍','89','120');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','정선군','남면','90','121');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','정선군','북평면','89','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','정선군','임계면','92','126');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','정선군','화암면','91','123');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','정선군','여량면','90','125');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','철원군',null,'65','139');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','철원군','철원읍','64','141');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','철원군','김화읍','67','142');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','철원군','갈말읍','65','139');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','철원군','동송읍','64','141');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','철원군','서면','67','140');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','철원군','근남면','68','141');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','철원군','근북면','67','143');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','철원군','근동면','69','143');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','철원군','원동면','73','143');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','철원군','원남면','71','143');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','철원군','임남면','75','143');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','화천군',null,'72','139');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','화천군','화천읍','72','139');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','화천군','간동면','74','137');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','화천군','하남면','71','138');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','화천군','상서면','71','140');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','화천군','사내면','69','138');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','양구군',null,'77','139');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','양구군','양구읍','77','139');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','양구군','국토정중앙면','78','139');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','양구군','동면','78','141');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','양구군','방산면','76','141');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','양구군','해안면','79','143');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','인제군',null,'80','138');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','인제군','인제읍','80','138');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','인제군','남면','79','136');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','인제군','북면','81','139');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','인제군','기린면','83','136');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','인제군','서화면','81','141');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','인제군','상남면','82','134');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','고성군',null,'85','145');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','고성군','간성읍','85','145');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','고성군','거진읍','85','146');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','고성군','현내면','84','147');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','고성군','죽왕면','86','144');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','고성군','토성면','87','142');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','고성군','수동면','82','146');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','양양군',null,'88','138');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','양양군','양양읍','88','138');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','양양군','서면','87','138');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','양양군','손양면','88','138');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','양양군','현북면','89','137');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','양양군','현남면','90','136');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('강원특별자치도','양양군','강현면','87','140');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도',null,null,'63','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시완산구',null,'63','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시완산구','중앙동','63','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시완산구','풍남동','63','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시완산구','노송동','63','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시완산구','완산동','63','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시완산구','동서학동','63','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시완산구','서서학동','63','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시완산구','중화산1동','63','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시완산구','중화산2동','63','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시완산구','서신동','63','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시완산구','평화1동','63','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시완산구','평화2동','63','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시완산구','삼천1동','63','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시완산구','삼천2동','63','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시완산구','삼천3동','63','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시완산구','효자1동','63','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시완산구','효자2동','63','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시완산구','효자3동','63','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시완산구','효자4동','62','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시완산구','효자5동','63','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시덕진구',null,'63','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시덕진구','진북동','63','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시덕진구','인후1동','63','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시덕진구','인후2동','63','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시덕진구','인후3동','64','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시덕진구','덕진동','63','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시덕진구','금암1동','63','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시덕진구','금암2동','63','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시덕진구','팔복동','63','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시덕진구','우아1동','64','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시덕진구','우아2동','64','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시덕진구','호성동','63','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시덕진구','송천1동','63','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시덕진구','송천2동','63','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시덕진구','조촌동','62','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시덕진구','여의동','62','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','전주시덕진구','혁신동','62','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시',null,'56','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','옥구읍','55','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','옥산면','56','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','회현면','56','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','임피면','58','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','서수면','58','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','대야면','57','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','개정면','57','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','성산면','57','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','나포면','58','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','옥도면','43','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','옥서면','54','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','해신동','55','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','월명동','56','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','신풍동','55','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','삼학동','56','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','중앙동','56','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','흥남동','56','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','조촌동','56','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','경암동','56','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','구암동','56','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','개정동','56','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','수송동','56','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','나운1동','55','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','나운2동','55','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','나운3동','55','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','소룡동','55','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','군산시','미성동','55','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시',null,'60','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','함열읍','60','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','오산면','59','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','황등면','60','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','함라면','59','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','웅포면','58','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','성당면','59','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','용안면','60','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','낭산면','61','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','망성면','61','96');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','여산면','62','94');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','금마면','62','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','왕궁면','62','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','춘포면','61','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','삼기면','60','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','용동면','60','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','중앙동','60','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','평화동','60','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','인화동','60','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','동산동','60','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','마동','60','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','남중동','60','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','모현동','60','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','송학동','60','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','영등1동','60','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','영등2동','60','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','어양동','60','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','신동','60','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','팔봉동','61','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','익산시','삼성동','60','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시',null,'58','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','신태인읍','59','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','북면','59','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','입암면','57','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','소성면','57','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','고부면','57','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','영원면','57','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','덕천면','58','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','이평면','58','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','정우면','59','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','태인면','60','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','감곡면','59','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','옹동면','60','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','칠보면','61','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','산내면','61','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','산외면','61','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','수성동','58','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','장명동','58','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','내장상동','58','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','시기동','58','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','초산동','58','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','연지동','58','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','농소동','58','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','정읍시','상교동','58','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시',null,'68','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','운봉읍','70','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','주천면','69','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','수지면','67','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','송동면','67','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','주생면','67','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','금지면','66','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','대강면','65','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','대산면','67','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','사매면','67','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','덕과면','67','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','보절면','68','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','산동면','69','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','이백면','69','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','아영면','72','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','산내면','72','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','인월면','71','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','동충동','68','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','죽항동','68','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','노암동','68','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','금동','67','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','왕정동','67','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','향교동','68','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','남원시','도통동','68','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','김제시',null,'59','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','김제시','만경읍','58','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','김제시','죽산면','57','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','김제시','백산면','59','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','김제시','용지면','60','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','김제시','백구면','60','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','김제시','부량면','58','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','김제시','공덕면','59','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','김제시','청하면','58','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','김제시','성덕면','57','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','김제시','진봉면','57','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','김제시','금구면','61','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','김제시','봉남면','60','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','김제시','황산면','60','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','김제시','금산면','61','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','김제시','광활면','56','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','김제시','요촌동','59','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','김제시','신풍동','59','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','김제시','검산동','59','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','김제시','교월동','59','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','완주군',null,'63','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','완주군','삼례읍','62','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','완주군','봉동읍','64','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','완주군','용진읍','63','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','완주군','상관면','64','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','완주군','이서면','61','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','완주군','소양면','65','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','완주군','구이면','63','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','완주군','고산면','64','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','완주군','비봉면','63','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','완주군','운주면','66','95');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','완주군','화산면','64','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','완주군','동상면','66','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','완주군','경천면','65','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','진안군',null,'68','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','진안군','진안읍','68','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','진안군','용담면','70','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','진안군','안천면','70','91');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','진안군','동향면','71','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','진안군','상전면','69','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','진안군','백운면','68','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','진안군','성수면','66','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','진안군','마령면','67','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','진안군','부귀면','67','89');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','진안군','정천면','68','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','진안군','주천면','68','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','무주군',null,'72','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','무주군','무주읍','72','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','무주군','무풍면','76','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','무주군','설천면','75','93');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','무주군','적상면','72','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','무주군','안성면','72','90');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','무주군','부남면','71','92');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','장수군',null,'70','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','장수군','장수읍','70','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','장수군','산서면','68','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','장수군','번암면','70','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','장수군','장계면','71','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','장수군','천천면','70','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','장수군','계남면','71','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','장수군','계북면','72','88');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','임실군',null,'66','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','임실군','임실읍','66','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','임실군','청웅면','64','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','임실군','운암면','63','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','임실군','신평면','65','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','임실군','성수면','67','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','임실군','오수면','67','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','임실군','신덕면','64','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','임실군','삼계면','66','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','임실군','관촌면','66','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','임실군','강진면','64','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','임실군','덕치면','64','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','임실군','지사면','67','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','순창군',null,'63','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','순창군','순창읍','63','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','순창군','인계면','63','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','순창군','동계면','65','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','순창군','풍산면','63','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','순창군','금과면','62','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','순창군','팔덕면','63','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','순창군','쌍치면','61','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','순창군','복흥면','60','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','순창군','적성면','65','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','순창군','유등면','64','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','순창군','구림면','63','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','고창군',null,'56','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','고창군','고창읍','56','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','고창군','고수면','55','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','고창군','아산면','54','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','고창군','무장면','53','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','고창군','공음면','52','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','고창군','상하면','52','80');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','고창군','해리면','53','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','고창군','성송면','55','79');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','고창군','대산면','54','78');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','고창군','심원면','53','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','고창군','흥덕면','56','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','고창군','성내면','56','83');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','고창군','신림면','56','81');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','고창군','부안면','55','82');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','부안군',null,'56','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','부안군','부안읍','56','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','부안군','주산면','56','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','부안군','동진면','56','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','부안군','행안면','56','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','부안군','계화면','55','87');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','부안군','보안면','55','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','부안군','변산면','52','85');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','부안군','진서면','54','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','부안군','백산면','57','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','부안군','상서면','55','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','부안군','하서면','55','86');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','부안군','줄포면','55','84');
Insert into SYSTEM.AREA (SI,GU,DONG,NX,NY) values ('전북특별자치도','부안군','위도면','48','84');
REM INSERTING into SYSTEM.BASKET
SET DEFINE OFF;
Insert into SYSTEM.BASKET (BASKET_NO,TOUR_NO,USER_NO,NUM_PEOPLE) values (148,1550,62,2);
Insert into SYSTEM.BASKET (BASKET_NO,TOUR_NO,USER_NO,NUM_PEOPLE) values (149,1549,62,2);
Insert into SYSTEM.BASKET (BASKET_NO,TOUR_NO,USER_NO,NUM_PEOPLE) values (159,1635,84,2);
Insert into SYSTEM.BASKET (BASKET_NO,TOUR_NO,USER_NO,NUM_PEOPLE) values (161,1578,63,2);
Insert into SYSTEM.BASKET (BASKET_NO,TOUR_NO,USER_NO,NUM_PEOPLE) values (158,1578,84,3);
Insert into SYSTEM.BASKET (BASKET_NO,TOUR_NO,USER_NO,NUM_PEOPLE) values (157,1634,66,2);
REM INSERTING into SYSTEM.BOOKINGS
SET DEFINE OFF;
REM INSERTING into SYSTEM.FAQ
SET DEFINE OFF;
Insert into SYSTEM.FAQ (FAQ_NO,CATEGORY,QUESTION,ANSWER) values (1,'국내패키지','외국인 6명 미만도 패키지 투어 예약이 가능한가요?','네, 1인부터 소그룹까지 맞춤형 패키지 투어 예약이 가능합니다.');
Insert into SYSTEM.FAQ (FAQ_NO,CATEGORY,QUESTION,ANSWER) values (2,'국내패키지','패키지 투어에는 영어 가이드가 포함되나요?','대부분의 투어에는 영어 가이드가 기본 제공되며, 필요 시 중국어, 일본어 가이드도 가능합니다.');
Insert into SYSTEM.FAQ (FAQ_NO,CATEGORY,QUESTION,ANSWER) values (3,'국내패키지','외국인 전용 투어 코스는 어떤 것이 있나요?','서울 시티 투어, 한류 체험, 전통문화 체험 등 외국인을 위한 전용 상품이 준비되어 있습니다.');
Insert into SYSTEM.FAQ (FAQ_NO,CATEGORY,QUESTION,ANSWER) values (4,'국내패키지','패키지에 포함된 숙소는 외국인에게 적합한가요?','외국인 친화적인 호텔 및 게스트하우스를 위주로 구성되어 있어 언어 소통 및 편의성이 우수합니다.');
Insert into SYSTEM.FAQ (FAQ_NO,CATEGORY,QUESTION,ANSWER) values (5,'국내패키지','여행 일정 중 자유시간이 있나요?','일부 일정에는 자유시간이 포함되어 있으며, 고객 요청 시 유연하게 조정 가능합니다.');
Insert into SYSTEM.FAQ (FAQ_NO,CATEGORY,QUESTION,ANSWER) values (6,'예약/결제','결제는 어떤 방법으로 가능한가요?','신용카드(VISA/MASTER), PayPal, 해외 송금 등 다양한 결제수단을 지원합니다.');
Insert into SYSTEM.FAQ (FAQ_NO,CATEGORY,QUESTION,ANSWER) values (7,'예약/결제','예약 확정은 언제 되나요?','결제 완료 후 24시간 이내에 이메일 또는 문자로 확정 안내를 드립니다.');
Insert into SYSTEM.FAQ (FAQ_NO,CATEGORY,QUESTION,ANSWER) values (8,'예약/결제','예약을 취소하면 환불이 되나요?','투어 시작일 기준으로 환불 정책에 따라 환불 가능하며, 상세 기준은 상품 상세페이지를 참고해 주세요.');
Insert into SYSTEM.FAQ (FAQ_NO,CATEGORY,QUESTION,ANSWER) values (9,'예약/결제','여행자 보험은 포함되어 있나요?','일부 상품은 보험이 포함되어 있으며, 미포함 상품의 경우 별도 가입을 권장드립니다.');
Insert into SYSTEM.FAQ (FAQ_NO,CATEGORY,QUESTION,ANSWER) values (10,'예약/결제','출발 확정 기준은 무엇인가요?','일반적으로 2명 이상 예약 시 출발 확정되며, 상품별 기준은 다를 수 있습니다.');
Insert into SYSTEM.FAQ (FAQ_NO,CATEGORY,QUESTION,ANSWER) values (11,'회원안내','회원가입은 필수인가요?','비회원 예약도 가능하지만, 회원가입 시 할인 및 쿠폰 혜택을 받을 수 있습니다.');
Insert into SYSTEM.FAQ (FAQ_NO,CATEGORY,QUESTION,ANSWER) values (12,'회원안내','회원 탈퇴는 어떻게 하나요?','마이페이지 > 회원정보 > 탈퇴하기 메뉴에서 언제든지 탈퇴 가능합니다.');
Insert into SYSTEM.FAQ (FAQ_NO,CATEGORY,QUESTION,ANSWER) values (13,'회원안내','비밀번호를 잊어버렸어요.','로그인 페이지에서 "비밀번호 찾기" 기능을 통해 재설정하실 수 있습니다.');
Insert into SYSTEM.FAQ (FAQ_NO,CATEGORY,QUESTION,ANSWER) values (14,'회원안내','외국인도 회원가입이 가능한가요?','네, 이메일 기반으로 간편하게 가입할 수 있으며, 여권 이름으로 등록 가능합니다.');
Insert into SYSTEM.FAQ (FAQ_NO,CATEGORY,QUESTION,ANSWER) values (15,'회원안내','회원정보는 안전하게 보호되나요?','고객의 개인정보는 암호화되어 저장되며, 관련 법률에 따라 철저히 관리됩니다.');
REM INSERTING into SYSTEM.GUIDE_IMG
SET DEFINE OFF;
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (50,0,'../img/20253971944233.PNG','20253971944233.PNG','abc.PNG','67954','image/png','.PNG','25/04/09');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (42,0,'../img/20253924557696.png','20253924557696.png','강재석.png','7446','image/png','.png','25/04/09');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (49,0,'../img/20253971543191.png','20253971543191.png','강재석.png','7446','image/png','.png','25/04/09');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (51,0,'../img/20253972445869.png','20253972445869.png','강재석.png','7446','image/png','.png','25/04/09');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (52,0,'../img/20253972736658.png','20253972736658.png','강재석.png','7446','image/png','.png','25/04/09');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (151,2,'../img/202531595850499.jpg','202531595850499.jpg','jarong2.jpg','56736','image/jpeg','.jpg','25/04/15');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (54,0,'../img/20253973111242.png','20253973111242.png','강재석.png','7446','image/png','.png','25/04/09');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (152,4,'../img/202531595855736.jpg','202531595855736.jpg','jarong.jpg','64234','image/jpeg','.jpg','25/04/15');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (56,36,'../img/20253974256885.PNG','20253974256885.PNG','abc.PNG','67954','image/png','.PNG','25/04/09');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (58,0,'../img/202531094257185.png','202531094257185.png','default-profile.png.png','7567','image/png','.png','25/04/10');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (59,0,'../img/2025310103524481.jpg','2025310103524481.jpg','jarong2.jpg','56736','image/jpeg','.jpg','25/04/10');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (60,0,'../img/202531011952421.jpg','202531011952421.jpg','jarong2.jpg','56736','image/jpeg','.jpg','25/04/10');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (61,0,'../img/2025310111037119.jpg','2025310111037119.jpg','jarong2.jpg','56736','image/jpeg','.jpg','25/04/10');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (62,0,'../img/2025310111153401.jpg','2025310111153401.jpg','jarong.jpg','64234','image/jpeg','.jpg','25/04/10');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (63,0,'../img/2025310112520707.jpg','2025310112520707.jpg','jarong.jpg','64234','image/jpeg','.jpg','25/04/10');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (64,0,'../img/2025310113342931.jpg','2025310113342931.jpg','ximage.jpg','23732','image/jpeg','.jpg','25/04/10');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (149,5,'../img/20253159583419.jpg','20253159583419.jpg','jarong2.jpg','56736','image/jpeg','.jpg','25/04/15');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (66,0,'../img/202531003811706.png','202531003811706.png','강재석.png','7446','image/png','.png','25/04/10');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (71,0,'../img/202531074543354.PNG','202531074543354.PNG','abc.PNG','67954','image/png','.PNG','25/04/10');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (72,0,'../img/202531074552924.png','202531074552924.png','강재석.png','7446','image/png','.png','25/04/10');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (105,0,'../img/202531143540775.PNG','202531143540775.PNG','abc.PNG','67954','image/png','.PNG','25/04/11');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (154,0,'../img/2025316111421189.jpg','2025316111421189.jpg','jarong2.jpg','56736','image/jpeg','.jpg','25/04/16');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (155,0,'../img/2025316111429482.png','2025316111429482.png','jzohyvi4.png','26782','image/png','.png','25/04/16');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (157,1,'../img/202531611361413.jpg','202531611361413.jpg','jarong2.jpg','56736','image/jpeg','.jpg','25/04/16');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (68,0,'../img/202531005058836.png','202531005058836.png','강재석.png','7446','image/png','.png','25/04/10');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (148,7,'../img/202531595825143.jpg','202531595825143.jpg','jarong.jpg','64234','image/jpeg','.jpg','25/04/15');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (85,0,'../img/20253113480946.jpeg','20253113480946.jpeg','tour15.jpeg','42516','image/jpeg','.jpeg','25/04/11');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (156,16,'../img/2025316111746575.jpg','2025316111746575.jpg','jarong2.jpg','56736','image/jpeg','.jpg','25/04/16');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (142,41,'../img/202531595721814.jpg','202531595721814.jpg','jarong2.jpg','56736','image/jpeg','.jpg','25/04/15');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (145,12,'../img/20253159584482.jpg','20253159584482.jpg','jarong.jpg','64234','image/jpeg','.jpg','25/04/15');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (127,50,'../img/20253121166774.png','20253121166774.png','pngegg (11).png','50287','image/png','.png','25/04/12');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (144,11,'../img/202531595750960.jpg','202531595750960.jpg','jarong2.jpg','56736','image/jpeg','.jpg','25/04/15');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (147,8,'../img/202531595819483.jpg','202531595819483.jpg','jarong.jpg','64234','image/jpeg','.jpg','25/04/15');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (41,63,'/upload/profile/2e123b19-c4f5-4339-a1c7-3789077c061a_jarong2.jpg','2e123b19-c4f5-4339-a1c7-3789077c061a_jarong2.jpg','jarong2.jpg','56736','image/jpeg','jpg','2025-04-09 13:16:29');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (44,0,'../img/20253951918688.PNG','20253951918688.PNG','abc.PNG','67954','image/png','.PNG','25/04/09');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (45,0,'../img/20253951924394.png','20253951924394.png','강재석.png','7446','image/png','.png','25/04/09');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (46,0,'../img/20253952649745.PNG','20253952649745.PNG','abc.PNG','67954','image/png','.PNG','25/04/09');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (57,0,'../img/20253975841800.png','20253975841800.png','강재석.png','7446','image/png','.png','25/04/09');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (104,0,'../img/202531143538446.jpg','202531143538446.jpg','ximage.jpg','23732','image/jpeg','.jpg','25/04/11');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (143,3,'../img/202531595734196.jpg','202531595734196.jpg','jarong2.jpg','56736','image/jpeg','.jpg','25/04/15');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (141,35,'../img/20253159577410.jpg','20253159577410.jpg','jarong2.jpg','56736','image/jpeg','.jpg','25/04/15');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (110,0,'../img/202531143626890.jpg','202531143626890.jpg','jarong2.jpg','56736','image/jpeg','.jpg','25/04/11');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (153,0,'../img/202531551339916.jpg','202531551339916.jpg','스크래쳐2.jpg','7761','image/jpeg','.jpg','25/04/15');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (1,0,'../img/2025337571710.PNG','2025337571710.PNG','abc.PNG','67954','image/png','.PNG','25/04/03');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (48,0,'../img/2025396348679.PNG','2025396348679.PNG','33.PNG','18171','image/png','.PNG','25/04/09');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (67,37,'../img/202531003945257.png','202531003945257.png','강재석.png','7446','image/png','.png','25/04/10');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (4,0,'../img/202533870843.PNG','202533870843.PNG','abc.PNG','67954','image/png','.PNG','25/04/03');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (146,6,'../img/202531595810793.jpg','202531595810793.jpg','jarong.jpg','64234','image/jpeg','.jpg','25/04/15');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (13,10,'../img/20253391152775.png','20253391152775.png','화면 캡처 2025-03-22 152559.png','3531','image/png','.png','25/04/03');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (15,9,'../img/202533912777.png','202533912777.png','화면 캡처 2025-03-22 152559.png','3531','image/png','.png','25/04/03');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (43,0,'../img/20253944429114.jpg','20253944429114.jpg','jarong2.jpg','56736','image/jpeg','.jpg','25/04/09');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (47,0,'../img/20253953714633.gif','20253953714633.gif','no-img.gif','819','image/gif','.gif','25/04/09');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (84,0,'../img/202531134757892.jpg','202531134757892.jpg','tour8.jpg','255388','image/jpeg','.jpg','25/04/11');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (107,0,'../img/202531143551148.png','202531143551148.png','강재석.png','7446','image/png','.png','25/04/11');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (86,0,'../img/20253113481276.jpg','20253113481276.jpg','tour8.jpg','255388','image/jpeg','.jpg','25/04/11');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (108,0,'../img/20253114363526.PNG','20253114363526.PNG','abc.PNG','67954','image/png','.PNG','25/04/11');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (138,0,'../img/202531595525960.png','202531595525960.png','화면 캡처 2025-03-22 152559.png','3531','image/png','.png','25/04/15');
Insert into SYSTEM.GUIDE_IMG (P_FILE_NO,P_GUIDE_NO,P_FILE_PATH,P_FILE_NAME,P_FILE_ORG_NAME,P_FILE_SIZE,P_FILE_TYPE,P_FILE_EXTENSION,P_UPLOAD_DATE) values (139,0,'../img/202531595530142.png','202531595530142.png','강재석.png','7446','image/png','.png','25/04/15');
REM INSERTING into SYSTEM.GUIDE_SCHEDULES
SET DEFINE OFF;
REM INSERTING into SYSTEM.GUIDES
SET DEFINE OFF;
Insert into SYSTEM.GUIDES (GUIDE_NO,USER_NO,LANGUAGE,EXPERIENCE,G_CREATED_AT,G_UPDATED_AT) values (11,36,'KOREAN, ENGLISH','3YEARS',to_date('25/03/27','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'));
Insert into SYSTEM.GUIDES (GUIDE_NO,USER_NO,LANGUAGE,EXPERIENCE,G_CREATED_AT,G_UPDATED_AT) values (49,83,'Korean, Japanese','I also speak Japanese well, so feel free to talk to me in Japanese!',to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.GUIDES (GUIDE_NO,USER_NO,LANGUAGE,EXPERIENCE,G_CREATED_AT,G_UPDATED_AT) values (35,67,'Korean, English','Hello! I''m Jaeseok Kang, a professional tour guide. I will do my best to ensure you have an enjoyable and comfortable trip.',to_date('25/04/09','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'));
Insert into SYSTEM.GUIDES (GUIDE_NO,USER_NO,LANGUAGE,EXPERIENCE,G_CREATED_AT,G_UPDATED_AT) values (1,93,'Korean, English','3 years',to_date('25/03/20','RR/MM/DD'),to_date('25/04/16','RR/MM/DD'));
Insert into SYSTEM.GUIDES (GUIDE_NO,USER_NO,LANGUAGE,EXPERIENCE,G_CREATED_AT,G_UPDATED_AT) values (2,12,'Korean, Japanese','5 years',to_date('25/03/20','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'));
Insert into SYSTEM.GUIDES (GUIDE_NO,USER_NO,LANGUAGE,EXPERIENCE,G_CREATED_AT,G_UPDATED_AT) values (3,64,'Korean, Chinese','안녕하세요! 저는 서울의 야경 투어를 진행하고 있는 가이드 재형입니다 🌃  
남산타워부터 숨겨진 루프탑까지, 서울의 아름다운 밤을 2년 넘게 소개해오고 있어요.  
안전하고 즐거운, 인생샷 가득한 투어로 여러분을 안내해드릴게요!',to_date('25/03/20','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'));
Insert into SYSTEM.GUIDES (GUIDE_NO,USER_NO,LANGUAGE,EXPERIENCE,G_CREATED_AT,G_UPDATED_AT) values (4,14,'Korean, French','4 years',to_date('25/03/20','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'));
Insert into SYSTEM.GUIDES (GUIDE_NO,USER_NO,LANGUAGE,EXPERIENCE,G_CREATED_AT,G_UPDATED_AT) values (5,15,'Korean, Spanish','1 year',to_date('25/03/20','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'));
Insert into SYSTEM.GUIDES (GUIDE_NO,USER_NO,LANGUAGE,EXPERIENCE,G_CREATED_AT,G_UPDATED_AT) values (6,16,'Korean, German','3 years',to_date('25/03/20','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'));
Insert into SYSTEM.GUIDES (GUIDE_NO,USER_NO,LANGUAGE,EXPERIENCE,G_CREATED_AT,G_UPDATED_AT) values (7,17,'Korean, Russian','6 years',to_date('25/03/20','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'));
Insert into SYSTEM.GUIDES (GUIDE_NO,USER_NO,LANGUAGE,EXPERIENCE,G_CREATED_AT,G_UPDATED_AT) values (8,18,'Korean, Italian','2 years',to_date('25/03/20','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'));
Insert into SYSTEM.GUIDES (GUIDE_NO,USER_NO,LANGUAGE,EXPERIENCE,G_CREATED_AT,G_UPDATED_AT) values (9,19,'Korean, Chinese','4 years',to_date('25/03/20','RR/MM/DD'),to_date('25/04/03','RR/MM/DD'));
Insert into SYSTEM.GUIDES (GUIDE_NO,USER_NO,LANGUAGE,EXPERIENCE,G_CREATED_AT,G_UPDATED_AT) values (10,20,'Korean, English, French','5 years',to_date('25/03/20','RR/MM/DD'),to_date('25/04/03','RR/MM/DD'));
Insert into SYSTEM.GUIDES (GUIDE_NO,USER_NO,LANGUAGE,EXPERIENCE,G_CREATED_AT,G_UPDATED_AT) values (14,60,'Korean','10 years',to_date('25/04/04','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'));
Insert into SYSTEM.GUIDES (GUIDE_NO,USER_NO,LANGUAGE,EXPERIENCE,G_CREATED_AT,G_UPDATED_AT) values (16,63,'English, Chinese','안녕하세요! 저는 서울의 야경 투어를 진행하고 있는 가이드 건형입니다 🌃  
남산타워부터 숨겨진 루프탑까지, 서울의 아름다운 밤을 2년 넘게 소개해오고 있어요.  
안전하고 즐거운, 인생샷 가득한 투어로 여러분을 안내해드릴게요!',to_date('25/04/07','RR/MM/DD'),to_date('25/04/09','RR/MM/DD'));
Insert into SYSTEM.GUIDES (GUIDE_NO,USER_NO,LANGUAGE,EXPERIENCE,G_CREATED_AT,G_UPDATED_AT) values (50,84,'Korean English Japanese','한국에서 즐거운 기억만 남도록 재미있는 투어 해드리겠습니다
',to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.GUIDES (GUIDE_NO,USER_NO,LANGUAGE,EXPERIENCE,G_CREATED_AT,G_UPDATED_AT) values (12,35,'Korean, Chinese, English','400 years',to_date('25/03/20','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'));
Insert into SYSTEM.GUIDES (GUIDE_NO,USER_NO,LANGUAGE,EXPERIENCE,G_CREATED_AT,G_UPDATED_AT) values (41,62,'Korean','안녕하세요! 저는 전문 가이드 강재석입니다. 손님여러분께 즐겁고 편안한 여행이되도록 최선을 다하겠습니다.',to_date('25/04/10','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'));
REM INSERTING into SYSTEM.IMG
SET DEFINE OFF;
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (266,241,'/uploads/36fe56a8-7418-4834-a3fc-3011bcffcc6d.jpg','36fe56a8-7418-4834-a3fc-3011bcffcc6d.jpg','tour16.jpg',null,null,null,'25/04/04','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (263,241,'/uploads/ad4f5976-5688-405f-9659-921ad7319572.jpg','ad4f5976-5688-405f-9659-921ad7319572.jpg','tour4.jpg',null,null,null,'25/04/04','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (267,241,'/uploads/0a2d83d6-68cb-4756-80b2-3d51a1881baa.jpg','0a2d83d6-68cb-4756-80b2-3d51a1881baa.jpg','tour12.jpg',null,null,null,'25/04/04','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (269,241,'/uploads/06f19535-16e4-4bd5-853f-af8682b1bac1.jpg','06f19535-16e4-4bd5-853f-af8682b1bac1.jpg','tour6.jpg',null,null,null,'25/04/04','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (273,242,'/uploads/5a8262c0-9d06-4562-9ff8-da01f8ece29b.jpg','5a8262c0-9d06-4562-9ff8-da01f8ece29b.jpg','tour6.jpg',null,null,null,'25/04/04','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (274,242,'/uploads/37adebf9-c847-4863-9ebc-f82fcc067127.jpg','37adebf9-c847-4863-9ebc-f82fcc067127.jpg','tour12.jpg',null,null,null,'25/04/04','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (275,242,'/uploads/dec961cd-8304-4281-bbff-e47fbaacd76f.jpg','dec961cd-8304-4281-bbff-e47fbaacd76f.jpg','tour13.jpg',null,null,null,'25/04/04','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (276,242,'/uploads/cb9147d9-be65-48f7-8365-f541cc8193d4.jpg','cb9147d9-be65-48f7-8365-f541cc8193d4.jpg','tour4.jpg',null,null,null,'25/04/04','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (281,262,'/uploads/0ce26f9c-81ea-4242-aade-75b2accf1124.jpg','0ce26f9c-81ea-4242-aade-75b2accf1124.jpg','tour4.jpg',null,null,null,'25/04/07','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (324,303,'/uploads/a91ca0a8-f4d1-4022-a801-747729683023.jpg','a91ca0a8-f4d1-4022-a801-747729683023.jpg','jarong.jpg',null,null,null,'25/04/10','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (307,289,'/uploads/d4ee2eb3-a3fd-463a-8586-80dd79ffa7b4.jpg','d4ee2eb3-a3fd-463a-8586-80dd79ffa7b4.jpg','tour6.jpg',null,null,null,'25/04/09','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (325,303,'/uploads/bae7d2c1-3ccb-48ff-a0c7-351ef76ad6ea.jpg','bae7d2c1-3ccb-48ff-a0c7-351ef76ad6ea.jpg','jarong2.jpg',null,null,null,'25/04/10','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (326,304,'/uploads/7f2b03f1-6acb-4e2b-b827-adf1781d252b.png','7f2b03f1-6acb-4e2b-b827-adf1781d252b.png','image4.png',null,null,null,'25/04/10','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (329,305,'/uploads/42135622-80cf-40ef-ba58-ee8552c38088.png','42135622-80cf-40ef-ba58-ee8552c38088.png','phone1.png',null,null,null,'25/04/10','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (336,null,'/uploads/9c391cdc-fbd3-4101-9b5f-7a3233d9255c.jpg','9c391cdc-fbd3-4101-9b5f-7a3233d9255c.jpg','에버랜드.jpg',null,null,null,'25/04/10','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (337,318,'/uploads/36c920d1-a4d4-47b6-9463-75675d32841b.jpg','36c920d1-a4d4-47b6-9463-75675d32841b.jpg','에버랜드.jpg',null,null,null,'25/04/10','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (338,319,'/uploads/e5c38d5a-63e5-4db9-9103-2d98f3fea22a.jpg','e5c38d5a-63e5-4db9-9103-2d98f3fea22a.jpg','0001_(2).jpg',null,null,null,'25/04/10','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (339,319,'/uploads/6c925378-3856-4a92-b3fd-d514806530bc.jpg','6c925378-3856-4a92-b3fd-d514806530bc.jpg','0001_(2).jpg',null,null,null,'25/04/10','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (340,319,'/uploads/28335621-03f7-475f-99c6-8c955f85a059.jpg','28335621-03f7-475f-99c6-8c955f85a059.jpg','에버랜드.jpg',null,null,null,'25/04/10','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (383,1444,'/uploads/e24167c8-af6b-46d1-8b9b-9c6282d6631a.jpg','e24167c8-af6b-46d1-8b9b-9c6282d6631a.jpg','jeju4.jpg',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (384,1444,'/uploads/69b08681-25e3-45a9-bb65-672e8e22288a.jpg','69b08681-25e3-45a9-bb65-672e8e22288a.jpg','jeju1.jpg',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (386,1445,'/uploads/fc3a5beb-f7ad-4e50-b05d-9b67c99ad90a.jpg','fc3a5beb-f7ad-4e50-b05d-9b67c99ad90a.jpg','ulsan.jpg',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (387,1445,'/uploads/30d4966b-52da-4903-ab5c-d1f1700e0512.jpeg','30d4966b-52da-4903-ab5c-d1f1700e0512.jpeg','ulsan2.jpeg',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (390,1445,'/uploads/a24f5333-8ba3-416f-a191-12218b24a975.jpg','a24f5333-8ba3-416f-a191-12218b24a975.jpg','ulsan4.jpg',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (394,null,'/uploads/fdf41d83-5d13-48d5-a3fc-1aa2d860130c.jpg','fdf41d83-5d13-48d5-a3fc-1aa2d860130c.jpg','ximage.jpg',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (402,1549,'/uploads/7986c76f-6446-4354-9ca1-5eab278a8771.webp','7986c76f-6446-4354-9ca1-5eab278a8771.webp','한복남한복체험헤어스타일링(경복궁지점).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (406,1550,'/uploads/bfc608ab-56c0-44c3-9ef0-d604ba345165.webp','bfc608ab-56c0-44c3-9ef0-d604ba345165.webp','서울시티투어버스(도심고궁남산코스) (1).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (415,1549,'/uploads/204bd69e-0c27-41ab-8c30-554ff917536c.webp','204bd69e-0c27-41ab-8c30-554ff917536c.webp','한복남한복체험헤어스타일링(경복궁지점) (1).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (420,1550,'/uploads/24fd9840-7886-49a2-af6b-be439b95efc7.webp','24fd9840-7886-49a2-af6b-be439b95efc7.webp','서울시티투어버스(도심고궁남산코스) (2).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (421,1555,'/uploads/52505c03-20a3-4a39-b674-f47019098ef1.png','52505c03-20a3-4a39-b674-f47019098ef1.png','부산 원데이 투어.png',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (422,1553,'/uploads/fbd4838f-e0c0-421a-9c20-5821aa23b02e.webp','fbd4838f-e0c0-421a-9c20-5821aa23b02e.webp','창덕궁한복대여byDorothyHanbok.webp',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (423,1553,'/uploads/f24090d6-460b-4bfb-90b6-8bef061b2c9c.webp','f24090d6-460b-4bfb-90b6-8bef061b2c9c.webp','창덕궁한복대여byDorothyHanbok (1).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (424,1554,'/uploads/642625a2-74bc-4b88-b8b9-1f10ecfad502.webp','642625a2-74bc-4b88-b8b9-1f10ecfad502.webp','한복대여사진촬영체험(그날그한복) (1).webp',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (425,1554,'/uploads/877061d0-7d76-428c-b1ad-10b38ccb289f.webp','877061d0-7d76-428c-b1ad-10b38ccb289f.webp','한복대여사진촬영체험(그날그한복).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (427,1556,'/uploads/7a8aff44-362f-45c4-a20c-d4fa0049df90.webp','7a8aff44-362f-45c4-a20c-d4fa0049df90.webp','롯데월드이화교복교복대여.webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (428,1558,'/uploads/5370f385-11de-4b6d-b982-bf6f5769a9dc.png','5370f385-11de-4b6d-b982-bf6f5769a9dc.png','부산 원데이 투어.png',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (429,1557,'/uploads/22e2b4af-5b15-4737-9737-6fc02bf128ad.webp','22e2b4af-5b15-4737-9737-6fc02bf128ad.webp','NOTE성수프라이빗셀프조향클래스 (3).webp',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (430,1557,'/uploads/b3cef82b-0fc8-4965-851c-df669e11c17d.webp','b3cef82b-0fc8-4965-851c-df669e11c17d.webp','NOTE성수프라이빗셀프조향클래스 (1).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (431,1557,'/uploads/df230481-2855-4388-9571-df36abf48187.webp','df230481-2855-4388-9571-df36abf48187.webp','NOTE성수프라이빗셀프조향클래스 (2).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (432,1557,'/uploads/a467c954-04f9-46c8-aa99-3967661ec1e1.webp','a467c954-04f9-46c8-aa99-3967661ec1e1.webp','NOTE성수프라이빗셀프조향클래스.webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (433,1558,'/uploads/1d55f7c6-0019-46ff-94e4-fea16ea7bcc7.png','1d55f7c6-0019-46ff-94e4-fea16ea7bcc7.png','부산 원데이 투어2.png',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (434,1558,'/uploads/5a490103-f1b8-48d3-b558-9e2b708a8043.png','5a490103-f1b8-48d3-b558-9e2b708a8043.png','부산 원데이 투어3.png',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (436,1559,'/uploads/568a6a33-a3cd-441a-9272-010124bc9db0.webp','568a6a33-a3cd-441a-9272-010124bc9db0.webp','서울삼성코엑스아쿠아리움입장권.webp',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (437,1559,'/uploads/011d87a0-2822-4cd3-92f5-ca8c093bf241.webp','011d87a0-2822-4cd3-92f5-ca8c093bf241.webp','서울삼성코엑스아쿠아리움입장권 (1).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (438,1559,'/uploads/022c6f3a-d12b-48ea-8554-34addaad41ad.webp','022c6f3a-d12b-48ea-8554-34addaad41ad.webp','서울삼성코엑스아쿠아리움입장권 (2).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (439,1560,'/uploads/e4fe8126-bd92-4548-831b-429867fb7315.png','e4fe8126-bd92-4548-831b-429867fb7315.png','부산 원데이 투어.png',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (440,1560,'/uploads/a0714928-b087-4d69-aade-f357555fc6ef.png','a0714928-b087-4d69-aade-f357555fc6ef.png','부산 원데이 투어2.png',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (442,1560,'/uploads/69272f71-36ea-4476-8db8-497d1c400685.png','69272f71-36ea-4476-8db8-497d1c400685.png','부산 원데이 투어2.png',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (444,1559,'/uploads/e8e46705-0484-4cb2-997b-0388860b6a40.webp','e8e46705-0484-4cb2-997b-0388860b6a40.webp','서울삼성코엑스아쿠아리움입장권 (3).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (272,242,'/uploads/6f6e151e-3285-4e05-b3bf-7fa167adf49f.jpg','6f6e151e-3285-4e05-b3bf-7fa167adf49f.jpg','tour4.jpg',null,null,null,'25/04/04','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (278,242,'/uploads/87a536a0-0fa8-420b-91ef-d1366f360c91.jpg','87a536a0-0fa8-420b-91ef-d1366f360c91.jpg','tour12.jpg',null,null,null,'25/04/04','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (270,241,'/uploads/2128c220-e15a-4e4d-b1a8-d99edce4dc8f.jpg','2128c220-e15a-4e4d-b1a8-d99edce4dc8f.jpg','tour12.jpg',null,null,null,'25/04/04','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (330,306,'/uploads/1ed0977d-5198-41ea-b399-8e8a0d10a31a.jpg','1ed0977d-5198-41ea-b399-8e8a0d10a31a.jpg','tour6.jpg',null,null,null,'25/04/10','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (304,284,'/uploads/3b0b5ded-f2d4-4f44-ad2e-beecdbfc84ae.jpg','3b0b5ded-f2d4-4f44-ad2e-beecdbfc84ae.jpg','jarong.jpg',null,null,null,'25/04/08','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (91,0,'/uploads/d166d7b6-6e85-4ce3-837f-0bdb4392a0a1.png','d166d7b6-6e85-4ce3-837f-0bdb4392a0a1.png','강재석.png',null,null,null,'25/04/01','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (308,289,'/uploads/78ca53ff-12cb-4935-8269-3e91658dbced.jpg','78ca53ff-12cb-4935-8269-3e91658dbced.jpg','tour13.jpg',null,null,null,'25/04/09','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (344,320,'/uploads/67b0050a-aebf-492f-adf2-8ac1859d9270.jpg','67b0050a-aebf-492f-adf2-8ac1859d9270.jpg','gangnam2.jpg',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (323,303,'/uploads/e37f0dc8-d500-4219-9a55-d3dfbce43c96.PNG','e37f0dc8-d500-4219-9a55-d3dfbce43c96.PNG','1.PNG',null,null,null,'25/04/10','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (345,320,'/uploads/55ddf0e0-be8c-4765-b304-0972165fdb6f.jpg','55ddf0e0-be8c-4765-b304-0972165fdb6f.jpg','gangnam1.jpg',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (346,320,'/uploads/d53bbd42-2bc0-49c1-8347-35f7e72c1c76.jpg','d53bbd42-2bc0-49c1-8347-35f7e72c1c76.jpg','gangnam3.jpg',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (347,320,'/uploads/e1603755-a0e4-4234-8505-a4b163c17494.jpg','e1603755-a0e4-4234-8505-a4b163c17494.jpg','gangnam4.jpg',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (381,1444,'/uploads/76330500-7399-4666-9ed4-b3feda631f40.jpg','76330500-7399-4666-9ed4-b3feda631f40.jpg','jeju3.jpg',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (382,1444,'/uploads/5c9a5396-cf34-4595-93e1-94f695e8a07c.jpeg','5c9a5396-cf34-4595-93e1-94f695e8a07c.jpeg','jeju2.jpeg',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (389,1445,'/uploads/1d5f6890-10bb-460c-8961-1e190b5eada1.jpg','1d5f6890-10bb-460c-8961-1e190b5eada1.jpg','ulsan3.jpg',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (435,1558,'/uploads/cdb9c02f-1c83-47a9-9aa5-78c2dcd3f440.png','cdb9c02f-1c83-47a9-9aa5-78c2dcd3f440.png','부산 원데이 투어4.png',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (443,1560,'/uploads/2fb99247-3402-4eb8-9ab2-6138b0f2125c.png','2fb99247-3402-4eb8-9ab2-6138b0f2125c.png','부산 원데이 투어4.png',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (445,1559,'/uploads/9274226c-8561-4d29-878d-646ea0839da7.webp','9274226c-8561-4d29-878d-646ea0839da7.webp','서울삼성코엑스아쿠아리움입장권 (4).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (450,1564,'/uploads/0be024d0-19fc-4e50-93ca-60fd7aeee238.webp','0be024d0-19fc-4e50-93ca-60fd7aeee238.webp','제주981파크티켓 (1).webp',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (452,1564,'/uploads/eec5073a-5a21-4bc0-b902-832b3fe9f038.webp','eec5073a-5a21-4bc0-b902-832b3fe9f038.webp','제주981파크티켓.webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (456,1564,'/uploads/82c3ed5f-10a4-4995-a5de-284fdc930334.webp','82c3ed5f-10a4-4995-a5de-284fdc930334.webp','제주981파크티켓 (5).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (465,1568,'/uploads/438fb864-a912-4394-9fa2-758847fda832.webp','438fb864-a912-4394-9fa2-758847fda832.webp','부산나이트투어-송도케이블카더베이101광안리해변영도수변공원 (1).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (471,1570,'/uploads/63fcf0d1-9eef-41ce-93ce-9351b3f47bf6.webp','63fcf0d1-9eef-41ce-93ce-9351b3f47bf6.webp','서울헤어살롱롤링제이_헤어스타일링메이크업 (5).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (473,1569,'/uploads/205f1cac-7b41-4f68-8ac0-e6214fb06ca4.png','205f1cac-7b41-4f68-8ac0-e6214fb06ca4.png','부산 원데이 투어4.png',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (475,1568,'/uploads/40f02978-080a-4ced-ac12-4b0c980cab29.webp','40f02978-080a-4ced-ac12-4b0c980cab29.webp','부산나이트투어-송도케이블카더베이101광안리해변영도수변공원 (1).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (478,1572,'/uploads/5b5df3a5-d07a-46b7-9a42-5633401827f3.webp','5b5df3a5-d07a-46b7-9a42-5633401827f3.webp','아쿠아플라넷제주입장권 (2).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (484,1574,'/uploads/5548cce3-3e15-4b58-825a-9e2d80bb0421.webp','5548cce3-3e15-4b58-825a-9e2d80bb0421.webp','아르떼뮤지엄제주입장권 (3).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (486,1574,'/uploads/50fb33b8-f4d6-4e68-b1b0-2118d69a1bbb.webp','50fb33b8-f4d6-4e68-b1b0-2118d69a1bbb.webp','아르떼뮤지엄제주입장권 (5).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (489,1574,'/uploads/32d91876-ee36-43eb-b82b-22158d5a6e9d.webp','32d91876-ee36-43eb-b82b-22158d5a6e9d.webp','아르떼뮤지엄제주입장권 (8).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (491,1574,'/uploads/6c985ba6-17c3-4452-8fe2-286899d505c2.webp','6c985ba6-17c3-4452-8fe2-286899d505c2.webp','아르떼뮤지엄제주입장권 (10).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (494,1575,'/uploads/66389c66-bbe6-488c-b766-df1982efffb4.webp','66389c66-bbe6-488c-b766-df1982efffb4.webp','케이팝아이돌헤어메이크업퍼스널컬러진단 (1).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (505,1580,'/uploads/7d79a142-b071-4cf0-a72c-32482439c617.webp','7d79a142-b071-4cf0-a72c-32482439c617.webp','서울출발수원화성투어 (1).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (498,1578,'/uploads/ef9987d9-f048-4301-b8de-a1f87cb4ffef.webp','ef9987d9-f048-4301-b8de-a1f87cb4ffef.webp','제주한국문화체험_한복교복렌탈,K-뷰티촬영.webp',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (502,1579,'/uploads/6fa37ece-8697-4e91-918e-82c095b100d4.jfif','6fa37ece-8697-4e91-918e-82c095b100d4.jfif','02_ Seoul Tower.jfif',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (507,1569,'/uploads/a3ddbe64-e16c-4479-9585-9321fc031504.png','a3ddbe64-e16c-4479-9585-9321fc031504.png','부산 원데이 투어2.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (508,1569,'/uploads/29708d8d-2f72-4e68-a469-bdbd0ed3efb5.png','29708d8d-2f72-4e68-a469-bdbd0ed3efb5.png','부산 원데이 투어3.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (511,1568,'/uploads/80efb7f1-d049-4b93-8374-70d7ee3182d1.webp','80efb7f1-d049-4b93-8374-70d7ee3182d1.webp','부산나이트투어-송도케이블카더베이101광안리해변영도수변공원 (1).webp',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (513,1581,'/uploads/763ae972-cd11-4a74-b24b-8ed99563e60d.webp','763ae972-cd11-4a74-b24b-8ed99563e60d.webp','감천문화마을사진첩만들기원데이클래스.webp',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (516,1582,'/uploads/b1df6396-4dc6-4a52-a5e4-02be3241c91d.webp','b1df6396-4dc6-4a52-a5e4-02be3241c91d.webp','부산진짜배기투어(1일) (1).webp',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (517,1582,'/uploads/58e2339b-a6d9-424c-88c2-395ca48f8db8.webp','58e2339b-a6d9-424c-88c2-395ca48f8db8.webp','부산진짜배기투어(1일) (2).webp',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (518,1582,'/uploads/4f231f23-082c-4c00-a2ca-dde6becd19a3.webp','4f231f23-082c-4c00-a2ca-dde6becd19a3.webp','부산진짜배기투어(1일) (3).webp',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (519,1582,'/uploads/4f4711c7-eaa2-47ca-a357-c10ad0fefb7d.webp','4f4711c7-eaa2-47ca-a357-c10ad0fefb7d.webp','부산진짜배기투어(1일) (4).webp',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (525,1583,'/uploads/d493b6b0-c148-4b9b-a479-d0218e5fd685.webp','d493b6b0-c148-4b9b-a479-d0218e5fd685.webp','포항스페이스워크벚꽃,구룡포,호미곶유채꽃3.webp',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (526,1583,'/uploads/a4374113-d103-4793-8181-6345e20292a0.png','a4374113-d103-4793-8181-6345e20292a0.png','포항스페이스워크벚꽃,구룡포,호미곶유채꽃4.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (527,1583,'/uploads/e7ca8bed-8b1a-4ec7-9866-ea04bd5d1310.png','e7ca8bed-8b1a-4ec7-9866-ea04bd5d1310.png','포항스페이스워크벚꽃,구룡포,호미곶유채꽃5.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (529,1584,'/uploads/0502b76a-7c49-49a6-8b9a-09d78e378405.png','0502b76a-7c49-49a6-8b9a-09d78e378405.png','otjhwhzvnnluj3hw8chd2.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (262,241,'/uploads/50fe261e-31b7-4eb2-9e4c-d783c8f9701e.jpg','50fe261e-31b7-4eb2-9e4c-d783c8f9701e.jpg','tour6.jpg',null,null,null,'25/04/04','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (277,242,'/uploads/2b04dd56-1293-4bd2-9a28-1903a6310152.jpg','2b04dd56-1293-4bd2-9a28-1903a6310152.jpg','tour6.jpg',null,null,null,'25/04/04','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (279,242,'/uploads/b8ff8f93-ddd6-4a98-875d-ee5b6519bf91.jpg','b8ff8f93-ddd6-4a98-875d-ee5b6519bf91.jpg','tour13.jpg',null,null,null,'25/04/04','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (282,262,'/uploads/9f65493a-d3de-40ae-bfc9-751e5515b207.jpg','9f65493a-d3de-40ae-bfc9-751e5515b207.jpg','tour6.jpg',null,null,null,'25/04/07','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (309,291,'/uploads/d3c2ab20-3869-4a6d-939d-bc192e954404.jpg','d3c2ab20-3869-4a6d-939d-bc192e954404.jpg','tour13.jpg',null,null,null,'25/04/09','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (261,240,'/uploads/1e7ce078-ba04-4afc-ac7b-6ce62c6c6cc6.jpg','1e7ce078-ba04-4afc-ac7b-6ce62c6c6cc6.jpg','tour12.jpg',null,null,null,'25/04/04','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (327,304,'/uploads/da2965cd-0b74-439a-8274-b8c5be0dc6ed.png','da2965cd-0b74-439a-8274-b8c5be0dc6ed.png','phone2 color.png',null,null,null,'25/04/10','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (335,null,'/uploads/4e576335-8ef8-41f2-bbe4-97eff5f602de.jpg','4e576335-8ef8-41f2-bbe4-97eff5f602de.jpg','에버랜드.jpg',null,null,null,'25/04/10','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (362,835,'/uploads/21eb8897-3ce0-45bc-8d4c-8a5c1789df11.jpg','21eb8897-3ce0-45bc-8d4c-8a5c1789df11.jpg','dance.jpg',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (364,835,'/uploads/53c3e956-3119-42bd-8982-a14020166090.jpg','53c3e956-3119-42bd-8982-a14020166090.jpg','j.jpg',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (365,835,'/uploads/74cb6823-29bd-4255-8c9d-150efe5500df.jpg','74cb6823-29bd-4255-8c9d-150efe5500df.jpg','외국인-한국여행-관광객-음식-서울-PC방1.jpg',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (385,1444,'/uploads/fa77a9d2-7b67-4008-a980-80854061d41b.jpg','fa77a9d2-7b67-4008-a980-80854061d41b.jpg','jeju5.jpg',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (388,null,'/uploads/bddb8a55-f6dc-4209-bbcb-67361bdcc084.png','bddb8a55-f6dc-4209-bbcb-67361bdcc084.png','강재석.png',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (391,1546,'/uploads/3f894f17-e425-480f-b68f-e6f5b26d1250.png','3f894f17-e425-480f-b68f-e6f5b26d1250.png','포함.png',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (459,1565,'/uploads/77d34c75-2cbf-4aee-97ce-ab067bf64850.webp','77d34c75-2cbf-4aee-97ce-ab067bf64850.webp','부산나이트투어-송도케이블카더베이101광안리해변영도수변공원 (2).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (474,1568,'/uploads/d331600c-f10b-4afc-aff2-6106e0ab6847.webp','d331600c-f10b-4afc-aff2-6106e0ab6847.webp','부산나이트투어-송도케이블카더베이101광안리해변영도수변공원.webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (477,1572,'/uploads/f2bc0e3e-cac8-4136-a964-062317e9ca8e.webp','f2bc0e3e-cac8-4136-a964-062317e9ca8e.webp','아쿠아플라넷제주입장권 (2).webp',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (479,1572,'/uploads/fe0a3aed-57a6-41b9-b731-f24c370ebf58.webp','fe0a3aed-57a6-41b9-b731-f24c370ebf58.webp','아쿠아플라넷제주입장권 (3).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (483,1574,'/uploads/a2e9ac4a-ef56-4f8d-8fda-4dc23d256cc6.webp','a2e9ac4a-ef56-4f8d-8fda-4dc23d256cc6.webp','아르떼뮤지엄제주입장권 (2).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (488,1574,'/uploads/d56f045a-9f9c-407f-a825-5ad30aba2976.webp','d56f045a-9f9c-407f-a825-5ad30aba2976.webp','아르떼뮤지엄제주입장권 (7).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (466,1569,'/uploads/2c4a462c-70ee-4d40-9eb6-af000dadc2af.png','2c4a462c-70ee-4d40-9eb6-af000dadc2af.png','부산 원데이 투어.png',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (468,1570,'/uploads/50f30dc2-7ed6-45aa-a363-fb1408277676.webp','50f30dc2-7ed6-45aa-a363-fb1408277676.webp','서울헤어살롱롤링제이_헤어스타일링메이크업.webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (469,1570,'/uploads/ab3a3837-2d04-4752-8d3c-d2f3006ddf8c.webp','ab3a3837-2d04-4752-8d3c-d2f3006ddf8c.webp','서울헤어살롱롤링제이_헤어스타일링메이크업 (2).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (496,1576,'/uploads/344c99a4-2d12-4fca-b1ed-f188238ab3d6.webp','344c99a4-2d12-4fca-b1ed-f188238ab3d6.webp','[초특가]한강세빛섬요트투어(반려견동반가능).webp',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (500,1578,'/uploads/7f694787-8765-42b3-8e41-97951aa9d779.webp','7f694787-8765-42b3-8e41-97951aa9d779.webp','제주한국문화체험_한복교복렌탈,K-뷰티촬영 (2).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (503,1579,'/uploads/b5ced136-f9d7-46a2-9ea1-97c5a4b74790.jfif','b5ced136-f9d7-46a2-9ea1-97c5a4b74790.jfif','N Seoul Tower.jfif',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (506,1569,'/uploads/67c11b9e-94d9-4e78-a822-49a3a3446265.png','67c11b9e-94d9-4e78-a822-49a3a3446265.png','부산 원데이 투어.png',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (512,1568,'/uploads/464f1282-208f-4738-b008-5e47d3e869ea.webp','464f1282-208f-4738-b008-5e47d3e869ea.webp','부산나이트투어-송도케이블카더베이101광안리해변영도수변공원 (2).webp',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (515,1582,'/uploads/208c1b98-4adc-4377-adf7-834eeec9a0fb.webp','208c1b98-4adc-4377-adf7-834eeec9a0fb.webp','부산진짜배기투어(1일).webp',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (520,1582,'/uploads/d13cc837-0de2-407e-b172-913b5123d8f0.webp','d13cc837-0de2-407e-b172-913b5123d8f0.webp','부산진짜배기투어(1일) (5).webp',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (521,1582,'/uploads/f9906446-6216-415a-9a91-2bf82632e4b1.webp','f9906446-6216-415a-9a91-2bf82632e4b1.webp','부산진짜배기투어(1일) (6).webp',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (522,1582,'/uploads/f9fec8c5-5b8b-44fa-b9a4-e752bff139f9.webp','f9fec8c5-5b8b-44fa-b9a4-e752bff139f9.webp','부산진짜배기투어(1일) (7).webp',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (524,1583,'/uploads/ba699099-6cae-482c-bdd5-8fef84017458.png','ba699099-6cae-482c-bdd5-8fef84017458.png','포항스페이스워크벚꽃,구룡포,호미곶유채꽃2.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (528,1584,'/uploads/2ea35a1b-77ac-4b4e-b38a-e16ceca5d9d1.png','2ea35a1b-77ac-4b4e-b38a-e16ceca5d9d1.png','otjhwhzvnnluj3hw8chd.png',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (530,1584,'/uploads/4bc3fbb5-25e1-41d9-b7ae-0e3083c638a3.png','4bc3fbb5-25e1-41d9-b7ae-0e3083c638a3.png','부산벚꽃랜덤투어.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (531,1584,'/uploads/4f655fd2-591a-4eac-a204-b7bc4ef674cd.png','4f655fd2-591a-4eac-a204-b7bc4ef674cd.png','부산벚꽃랜덤투어2.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (532,1584,'/uploads/2e557a1c-c664-41ee-b2c8-a342ce76c614.png','2e557a1c-c664-41ee-b2c8-a342ce76c614.png','부산벚꽃랜덤투어3.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (533,1584,'/uploads/777c6afd-870c-4584-8735-57c874df7ad6.png','777c6afd-870c-4584-8735-57c874df7ad6.png','부산벚꽃랜덤투어4.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (534,1585,'/uploads/ed025cf8-fe18-4d3f-bb95-757a7d55d32f.png','ed025cf8-fe18-4d3f-bb95-757a7d55d32f.png','부산벚꽃랜덤투어4.png',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (535,1585,'/uploads/9d586474-e113-4603-b403-d2d070395c89.png','9d586474-e113-4603-b403-d2d070395c89.png','부산벚꽃랜덤투어.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (536,1585,'/uploads/5e5bdd14-2554-4705-8db6-f40e83ee6e91.png','5e5bdd14-2554-4705-8db6-f40e83ee6e91.png','부산벚꽃랜덤투어2.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (537,1585,'/uploads/6a2f9155-fb3d-4e8c-8b04-56b74a1d662f.png','6a2f9155-fb3d-4e8c-8b04-56b74a1d662f.png','부산벚꽃랜덤투어3.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (538,1586,'/uploads/810a8b96-d398-4359-87c2-2bab876229ec.png','810a8b96-d398-4359-87c2-2bab876229ec.png','otjhwhzvnnluj3hw8chd2.png',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (539,1586,'/uploads/f1eda051-a036-4d7a-b4fd-b4562e61e4d6.png','f1eda051-a036-4d7a-b4fd-b4562e61e4d6.png','부산벚꽃랜덤투어.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (540,1586,'/uploads/9e0e953d-bb9d-4b5d-b007-864696f8263d.png','9e0e953d-bb9d-4b5d-b007-864696f8263d.png','부산벚꽃랜덤투어2.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (541,1586,'/uploads/b94370d2-57fe-46a0-82ae-4116db9bdedb.png','b94370d2-57fe-46a0-82ae-4116db9bdedb.png','부산벚꽃랜덤투어3.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (542,1587,'/uploads/b12e8dac-693d-49a6-9af6-2a6e568abb61.png','b12e8dac-693d-49a6-9af6-2a6e568abb61.png','otjhwhzvnnluj3hw8chd.png',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (264,241,'/uploads/3364e365-9004-4565-ad53-235cd24d0a61.jpg','3364e365-9004-4565-ad53-235cd24d0a61.jpg','tour12.jpg',null,null,null,'25/04/04','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (268,241,'/uploads/a3798258-1b39-4f2f-adad-bed70db1a38b.jpg','a3798258-1b39-4f2f-adad-bed70db1a38b.jpg','tour4.jpg',null,null,null,'25/04/04','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (271,241,'/uploads/b0d88da6-5c59-4be2-85a8-493d4836723d.jpg','b0d88da6-5c59-4be2-85a8-493d4836723d.jpg','tour13.jpg',null,null,null,'25/04/04','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (259,240,'/uploads/d189551a-3e78-46bf-89c7-ff0e887060ef.jpg','d189551a-3e78-46bf-89c7-ff0e887060ef.jpg','tour4.jpg',null,null,null,'25/04/04','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (341,321,'/uploads/85ed877c-63a7-4447-bbb1-a2abdf1de80f.jfif','85ed877c-63a7-4447-bbb1-a2abdf1de80f.jfif','다운로드 (21).jfif',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (342,321,'/uploads/d519de9d-4de5-462c-aea2-92dc355673f5.JFI','d519de9d-4de5-462c-aea2-92dc355673f5.JFI','#PHOTO~1.JFI',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (328,305,'/uploads/a96826cd-4fff-4b2c-848b-1f04a8c0f11f.PNG','a96826cd-4fff-4b2c-848b-1f04a8c0f11f.PNG','2.PNG',null,null,null,'25/04/10','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (343,321,'/uploads/0edc7e65-2796-4193-902a-d6a65e502576.jfif','0edc7e65-2796-4193-902a-d6a65e502576.jfif','다운로드 (20).jfif',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (363,835,'/uploads/94b99aa0-0342-45cc-838e-1eb72d07cf4b.jpg','94b99aa0-0342-45cc-838e-1eb72d07cf4b.jpg','dance2.jpg',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (403,1549,'/uploads/b8772c01-d27c-43bc-844f-f079d9ed0f14.webp','b8772c01-d27c-43bc-844f-f079d9ed0f14.webp','한복남한복체험헤어스타일링(경복궁지점).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (410,1552,'/uploads/ccbcd77c-2656-4ade-aca9-d86fd5d02551.webp','ccbcd77c-2656-4ade-aca9-d86fd5d02551.webp','전통한옥마당에서즐기는김치만들기체험한국바비큐.webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (426,1556,'/uploads/469c6606-5cd6-4a4c-b1a1-a30dab7efbdb.webp','469c6606-5cd6-4a4c-b1a1-a30dab7efbdb.webp','롯데월드이화교복교복대여 (1).webp',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (441,1559,'/uploads/7c0fb2e0-5961-4a21-976a-468caf80999d.webp','7c0fb2e0-5961-4a21-976a-468caf80999d.webp','서울삼성코엑스아쿠아리움입장권 (1).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (446,1559,'/uploads/4123c980-d2ed-45b8-aa89-46a2c0a5c4f2.webp','4123c980-d2ed-45b8-aa89-46a2c0a5c4f2.webp','서울삼성코엑스아쿠아리움입장권 (5).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (447,1562,'/uploads/96eef94e-eaae-4c89-9fd1-163b79c721de.png','96eef94e-eaae-4c89-9fd1-163b79c721de.png','부산 원데이 투어.png',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (448,1563,'/uploads/3dac6eab-d8b4-4d0d-95d6-398202fb9691.webp','3dac6eab-d8b4-4d0d-95d6-398202fb9691.webp','경복궁한복대여체험.webp',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (449,1563,'/uploads/f80cb295-2815-45f8-a5ee-a8211e156571.webp','f80cb295-2815-45f8-a5ee-a8211e156571.webp','경복궁한복대여체험 (1).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (451,1564,'/uploads/a2511ca8-83d7-4dd2-9054-5cf0a5b8c0bc.webp','a2511ca8-83d7-4dd2-9054-5cf0a5b8c0bc.webp','제주981파크티켓 (2).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (453,1564,'/uploads/e8af6287-e1d2-4890-850d-a691f7b4b671.webp','e8af6287-e1d2-4890-850d-a691f7b4b671.webp','제주981파크티켓 (3).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (454,1565,'/uploads/d6771f35-b818-4a3d-91af-12f149c9b84e.webp','d6771f35-b818-4a3d-91af-12f149c9b84e.webp','부산나이트투어-송도케이블카더베이101광안리해변영도수변공원.webp',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (455,1564,'/uploads/f1f65d91-faa5-4a81-8569-c52f67d8a07e.webp','f1f65d91-faa5-4a81-8569-c52f67d8a07e.webp','제주981파크티켓 (4).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (457,1565,'/uploads/896b719e-5195-492b-bd9f-e3e621ea31db.webp','896b719e-5195-492b-bd9f-e3e621ea31db.webp','부산나이트투어-송도케이블카더베이101광안리해변영도수변공원 (1).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (458,1565,'/uploads/8a5d6b8d-2c8c-4792-8c7b-d3b6dc5c4614.webp','8a5d6b8d-2c8c-4792-8c7b-d3b6dc5c4614.webp','부산나이트투어-송도케이블카더베이101광안리해변영도수변공원.webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (467,1570,'/uploads/8baeb27c-ef4b-4228-8da9-2378f743eb7c.webp','8baeb27c-ef4b-4228-8da9-2378f743eb7c.webp','서울헤어살롱롤링제이_헤어스타일링메이크업 (1).webp',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (470,1569,'/uploads/b623ace0-4492-4320-8be5-3055bc1fa193.png','b623ace0-4492-4320-8be5-3055bc1fa193.png','부산 원데이 투어2.png',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (472,1569,'/uploads/ef17a68c-138f-401d-9f65-0c1bdea2d512.png','ef17a68c-138f-401d-9f65-0c1bdea2d512.png','부산 원데이 투어3.png',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (476,1568,'/uploads/2ad5eedc-f497-4501-98d5-705ec513a92a.webp','2ad5eedc-f497-4501-98d5-705ec513a92a.webp','부산나이트투어-송도케이블카더베이101광안리해변영도수변공원 (2).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (480,1572,'/uploads/fee640f3-bb6c-4b85-beb2-60ef369e6dcf.webp','fee640f3-bb6c-4b85-beb2-60ef369e6dcf.webp','아쿠아플라넷제주입장권 (4).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (481,1573,'/uploads/72c5bd1b-45e4-47d1-9f6f-56e90b6dbf74.webp','72c5bd1b-45e4-47d1-9f6f-56e90b6dbf74.webp','제주카멜리아힐티켓.webp',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (482,1574,'/uploads/10a8d9b0-7244-4e15-ad7a-604cbfd29175.webp','10a8d9b0-7244-4e15-ad7a-604cbfd29175.webp','아르떼뮤지엄제주입장권 (1).webp',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (485,1574,'/uploads/60c0db97-b81f-4177-94b7-e7af43d0d0dd.webp','60c0db97-b81f-4177-94b7-e7af43d0d0dd.webp','아르떼뮤지엄제주입장권 (4).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (487,1574,'/uploads/2506ce24-abbd-4bc5-b6f1-3533e28937e4.webp','2506ce24-abbd-4bc5-b6f1-3533e28937e4.webp','아르떼뮤지엄제주입장권 (6).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (490,1574,'/uploads/37672da3-b412-43a7-b569-d64fe65534c8.webp','37672da3-b412-43a7-b569-d64fe65534c8.webp','아르떼뮤지엄제주입장권 (9).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (492,1574,'/uploads/f23dd275-bf46-4ade-8bea-47c5892f7f76.webp','f23dd275-bf46-4ade-8bea-47c5892f7f76.webp','아르떼뮤지엄제주입장권 (11).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (493,1575,'/uploads/d3f92672-72b8-4df0-9f25-0843fca6242b.webp','d3f92672-72b8-4df0-9f25-0843fca6242b.webp','케이팝아이돌헤어메이크업퍼스널컬러진단.webp',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (495,1575,'/uploads/7ce7a209-3635-4a5c-971d-64195c65e192.webp','7ce7a209-3635-4a5c-971d-64195c65e192.webp','케이팝아이돌헤어메이크업퍼스널컬러진단 (2).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (499,1578,'/uploads/a550bc1d-ef11-471e-9e31-7e669926976c.webp','a550bc1d-ef11-471e-9e31-7e669926976c.webp','제주한국문화체험_한복교복렌탈,K-뷰티촬영 (1).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (501,1578,'/uploads/f424fd68-4c84-492b-9fb5-b343e26ab737.webp','f424fd68-4c84-492b-9fb5-b343e26ab737.webp','제주한국문화체험_한복교복렌탈,K-뷰티촬영 (3).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (504,1580,'/uploads/1f6f803d-501f-4f30-9152-5166272b3606.webp','1f6f803d-501f-4f30-9152-5166272b3606.webp','서울출발수원화성투어.webp',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (509,1569,'/uploads/1fe886e2-e912-4c85-a78e-4e8c57ad1652.png','1fe886e2-e912-4c85-a78e-4e8c57ad1652.png','부산 원데이 투어4.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (510,1568,'/uploads/1ff2aa6b-2813-45dd-a6fa-c719c8abbdf5.webp','1ff2aa6b-2813-45dd-a6fa-c719c8abbdf5.webp','부산나이트투어-송도케이블카더베이101광안리해변영도수변공원.webp',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (514,1581,'/uploads/0fea00c8-ab0c-436a-965e-37c440149cc1.webp','0fea00c8-ab0c-436a-965e-37c440149cc1.webp','감천문화마을사진첩만들기원데이클래스 (1).webp',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (523,1583,'/uploads/884313b8-0285-4fcb-80fa-a9cf73d4b8bc.png','884313b8-0285-4fcb-80fa-a9cf73d4b8bc.png','포항스페이스워크벚꽃,구룡포,호미곶유채꽃.png',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (33,3,'https://i.ibb.co/bhgdNj9/tour3.jpg','tour3.jpg',null,null,null,null,'25/03/31','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (31,1,'https://i.ibb.co/v4vLBcwY/tour1.jpg','123214.png',null,null,null,null,'25/03/31','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (32,2,'https://i.ibb.co/p6fXVd59/tour2.jpg','tour2.jpg',null,null,null,null,'25/03/31','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (34,4,'https://i.ibb.co/kVM7krdp/tour4.jpg','tour4.jpg',null,null,null,null,'25/03/31','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (35,5,'https://i.ibb.co/3mkGKD7Z/tour5.jpg','tour5.jpg',null,null,null,null,'25/03/31','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (36,6,'https://i.ibb.co/KpcD6grW/tour6.jpg','tour6.jpg',null,null,null,null,'25/03/31','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (37,7,'https://i.ibb.co/x8Pt3yxM/tour7.jpg','tour7.jpg',null,null,null,null,'25/03/31','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (38,8,'https://i.ibb.co/rG2r3101/tour8.jpg','tour8.jpg',null,null,null,null,'25/03/31','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (39,9,'https://i.ibb.co/Q79qNG5k/tour9.jpg','tour9.jpg',null,null,null,null,'25/03/31','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (40,10,'https://i.ibb.co/mCcmRmcH/tour10.png','tour10.jpg',null,null,null,null,'25/03/31','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (41,11,'https://i.ibb.co/prPrG9gz/tour11.jpg','tour11.jpg',null,null,null,null,'25/03/31','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (42,12,'https://i.ibb.co/PvdSGPmZ/tour12.jpg','tour12.jpg',null,null,null,null,'25/03/31','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (43,13,'https://i.ibb.co/vCbxF0NP/tour13.jpg','tour13.jpg',null,null,null,null,'25/03/31','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (44,14,'https://i.ibb.co/chb4Xx3D/tour15.jpg','tour14.jpg',null,null,null,null,'25/03/31','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (45,15,'https://i.ibb.co/4ZC6xbrL/tour16.jpg','tour15.jpg',null,null,null,null,'25/03/31','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (260,240,'/uploads/b5b9d608-fa96-4153-8dc9-d5acd6319196.jpg','b5b9d608-fa96-4153-8dc9-d5acd6319196.jpg','tour2.jpg',null,null,null,'25/04/04','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (265,241,'/uploads/c50ccf50-b57e-4d95-8bad-ec3db8a47dd8.jpg','c50ccf50-b57e-4d95-8bad-ec3db8a47dd8.jpg','tour13.jpg',null,null,null,'25/04/04','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (331,307,'/uploads/dea55a69-c818-4210-bcb3-d34d7a32335c.jpg','dea55a69-c818-4210-bcb3-d34d7a32335c.jpg','tour12.jpg',null,null,null,'25/04/10','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (310,292,'/uploads/604ff682-bc60-4a07-b1c9-c1524f2c67f6.jpg','604ff682-bc60-4a07-b1c9-c1524f2c67f6.jpg','tour5.jpg',null,null,null,'25/04/09','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (332,310,'/uploads/684a7367-395e-4351-bf1b-8d6b262202ca.jpg','684a7367-395e-4351-bf1b-8d6b262202ca.jpg','tour6.jpg',null,null,null,'25/04/10','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (350,321,'/uploads/c56854bf-929b-4cb6-85e0-f13132b114de.jfif','c56854bf-929b-4cb6-85e0-f13132b114de.jfif','LINE Friends Flagship Sotre in Gangnam - Daehyuk Im.jfif',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (351,321,'/uploads/4de76e72-57dc-4da6-a7d2-3476bf687a44.jfif','4de76e72-57dc-4da6-a7d2-3476bf687a44.jfif','🫧.jfif',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (348,321,'/uploads/a98bbb8a-8acc-402d-999f-7dc3b0b8f04d.jfif','a98bbb8a-8acc-402d-999f-7dc3b0b8f04d.jfif','#linefriends #seoul.jfif',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (349,321,'/uploads/b04d8e09-0919-4711-bcd7-b65c3569b8cd.jfif','b04d8e09-0919-4711-bcd7-b65c3569b8cd.jfif','__ Patrizia Conde.jfif',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (352,321,'/uploads/7d9e0279-3e7a-475a-a143-26a1f6cc0cbd.jfif','7d9e0279-3e7a-475a-a143-26a1f6cc0cbd.jfif','#linefriends #seoul.jfif',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (353,321,'/uploads/b917c578-71df-43f6-83a5-171f353bbab9.jfif','b917c578-71df-43f6-83a5-171f353bbab9.jfif','__ Patrizia Conde.jfif',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (354,321,'/uploads/f5f503c6-8ed7-4860-ba3c-896efc8bdd27.jfif','f5f503c6-8ed7-4860-ba3c-896efc8bdd27.jfif','gangnam style statue in seoul.jfif',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (355,321,'/uploads/517c3b95-9557-48b4-9378-874deac74e67.jfif','517c3b95-9557-48b4-9378-874deac74e67.jfif','봉은사.jfif',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (356,321,'/uploads/bc98cab9-341b-4e46-b0a8-56063ad4996e.jfif','bc98cab9-341b-4e46-b0a8-56063ad4996e.jfif','다운로드 (20).jfif',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (357,321,'/uploads/6aab0c11-b89a-41bf-b632-70ced0db870c.jfif','6aab0c11-b89a-41bf-b632-70ced0db870c.jfif','다운로드 (21).jfif',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (358,321,'/uploads/632500b6-4a86-4d19-acf2-dbfdba95453d.jfif','632500b6-4a86-4d19-acf2-dbfdba95453d.jfif','봉은사.jfif',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (359,321,'/uploads/f4d9ab4d-fb07-4a98-b20c-493755a2e540.jfif','f4d9ab4d-fb07-4a98-b20c-493755a2e540.jfif','__ Patrizia Conde.jfif',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (360,321,'/uploads/590d5a12-75a8-427f-b224-6f09d32c5a66.jfif','590d5a12-75a8-427f-b224-6f09d32c5a66.jfif','LINE Friends Flagship Sotre in Gangnam - Daehyuk Im.jfif',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (361,321,'/uploads/fc547cd4-15e4-44ac-ba44-9516dab4e78e.jfif','fc547cd4-15e4-44ac-ba44-9516dab4e78e.jfif','🫧.jfif',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (392,1546,'/uploads/13301ffa-f143-43a6-a4f3-cf4bacf20969.png','13301ffa-f143-43a6-a4f3-cf4bacf20969.png','불포함.png',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (393,1546,'/uploads/53c5b95a-1bc7-46cb-9513-8022098448ae.png','53c5b95a-1bc7-46cb-9513-8022098448ae.png','포함.png',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (395,1546,'/uploads/7b81bd75-00d2-4b15-8c89-b187fb244579.png','7b81bd75-00d2-4b15-8c89-b187fb244579.png','포함사항.png',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (396,1546,'/uploads/3f1c1cfe-ed4a-4d56-a2f1-f71314ad6f78.png','3f1c1cfe-ed4a-4d56-a2f1-f71314ad6f78.png','불포함 사항.png',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (397,1546,'/uploads/6bddf9f1-10a6-4525-a622-696bcab18dd4.png','6bddf9f1-10a6-4525-a622-696bcab18dd4.png','파주 평화관광1.png',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (398,1546,'/uploads/c4f3e8d1-ddbe-4e1d-b1ad-3a6264935878.png','c4f3e8d1-ddbe-4e1d-b1ad-3a6264935878.png','파주 평화관광2.png',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (399,1546,'/uploads/d9fee231-7e1a-4ca3-8d3a-196c673f4ec1.png','d9fee231-7e1a-4ca3-8d3a-196c673f4ec1.png','파주 평화관광3.png',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (400,1546,'/uploads/79464c06-237a-4ce6-8469-ce199267ac3b.png','79464c06-237a-4ce6-8469-ce199267ac3b.png','파주 평화관광1.png',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (404,1549,'/uploads/f16a43b1-9e3b-413b-bdc5-4cce2f2a7867.webp','f16a43b1-9e3b-413b-bdc5-4cce2f2a7867.webp','한복남한복체험헤어스타일링(경복궁지점) (1).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (405,1549,'/uploads/7d01e461-273a-407c-b273-ac2db9e925c2.webp','7d01e461-273a-407c-b273-ac2db9e925c2.webp','한복남한복체험헤어스타일링(경복궁지점) (2).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (407,1550,'/uploads/3eba9a78-4131-40c4-911b-69503e676424.webp','3eba9a78-4131-40c4-911b-69503e676424.webp','서울시티투어버스(도심고궁남산코스).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (408,1550,'/uploads/cf1e7cc1-6b08-494c-82df-65442dacad5d.webp','cf1e7cc1-6b08-494c-82df-65442dacad5d.webp','서울시티투어버스(도심고궁남산코스) (2).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (409,1551,'/uploads/97f43a31-6f82-4305-9898-25019167a8bf.png','97f43a31-6f82-4305-9898-25019167a8bf.png','부산 원데이 투어.png',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (411,1552,'/uploads/70dc73c6-d209-4bf7-bab0-421d3c0e0f61.webp','70dc73c6-d209-4bf7-bab0-421d3c0e0f61.webp','전통한옥마당에서즐기는김치만들기체험한국바비큐 (1).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (412,1689,'/uploads/e0f57a9d-0ccb-42eb-9a7d-6502ad24f14d.webp','e0f57a9d-0ccb-42eb-9a7d-6502ad24f14d.webp','서울난타공연티켓.webp',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (413,1549,'/uploads/a41d338a-2ccc-4a94-8ade-74f6db38a6dc.webp','a41d338a-2ccc-4a94-8ade-74f6db38a6dc.webp','한복남한복체험헤어스타일링(경복궁지점).webp',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (414,1549,'/uploads/72126e7a-7926-49e2-8a87-5723c71c45a0.webp','72126e7a-7926-49e2-8a87-5723c71c45a0.webp','한복남한복체험헤어스타일링(경복궁지점) (2).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (416,1552,'/uploads/5cb2ea9f-a13d-4e60-9747-7471dd491944.webp','5cb2ea9f-a13d-4e60-9747-7471dd491944.webp','전통한옥마당에서즐기는김치만들기체험한국바비큐.webp',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (417,1552,'/uploads/840f65f5-20ca-44a5-9de7-f54970c7be87.webp','840f65f5-20ca-44a5-9de7-f54970c7be87.webp','전통한옥마당에서즐기는김치만들기체험한국바비큐 (1).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (418,1550,'/uploads/c5b68bdf-4740-43e7-9b26-bed8041e5f2d.webp','c5b68bdf-4740-43e7-9b26-bed8041e5f2d.webp','서울시티투어버스(도심고궁남산코스) (1).webp',null,null,null,'25/04/11','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (419,1550,'/uploads/41cf70ea-10f9-4cc7-a0d4-dfb4e204f8f8.webp','41cf70ea-10f9-4cc7-a0d4-dfb4e204f8f8.webp','서울시티투어버스(도심고궁남산코스).webp',null,null,null,'25/04/11','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (746,1625,'/uploads/51de0876-30f3-49b7-973e-2ff3c8939af3.jpg','51de0876-30f3-49b7-973e-2ff3c8939af3.jpg','전문패션스타일리스트와함께하는쇼핑투어.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (747,1625,'/uploads/8a3936df-655c-4395-91a2-504482037f44.jpg','8a3936df-655c-4395-91a2-504482037f44.jpg','전문패션스타일리스트와함께하는쇼핑투어4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (748,1626,'/uploads/ea4d430b-ba23-4333-8097-c6d1219ede71.jpg','ea4d430b-ba23-4333-8097-c6d1219ede71.jpg','서울벚꽃한옥체험_프라이빗차량투어.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (749,1626,'/uploads/f6727c9b-eea6-445c-ba38-d229d22672a8.jpg','f6727c9b-eea6-445c-ba38-d229d22672a8.jpg','서울벚꽃한옥체험_프라이빗차량투어2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (750,1626,'/uploads/60c2664b-f512-4af2-93a5-6dea2b925954.jpg','60c2664b-f512-4af2-93a5-6dea2b925954.jpg','서울벚꽃한옥체험_프라이빗차량투어3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (752,1627,'/uploads/3d2859e3-2c0d-47b4-a10b-fcc5843b9a08.jpg','3d2859e3-2c0d-47b4-a10b-fcc5843b9a08.jpg','사진작가역사학자와함께하는서울레트로도보투어2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (753,1627,'/uploads/be3ae961-92ca-4186-b19c-cc39ceabd097.jpg','be3ae961-92ca-4186-b19c-cc39ceabd097.jpg','사진작가역사학자와함께하는서울레트로도보투어3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (754,1627,'/uploads/c1cffedf-4e49-41a0-bdda-1bc6194f7618.jpg','c1cffedf-4e49-41a0-bdda-1bc6194f7618.jpg','사진작가역사학자와함께하는서울레트로도보투어5.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (755,1627,'/uploads/49bc3ac2-90b1-4bfb-88e1-9a46773ea62a.jpg','49bc3ac2-90b1-4bfb-88e1-9a46773ea62a.jpg','사진작가역사학자와함께하는서울레트로도보투어4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (757,1628,'/uploads/9e361e3a-f994-46e5-bb32-1e77cd00e1a6.jpg','9e361e3a-f994-46e5-bb32-1e77cd00e1a6.jpg','서울에서즐기는사우나,바디스크럽마사지.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (758,1628,'/uploads/4d74f0d7-f0b9-44f4-bd37-817126095cb9.jpg','4d74f0d7-f0b9-44f4-bd37-817126095cb9.jpg','서울에서즐기는사우나,바디스크럽마사지2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (759,1628,'/uploads/072de18f-0bf6-4a97-b59c-7479d3bf3479.jpg','072de18f-0bf6-4a97-b59c-7479d3bf3479.jpg','서울에서즐기는사우나,바디스크럽마사지3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (760,1628,'/uploads/c6638727-e1cf-490b-8196-7d7b3d703480.jpg','c6638727-e1cf-490b-8196-7d7b3d703480.jpg','서울에서즐기는사우나,바디스크럽마사지4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (762,1629,'/uploads/2793bad7-976b-4de8-a4b6-f3f2cd357fab.jpg','2793bad7-976b-4de8-a4b6-f3f2cd357fab.jpg','제주향수박물관원데이클래스.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (763,1629,'/uploads/a929ee4e-f429-4644-b07c-7a811ff61cb2.jpg','a929ee4e-f429-4644-b07c-7a811ff61cb2.jpg','제주향수박물관원데이클래스2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (764,1629,'/uploads/229c13ec-bdc2-4846-b8cd-c1a868cda0c6.jpg','229c13ec-bdc2-4846-b8cd-c1a868cda0c6.jpg','제주향수박물관원데이클래스3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (765,1629,'/uploads/9d082c19-e4d8-4105-966d-5aca297acae1.jpg','9d082c19-e4d8-4105-966d-5aca297acae1.jpg','제주향수박물관원데이클래스4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (766,1630,'/uploads/a4b0b9ca-4957-4d45-928c-f84633eabdde.jpg','a4b0b9ca-4957-4d45-928c-f84633eabdde.jpg','나만의특별한막걸리만들기체험.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (767,1630,'/uploads/7fa3379f-6a6c-4698-b790-243be6ab9036.jpg','7fa3379f-6a6c-4698-b790-243be6ab9036.jpg','나만의특별한막걸리만들기체험2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (768,1630,'/uploads/da1b6b7e-cfa3-4e9d-bdd4-1db4fcd8e57d.jpg','da1b6b7e-cfa3-4e9d-bdd4-1db4fcd8e57d.jpg','나만의특별한막걸리만들기체험3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (769,1630,'/uploads/f65eeba0-8b18-4398-84e5-291e0a0e53b9.jpg','f65eeba0-8b18-4398-84e5-291e0a0e53b9.jpg','나만의특별한막걸리만들기체험4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (770,1631,'/uploads/a9fa512e-9576-4724-8c1d-25497574ddce.jpg','a9fa512e-9576-4724-8c1d-25497574ddce.jpg','제주ATV사륜오토바이체험.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (772,1631,'/uploads/0f345efb-f35b-4ac7-8bed-e2e157e982fa.jpg','0f345efb-f35b-4ac7-8bed-e2e157e982fa.jpg','제주ATV사륜오토바이체험3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (773,1631,'/uploads/9fdc5e81-5236-475e-a34e-b98fb40b2652.jpg','9fdc5e81-5236-475e-a34e-b98fb40b2652.jpg','제주ATV사륜오토바이체험4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (775,1631,'/uploads/0441a9fb-0d38-4a49-9d95-f07c491fb154.jpg','0441a9fb-0d38-4a49-9d95-f07c491fb154.jpg','제주ATV사륜오토바이체험6.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (776,1632,'/uploads/5d49fb7b-f916-41a4-b556-df70b8bbccda.jpg','5d49fb7b-f916-41a4-b556-df70b8bbccda.jpg','제주바다낚시투어(점심식사포함)_잊지못할제주낚시체험.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (777,1632,'/uploads/b8abe7fa-7dc5-4a22-b862-f53709d063ff.jpg','b8abe7fa-7dc5-4a22-b862-f53709d063ff.jpg','제주바다낚시투어(점심식사포함)_잊지못할제주낚시체험2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (778,1632,'/uploads/18af5cd5-2920-4f9e-bff3-7ed5f4e99e4b.jpg','18af5cd5-2920-4f9e-bff3-7ed5f4e99e4b.jpg','제주바다낚시투어(점심식사포함)_잊지못할제주낚시체험3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (779,1632,'/uploads/9dd92c50-5362-4ed7-bfa5-ff75a08eb6b6.jpg','9dd92c50-5362-4ed7-bfa5-ff75a08eb6b6.jpg','제주바다낚시투어(점심식사포함)_잊지못할제주낚시체험4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (780,1632,'/uploads/93088669-39cd-49da-8715-89e1d3c16069.jpg','93088669-39cd-49da-8715-89e1d3c16069.jpg','제주바다낚시투어(점심식사포함)_잊지못할제주낚시체험5.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (781,1632,'/uploads/8eb83f5d-80cb-4172-addb-f76391c35cee.jpg','8eb83f5d-80cb-4172-addb-f76391c35cee.jpg','제주바다낚시투어(점심식사포함)_잊지못할제주낚시체험6.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (782,1632,'/uploads/08585213-24ec-467c-8cf5-c281b145f57b.jpg','08585213-24ec-467c-8cf5-c281b145f57b.jpg','제주바다낚시투어(점심식사포함)_잊지못할제주낚시체험6.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (783,1633,'/uploads/812d3dcb-de8f-415a-9f1a-81ae751d3569.jpg','812d3dcb-de8f-415a-9f1a-81ae751d3569.jpg','제주도스쿠버다이빙체험.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (784,1633,'/uploads/ed81fec8-5dfc-4f3d-91b2-1ecd426220ee.jpg','ed81fec8-5dfc-4f3d-91b2-1ecd426220ee.jpg','제주도스쿠버다이빙체험2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (785,1633,'/uploads/6e728f6f-0727-4ad6-9298-2c05b03b614f.jpg','6e728f6f-0727-4ad6-9298-2c05b03b614f.jpg','제주도스쿠버다이빙체험3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (786,1633,'/uploads/bf3f5f96-6527-4b28-a1ce-919872cb6877.jpg','bf3f5f96-6527-4b28-a1ce-919872cb6877.jpg','제주도스쿠버다이빙체험4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (787,1634,'/uploads/6d068610-585d-4b04-a8d5-aa3d1560862d.jpg','6d068610-585d-4b04-a8d5-aa3d1560862d.jpg','제주벚꽃해녀공연소규모단체일일투어.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (788,1634,'/uploads/97b012e3-82cc-4d43-bb31-e3e7c4ff2706.jpg','97b012e3-82cc-4d43-bb31-e3e7c4ff2706.jpg','제주벚꽃해녀공연소규모단체일일투어2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (789,1634,'/uploads/a0211719-55bd-4823-9043-65ef5ad292b4.jpg','a0211719-55bd-4823-9043-65ef5ad292b4.jpg','제주벚꽃해녀공연소규모단체일일투어3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (790,1634,'/uploads/b5493a07-1e92-4aee-b686-9a08c7468958.jpg','b5493a07-1e92-4aee-b686-9a08c7468958.jpg','제주벚꽃해녀공연소규모단체일일투어4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (791,1635,'/uploads/83eab8f6-8894-4e4f-a5a8-fe6ff0db7461.jpg','83eab8f6-8894-4e4f-a5a8-fe6ff0db7461.jpg','제주무지개요트투어.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (543,1587,'/uploads/47cc0628-ee7c-4230-b76c-a5ab01f8a9ea.png','47cc0628-ee7c-4230-b76c-a5ab01f8a9ea.png','부산벚꽃랜덤투어3.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (551,1590,'/uploads/1cba2141-94b7-43ac-aea3-1a2dc2a5ef80.png','1cba2141-94b7-43ac-aea3-1a2dc2a5ef80.png','부산벚꽃명소주요관광지투어3.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (552,1590,'/uploads/8c261abc-25e9-4edb-ae17-f55ced73ee77.png','8c261abc-25e9-4edb-ae17-f55ced73ee77.png','부산벚꽃명소주요관광지투어4.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (557,1591,'/uploads/3504c6eb-8660-47b2-9eab-b530afdbedc9.png','3504c6eb-8660-47b2-9eab-b530afdbedc9.png','부산벚꽃랜덤투어4.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (561,1592,'/uploads/c6b37dd8-e7c1-4442-b83b-74e9ba9dd8c7.png','c6b37dd8-e7c1-4442-b83b-74e9ba9dd8c7.png','부산프리미엄요트투어(반려견동반가능)3.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (563,1592,'/uploads/a74f4213-9ce7-4b3e-b0c9-db9cdc93222e.png','a74f4213-9ce7-4b3e-b0c9-db9cdc93222e.png','부산프리미엄요트투어(반려견동반가능)5.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (566,1592,'/uploads/95198885-ce73-4e09-b2cd-a7b209a9d1ac.png','95198885-ce73-4e09-b2cd-a7b209a9d1ac.png','부산프리미엄요트투어(반려견동반가능)8.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (568,1592,'/uploads/5e8198ed-5e84-496b-80a1-5f6ae907b121.png','5e8198ed-5e84-496b-80a1-5f6ae907b121.png','부산프리미엄요트투어(반려견동반가능)10.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (575,1593,'/uploads/983e4da5-bfd5-4c8d-bd24-63ebd4ee1557.png','983e4da5-bfd5-4c8d-bd24-63ebd4ee1557.png','부산프라이빗택시투어5.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (577,1593,'/uploads/91ecdcde-6904-4161-8a81-eed8fff6592f.png','91ecdcde-6904-4161-8a81-eed8fff6592f.png','부산프라이빗택시투어7.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (587,1596,'/uploads/466e4870-df48-45b9-9840-08c755093302.png','466e4870-df48-45b9-9840-08c755093302.png','경주프라이빗투어부산야경투어+점심식사3.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (589,1597,'/uploads/2c3d8356-3170-4796-ab09-0216efded0a5.jpg','2c3d8356-3170-4796-ab09-0216efded0a5.jpg','레고랜드2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (590,1597,'/uploads/1715cb7c-92c8-4819-81c2-7d5e7cfbc7b4.jpg','1715cb7c-92c8-4819-81c2-7d5e7cfbc7b4.jpg','아침고요정원2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (592,1597,'/uploads/b7adeccd-90c1-4569-b75d-4e4e690c27e8.jpg','b7adeccd-90c1-4569-b75d-4e4e690c27e8.jpg','루지월드.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (597,1598,'/uploads/4d477add-0917-4764-8156-02e93c93f816.jpg','4d477add-0917-4764-8156-02e93c93f816.jpg','sizuzovuhmmx79gkezl3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (598,1599,'/uploads/198c24ae-e0ad-4229-a15c-0e28e9287f5f.png','198c24ae-e0ad-4229-a15c-0e28e9287f5f.png','자갈치해수탕_전통한국식해수바스체험4.png',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (599,1599,'/uploads/904ced6b-5017-416a-859d-75c308c3ad96.png','904ced6b-5017-416a-859d-75c308c3ad96.png','자갈치해수탕_전통한국식해수바스체험2.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (600,1599,'/uploads/b53f7f34-a7ad-44c2-9758-f132928e36ae.png','b53f7f34-a7ad-44c2-9758-f132928e36ae.png','자갈치해수탕_전통한국식해수바스체험.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (601,1599,'/uploads/e9d4a07c-07c5-44ee-a8a2-d6876df3ed30.png','e9d4a07c-07c5-44ee-a8a2-d6876df3ed30.png','자갈치해수탕_전통한국식해수바스체험3.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (602,1600,'/uploads/04c95f12-a4a7-4452-a333-4d2cbc52180f.jpg','04c95f12-a4a7-4452-a333-4d2cbc52180f.jpg','부산조향원데이클래스.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (603,1600,'/uploads/b24fdb3a-4972-4a75-abc0-c730808abfcb.jpg','b24fdb3a-4972-4a75-abc0-c730808abfcb.jpg','부산조향원데이클래스2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (606,1601,'/uploads/4ce50a62-0ade-418b-af7c-fce1572a0990.jpg','4ce50a62-0ade-418b-af7c-fce1572a0990.jpg','양양물치해변서프살롱서핑강습대여.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (607,1601,'/uploads/cddc41dd-1b27-41a1-aeb7-f946337172ec.jpg','cddc41dd-1b27-41a1-aeb7-f946337172ec.jpg','양양물치해변서프살롱서핑강습대여2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (609,1601,'/uploads/f93a6a56-4dfc-4469-acfa-55d6024eceab.jpg','f93a6a56-4dfc-4469-acfa-55d6024eceab.jpg','양양물치해변서프살롱서핑강습대여4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (611,1602,'/uploads/dd4f1d88-37d0-43da-a7f3-23fb58777842.jpg','dd4f1d88-37d0-43da-a7f3-23fb58777842.jpg','꽃장식인삼정과만들기쿠킹클래스2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (617,1603,'/uploads/da442574-677d-4352-95fd-87045c85b211.jpg','da442574-677d-4352-95fd-87045c85b211.jpg','스타벅스DMZ북한전망대현대아울렛2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (619,1603,'/uploads/e467c855-562a-4aac-8f41-5904e68f494e.jpg','e467c855-562a-4aac-8f41-5904e68f494e.jpg','스타벅스DMZ북한전망대현대아울렛3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (625,1605,'/uploads/76ccbb92-b704-4c46-b192-79ce764871a8.jpg','76ccbb92-b704-4c46-b192-79ce764871a8.jpg','서울출발가평사계절당일투어.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (628,1605,'/uploads/def39fb7-b8ac-4c4b-9425-16e594de136e.jpg','def39fb7-b8ac-4c4b-9425-16e594de136e.jpg','서울출발가평사계절당일투어4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (632,1607,'/uploads/dd800edd-7402-471b-87bb-41d1f93f5aa9.jpg','dd800edd-7402-471b-87bb-41d1f93f5aa9.jpg','서울하이킹_북한산국립공원3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (633,1607,'/uploads/6d6a8611-b36f-41df-8bcb-9cbdccaf4301.jpg','6d6a8611-b36f-41df-8bcb-9cbdccaf4301.jpg','서울하이킹_북한산국립공원4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (637,1607,'/uploads/d4f59f3a-b5ef-4002-af7e-a9c2cb6b9b11.jpg','d4f59f3a-b5ef-4002-af7e-a9c2cb6b9b11.jpg','서울하이킹_북한산국립공원8.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (638,1608,'/uploads/1d8b60cf-cb50-4259-99be-5a04bd1e3050.jpg','1d8b60cf-cb50-4259-99be-5a04bd1e3050.jpg','서울출발수원화성+스타필드+와우정사투어.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (639,1608,'/uploads/0e29aa45-d443-4347-acbf-0db3a39dd5a3.jpg','0e29aa45-d443-4347-acbf-0db3a39dd5a3.jpg','서울출발수원화성+스타필드+와우정사투어2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (643,1608,'/uploads/d8ad57a3-660c-47c7-abd4-dfc7c0324585.jpg','d8ad57a3-660c-47c7-abd4-dfc7c0324585.jpg','서울출발수원화성+스타필드+와우정사투어6.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (644,1608,'/uploads/677a898a-7cf7-4a02-9245-a824aec06cb4.jpg','677a898a-7cf7-4a02-9245-a824aec06cb4.jpg','서울출발수원화성+스타필드+와우정사투어7.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (648,1606,'/uploads/8b26c15d-24ad-4e02-bb14-26fbf6c8f2ac.jpg','8b26c15d-24ad-4e02-bb14-26fbf6c8f2ac.jpg','서울출발부천봄꽃투어_벚꽃과진달래향연2.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (650,1609,'/uploads/c8ee163a-4b23-4682-8a94-21eb2a8fce22.jpg','c8ee163a-4b23-4682-8a94-21eb2a8fce22.jpg','2025일산국제꽃박람회반나절투어.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (653,1609,'/uploads/8e4b30a4-e55b-4c2a-b3a1-d8960d4578a6.jpg','8e4b30a4-e55b-4c2a-b3a1-d8960d4578a6.jpg','2025일산국제꽃박람회반나절투어4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (674,1614,'/uploads/315f3af0-fc9c-4f43-902c-0edf7aa46524.jpg','315f3af0-fc9c-4f43-902c-0edf7aa46524.jpg','레트로클래식음악감상실감성여행3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (688,1616,'/uploads/8d5a0a88-87fb-47b6-99b6-83e6ba0c85e1.jpg','8d5a0a88-87fb-47b6-99b6-83e6ba0c85e1.jpg','나만의라탄트레이만들기원데이클래스(DIY키트배송가능)5.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (690,1617,'/uploads/36fe518f-e2ce-45c1-914d-5dc784d62580.jpg','36fe518f-e2ce-45c1-914d-5dc784d62580.jpg','한국민화그리기원데이클래스2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (700,1619,'/uploads/def04ddb-14b3-46d6-ae5c-a7e6f739ffbd.jpg','def04ddb-14b3-46d6-ae5c-a7e6f739ffbd.jpg','충북단양패러글라이딩명소,카페산에서즐기는세계적인패러글라이딩.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (545,1588,'/uploads/5b9a202c-ff27-4dbf-ad94-cbb24052d366.png','5b9a202c-ff27-4dbf-ad94-cbb24052d366.png','부산벚꽃랜덤투어3.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (547,1589,'/uploads/e000d08d-678a-406b-b8da-c98d3ec25f2b.png','e000d08d-678a-406b-b8da-c98d3ec25f2b.png','부산벚꽃랜덤투어6.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (553,1591,'/uploads/0e43df39-fb96-4f9f-891c-3c0d6c1c0301.png','0e43df39-fb96-4f9f-891c-3c0d6c1c0301.png','otjhwhzvnnluj3hw8chd.png',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (558,1591,'/uploads/0c790d3d-1c73-4d04-8448-98d895f55869.png','0c790d3d-1c73-4d04-8448-98d895f55869.png','부산벚꽃랜덤투어7.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (562,1592,'/uploads/ba26e7e1-cb84-42ac-83fc-bd4556ac89c0.png','ba26e7e1-cb84-42ac-83fc-bd4556ac89c0.png','부산프리미엄요트투어(반려견동반가능)4.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (567,1592,'/uploads/4f4d69f2-225a-4707-9672-4541f3b420b5.png','4f4d69f2-225a-4707-9672-4541f3b420b5.png','부산프리미엄요트투어(반려견동반가능)9.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (573,1593,'/uploads/e56eea26-9a7d-440f-b331-7ec48a05a544.png','e56eea26-9a7d-440f-b331-7ec48a05a544.png','부산프라이빗택시투어3.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (702,1619,'/uploads/07974bd8-211a-4233-b217-2306aaf0b84e.jpg','07974bd8-211a-4233-b217-2306aaf0b84e.jpg','충북단양패러글라이딩명소,카페산에서즐기는세계적인패러글라이딩3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (704,1619,'/uploads/4453df9f-f74f-4e0a-875e-8ebf595a1d76.jpg','4453df9f-f74f-4e0a-875e-8ebf595a1d76.jpg','충북단양패러글라이딩명소,카페산에서즐기는세계적인패러글라이딩5.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (705,1620,'/uploads/cd51d623-93fc-4748-9272-77500a311245.jpg','cd51d623-93fc-4748-9272-77500a311245.jpg','보성녹차밭순천만국가정원[기차+버스].jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (708,1620,'/uploads/592a845e-bf42-40c7-a3cf-93725ae4e413.jpg','592a845e-bf42-40c7-a3cf-93725ae4e413.jpg','보성녹차밭순천만국가정원[기차+버스]4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (710,1620,'/uploads/e06de758-067b-484b-9e2e-babee0da301f.jpg','e06de758-067b-484b-9e2e-babee0da301f.jpg','보성녹차밭순천만국가정원[기차+버스]6.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (711,1621,'/uploads/695a5f94-1ddf-41ab-b4ba-ac6f7774ee36.jpg','695a5f94-1ddf-41ab-b4ba-ac6f7774ee36.jpg','전주한옥마을한복체험사진촬영.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (712,1621,'/uploads/09679d29-5dfb-4671-ae49-d99ba2e907e3.jpg','09679d29-5dfb-4671-ae49-d99ba2e907e3.jpg','전주한옥마을한복체험사진촬영4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (713,1621,'/uploads/5f42001f-291b-47c8-acf5-d83e145f9b38.jpg','5f42001f-291b-47c8-acf5-d83e145f9b38.jpg','전주한옥마을한복체험사진촬영5.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (725,1622,'/uploads/ef55b629-9147-44f5-8a0b-0511ec4e53fe.jpg','ef55b629-9147-44f5-8a0b-0511ec4e53fe.jpg','전주한옥마을문화체험프라이빗일일투어3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (730,1622,'/uploads/c68f1baa-f59f-4630-9d79-d5e328700a08.jpg','c68f1baa-f59f-4630-9d79-d5e328700a08.jpg','전주한옥마을문화체험프라이빗일일투어8.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (751,1627,'/uploads/80371c11-8705-4454-bb13-5f1d9d14c3a3.jpg','80371c11-8705-4454-bb13-5f1d9d14c3a3.jpg','사진작가역사학자와함께하는서울레트로도보투어.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (756,1627,'/uploads/cae29c92-c4c2-4cd9-92b0-9d689d9de1df.jpg','cae29c92-c4c2-4cd9-92b0-9d689d9de1df.jpg','사진작가역사학자와함께하는서울레트로도보투어5.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (761,1628,'/uploads/27030f3d-c560-45e9-bc59-349d70bb57ae.jpg','27030f3d-c560-45e9-bc59-349d70bb57ae.jpg','서울에서즐기는사우나,바디스크럽마사지5.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (771,1631,'/uploads/58538f72-c689-4cf2-9394-798e5b6ed458.jpg','58538f72-c689-4cf2-9394-798e5b6ed458.jpg','제주ATV사륜오토바이체험2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (792,1635,'/uploads/948ffd17-f75b-4a7a-9666-49d6605e48f1.jpg','948ffd17-f75b-4a7a-9666-49d6605e48f1.jpg','제주무지개요트투어2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (801,1684,'/uploads/3ce12ee9-b39f-44f2-b18d-5268da246bac.jpg','3ce12ee9-b39f-44f2-b18d-5268da246bac.jpg','KakaoTalk_20241127_003538491_01.jpg',null,null,null,'25/04/14','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (805,1684,'/uploads/8b493556-5311-4f9f-829b-911da070e330.jfif','8b493556-5311-4f9f-829b-911da070e330.jfif','오라동 메밀밭.jfif',null,null,null,'25/04/14','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (806,null,'/uploads/a99beaff-3671-47e9-b075-e1461fd41c97.jpg','a99beaff-3671-47e9-b075-e1461fd41c97.jpg','resale-img-0.jpg',null,null,null,'25/04/14','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (807,null,'/uploads/b386d1dc-b796-4b9a-8e26-cd7e70941571.jpg','b386d1dc-b796-4b9a-8e26-cd7e70941571.jpg','resale-img-0.jpg',null,null,null,'25/04/14','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (808,1694,'/uploads/685b63a9-e765-4c46-98b6-3cf990744b12.jpg','685b63a9-e765-4c46-98b6-3cf990744b12.jpg','resale-img-0.jpg',null,null,null,'25/04/14','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (813,1697,'/uploads/36994694-0ad5-4882-9d80-ea1176cc5a9f.jpg','36994694-0ad5-4882-9d80-ea1176cc5a9f.jpg','resale-img-2.jpg',null,null,null,'25/04/15','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (811,1697,'/uploads/fbb1cb90-4e09-44c2-beff-7f105dd03a64.jpg','fbb1cb90-4e09-44c2-beff-7f105dd03a64.jpg','resale-img-0.jpg',null,null,null,'25/04/15','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (812,1697,'/uploads/543f1c53-d54e-4644-b19f-2cf94f6d1aef.jpg','543f1c53-d54e-4644-b19f-2cf94f6d1aef.jpg','resale-img-1.jpg',null,null,null,'25/04/15','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (814,1697,'/uploads/475694a6-db66-4daf-8913-c98f114e49b0.jpg','475694a6-db66-4daf-8913-c98f114e49b0.jpg','resale-img-3.jpg',null,null,null,'25/04/15','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (815,1697,'/uploads/aae82545-b3b4-4354-9187-d6f7d9e854f7.jpg','aae82545-b3b4-4354-9187-d6f7d9e854f7.jpg','resale-img-4.jpg',null,null,null,'25/04/15','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (816,1697,'/uploads/19bcd250-c240-4930-b1e8-2496b9676583.jpg','19bcd250-c240-4930-b1e8-2496b9676583.jpg','resale-img-5.jpg',null,null,null,'25/04/15','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (817,1698,'/uploads/61874a4a-00ca-4113-954d-15cef72a89b1.jpg','61874a4a-00ca-4113-954d-15cef72a89b1.jpg','스크래쳐2.jpg',null,null,null,'25/04/15','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (819,null,'/uploads/65e8c2e7-1e3a-4a0c-9943-9b8d8f615748.jpg','65e8c2e7-1e3a-4a0c-9943-9b8d8f615748.jpg','resale-img-0.jpg',null,null,null,'25/04/15','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (820,null,'/uploads/0d810875-1ea9-4ea6-98f5-30b869e13a47.jpg','0d810875-1ea9-4ea6-98f5-30b869e13a47.jpg','resale-img-1.jpg',null,null,null,'25/04/15','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (822,null,'/uploads/796cf7f3-4d23-4176-a1c7-ae876c850b2f.jpg','796cf7f3-4d23-4176-a1c7-ae876c850b2f.jpg','resale-img-1.jpg',null,null,null,'25/04/15','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (823,null,'/uploads/c2402622-51ef-4eb3-95d3-24562120efc8.jpg','c2402622-51ef-4eb3-95d3-24562120efc8.jpg','resale-img-2.jpg',null,null,null,'25/04/15','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (824,null,'/uploads/d569a3fc-735f-4554-a08f-1d90c23f56c7.jpg','d569a3fc-735f-4554-a08f-1d90c23f56c7.jpg','resale-img-3.jpg',null,null,null,'25/04/15','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (825,null,'/uploads/82e89b23-d66d-45e7-8d96-84ee2f084519.jpg','82e89b23-d66d-45e7-8d96-84ee2f084519.jpg','resale-img-4.jpg',null,null,null,'25/04/15','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (827,null,'/uploads/97fc9233-4df7-4441-b875-d731b19922d3.jpg','97fc9233-4df7-4441-b875-d731b19922d3.jpg','resale-img-1.jpg',null,null,null,'25/04/15','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (828,null,'/uploads/26874b50-ef96-4c1b-a63f-5ced10d6c9df.jpg','26874b50-ef96-4c1b-a63f-5ced10d6c9df.jpg','resale-img-5.jpg',null,null,null,'25/04/15','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (829,null,'/uploads/1dbe0130-d4c0-4ce5-b6c4-5571d90d3a20.jpg','1dbe0130-d4c0-4ce5-b6c4-5571d90d3a20.jpg','resale-img-0.jpg',null,null,null,'25/04/15','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (831,null,'/uploads/9ef31bb3-0c2d-4b65-a791-2e0a5ec1b93a.jpg','9ef31bb3-0c2d-4b65-a791-2e0a5ec1b93a.jpg','resale-img-2.jpg',null,null,null,'25/04/15','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (621,1603,'/uploads/6ef02305-2593-49ce-b585-ed7e7a0ad106.jpg','6ef02305-2593-49ce-b585-ed7e7a0ad106.jpg','스타벅스DMZ북한전망대현대아울렛5.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (726,1622,'/uploads/be1dd3cb-304e-4c62-83da-1e910533e581.jpg','be1dd3cb-304e-4c62-83da-1e910533e581.jpg','전주한옥마을문화체험프라이빗일일투어4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (731,1622,'/uploads/255b8e2d-981f-451e-aecc-63a0c1a9a8ec.jpg','255b8e2d-981f-451e-aecc-63a0c1a9a8ec.jpg','전주한옥마을문화체험프라이빗일일투어9.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (734,1623,'/uploads/8325834f-7444-4132-bed7-6c15e0a01313.jpg','8325834f-7444-4132-bed7-6c15e0a01313.jpg','석정온천휴스파스파온천체험3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (740,1624,'/uploads/0e176ba4-9314-4018-af68-fc9956ea1be5.jpg','0e176ba4-9314-4018-af68-fc9956ea1be5.jpg','서울세계문화유산투어3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (774,1631,'/uploads/ad6e83ff-8ffd-4914-be29-7fac5a390e45.jpg','ad6e83ff-8ffd-4914-be29-7fac5a390e45.jpg','제주ATV사륜오토바이체험5.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (794,1635,'/uploads/855a87e8-9067-4da7-b296-dcc35684617f.jpg','855a87e8-9067-4da7-b296-dcc35684617f.jpg','제주무지개요트투어4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (802,1684,'/uploads/e2549ef9-fd07-4a19-b4e5-fc150027c7a8.jpg','e2549ef9-fd07-4a19-b4e5-fc150027c7a8.jpg','KakaoTalk_20241129_121236837_05.jpg',null,null,null,'25/04/14','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (803,1684,'/uploads/b6a02f38-b144-463d-8c84-75290d6a0cb6.jfif','b6a02f38-b144-463d-8c84-75290d6a0cb6.jfif','해안도로.jfif',null,null,null,'25/04/14','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (804,1684,'/uploads/60748e02-68d3-4022-819c-31bfc686ef2b.jfif','60748e02-68d3-4022-819c-31bfc686ef2b.jfif','다운로드.jfif',null,null,null,'25/04/14','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (821,null,'/uploads/250cd2a1-fefe-48d5-9454-4896daa58aa3.jpg','250cd2a1-fefe-48d5-9454-4896daa58aa3.jpg','resale-img-0.jpg',null,null,null,'25/04/15','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (826,null,'/uploads/875d3aba-6c30-48ed-862e-2654f80098da.jpg','875d3aba-6c30-48ed-862e-2654f80098da.jpg','resale-img-0.jpg',null,null,null,'25/04/15','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (830,null,'/uploads/cc87dcf2-175d-4ecd-b8e7-d349def4d171.jpg','cc87dcf2-175d-4ecd-b8e7-d349def4d171.jpg','resale-img-0.jpg',null,null,null,'25/04/15','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (654,1610,'/uploads/8e05ac41-7cd3-43ec-ab5d-e6a202c6855a.jpg','8e05ac41-7cd3-43ec-ab5d-e6a202c6855a.jpg','양평패러글라이딩체험.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (678,1615,'/uploads/572b8f44-f56a-4c4b-872f-2c8ec4891457.jpg','572b8f44-f56a-4c4b-872f-2c8ec4891457.jpg','3D프린터테라리움원데이클래스(DIY키트배송가능).jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (715,1621,'/uploads/81088e7f-d990-4b17-a275-bcfbb4d79bd9.jpg','81088e7f-d990-4b17-a275-bcfbb4d79bd9.jpg','전주한옥마을한복체험사진촬영6.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (716,1621,'/uploads/c53ac334-4d11-4f8c-8cfc-ef8e0ebfd5d4.jpg','c53ac334-4d11-4f8c-8cfc-ef8e0ebfd5d4.jpg','전주한옥마을한복체험사진촬영7.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (717,1621,'/uploads/b5a63667-e8c6-4186-8e71-e31658fb5e22.jpg','b5a63667-e8c6-4186-8e71-e31658fb5e22.jpg','전주한옥마을한복체험사진촬영8.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (718,1621,'/uploads/d7129273-ef63-4a6e-842a-7e338e5ed843.jpg','d7129273-ef63-4a6e-842a-7e338e5ed843.jpg','전주한옥마을한복체험사진촬영9.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (719,1621,'/uploads/70104465-65e1-488c-b7c7-66109ba28ebd.jpg','70104465-65e1-488c-b7c7-66109ba28ebd.jpg','전주한옥마을한복체험사진촬영10.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (720,1621,'/uploads/d19bfdbf-af3a-4278-9e46-ed68cbcb2c42.jpg','d19bfdbf-af3a-4278-9e46-ed68cbcb2c42.jpg','전주한옥마을한복체험사진촬영10.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (721,1621,'/uploads/a6b26889-1eea-4865-b710-51d550fa0b77.jpg','a6b26889-1eea-4865-b710-51d550fa0b77.jpg','전주한옥마을한복체험사진촬영3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (793,1635,'/uploads/7fee0c8a-e889-4fd0-97df-6a85ca3f35ca.jpg','7fee0c8a-e889-4fd0-97df-6a85ca3f35ca.jpg','제주무지개요트투어3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (818,1698,'/uploads/e9e99a82-dbb2-4512-b938-c5ca1357c33e.jpg','e9e99a82-dbb2-4512-b938-c5ca1357c33e.jpg','스크래쳐4.jpg',null,null,null,'25/04/15','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (546,1589,'/uploads/e4e3c4ad-d115-4c77-bd7d-eac823b7572f.png','e4e3c4ad-d115-4c77-bd7d-eac823b7572f.png','부산벚꽃랜덤투어5.png',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (548,1589,'/uploads/89634866-0813-428f-87b9-7e579c1e883c.png','89634866-0813-428f-87b9-7e579c1e883c.png','부산벚꽃랜덤투어7.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (550,1590,'/uploads/85a443c3-a2f9-4b4d-b76c-035886979d77.png','85a443c3-a2f9-4b4d-b76c-035886979d77.png','부산벚꽃명소주요관광지투어2.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (559,1592,'/uploads/0eebd871-304c-4bbd-bc03-ec0fc4dd879a.png','0eebd871-304c-4bbd-bc03-ec0fc4dd879a.png','부산프리미엄요트투어(반려견동반가능).png',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (564,1592,'/uploads/7c4cab08-8c7e-4eba-8d97-afef6cb2d7e2.png','7c4cab08-8c7e-4eba-8d97-afef6cb2d7e2.png','부산프리미엄요트투어(반려견동반가능)6.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (569,1592,'/uploads/1e7f3be9-440a-4219-be80-042226a5ebfb.png','1e7f3be9-440a-4219-be80-042226a5ebfb.png','부산프리미엄요트투어(반려견동반가능)11.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (572,1593,'/uploads/1772f2db-4da9-46b9-a888-2c84f6326d49.png','1772f2db-4da9-46b9-a888-2c84f6326d49.png','부산프라이빗택시투어2.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (574,1593,'/uploads/d55df2fd-c0be-4a35-953d-03885a2c0963.png','d55df2fd-c0be-4a35-953d-03885a2c0963.png','부산프라이빗택시투어4.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (578,1594,'/uploads/362fa0df-67e0-4793-805e-736312f170b7.png','362fa0df-67e0-4793-805e-736312f170b7.png','부산프라이빗택시투어3.png',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (580,1594,'/uploads/4a48d176-94cf-49c9-b1c2-f8ee4fc72fe5.png','4a48d176-94cf-49c9-b1c2-f8ee4fc72fe5.png','부산프라이빗택시투어6.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (581,1595,'/uploads/2c095e42-b4bc-43ae-89a7-13cbcae28f2e.png','2c095e42-b4bc-43ae-89a7-13cbcae28f2e.png','DMZ2터널+한탄강하늘다리.png',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (582,1595,'/uploads/1ac69d92-c45e-4258-8dae-a7362119e83f.png','1ac69d92-c45e-4258-8dae-a7362119e83f.png','DMZ2터널+한탄강하늘다리2.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (584,1595,'/uploads/cd543c5b-0db0-4e87-96c7-703c4d9d0b07.png','cd543c5b-0db0-4e87-96c7-703c4d9d0b07.png','DMZ2터널+한탄강하늘다리4.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (585,1596,'/uploads/5694fc67-5ead-45a3-af81-508257c4da87.png','5694fc67-5ead-45a3-af81-508257c4da87.png','경주프라이빗투어부산야경투어+점심식사.png',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (586,1596,'/uploads/cf9f18cd-1bd7-42b0-886a-a1ca76dabaf1.png','cf9f18cd-1bd7-42b0-886a-a1ca76dabaf1.png','경주프라이빗투어부산야경투어+점심식사.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (588,1597,'/uploads/9f95874a-3e9a-4114-be21-337285467cb3.jpg','9f95874a-3e9a-4114-be21-337285467cb3.jpg','레고랜드.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (591,1597,'/uploads/2b4f4338-dab1-4f3c-ad3f-34a0bf4cca99.jpg','2b4f4338-dab1-4f3c-ad3f-34a0bf4cca99.jpg','아침고요정원3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (593,1598,'/uploads/27acbd87-cdea-40f4-bba2-5a061479588e.jpg','27acbd87-cdea-40f4-bba2-5a061479588e.jpg','tntl2u1nlvkwopqrnh0w.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (594,1598,'/uploads/1ecd12f1-d87f-4b74-999c-9ef33b298cb4.jpg','1ecd12f1-d87f-4b74-999c-9ef33b298cb4.jpg','ek5dhccphqiaypthwyy4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (595,1598,'/uploads/4fda966c-f224-479a-96c6-0ef7e89e44d6.jpg','4fda966c-f224-479a-96c6-0ef7e89e44d6.jpg','lqw64pmesig3jike3o9o.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (604,1600,'/uploads/4e3e7e74-2ba5-42d8-b88c-ccf5e488196e.jpg','4e3e7e74-2ba5-42d8-b88c-ccf5e488196e.jpg','부산조향원데이클래스3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (608,1601,'/uploads/b3d69d9d-6951-46d3-aff5-239b3d62717a.jpg','b3d69d9d-6951-46d3-aff5-239b3d62717a.jpg','양양물치해변서프살롱서핑강습대여3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (610,1602,'/uploads/ef5db557-04a0-43ec-8339-29046e55047d.jpg','ef5db557-04a0-43ec-8339-29046e55047d.jpg','꽃장식인삼정과만들기쿠킹클래스.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (612,1602,'/uploads/af1b0243-66d8-4151-8b93-b84739635c05.jpg','af1b0243-66d8-4151-8b93-b84739635c05.jpg','꽃장식인삼정과만들기쿠킹클래스3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (616,1603,'/uploads/800e9801-4ad7-4ca1-84f5-82a5f24d84ab.jpg','800e9801-4ad7-4ca1-84f5-82a5f24d84ab.jpg','스타벅스DMZ북한전망대현대아울렛.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (622,1604,'/uploads/8559ddf7-0bdc-4325-9547-137a54697a5a.jpg','8559ddf7-0bdc-4325-9547-137a54697a5a.jpg','서울출발수원화성투어.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (623,1604,'/uploads/4776c8b5-374f-4cdb-8a61-d655f027b452.jpg','4776c8b5-374f-4cdb-8a61-d655f027b452.jpg','서울출발수원화성투어2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (624,1604,'/uploads/64a6b6ac-2510-4cc7-8450-f550bbc327a5.jpg','64a6b6ac-2510-4cc7-8450-f550bbc327a5.jpg','서울출발수원화성투어3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (626,1605,'/uploads/de23f518-2c89-442d-8960-dace90f13dd9.jpg','de23f518-2c89-442d-8960-dace90f13dd9.jpg','서울출발가평사계절당일투어2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (627,1605,'/uploads/e086bec0-38c6-40bd-b1d7-609c883c399c.jpg','e086bec0-38c6-40bd-b1d7-609c883c399c.jpg','서울출발가평사계절당일투어3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (629,1606,'/uploads/843060a0-1f48-44b4-8b08-922db573d1fd.jpg','843060a0-1f48-44b4-8b08-922db573d1fd.jpg','서울출발부천봄꽃투어_벚꽃과진달래향연.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (630,1607,'/uploads/abeda648-5a1a-4073-b854-56cba38062c1.jpg','abeda648-5a1a-4073-b854-56cba38062c1.jpg','서울하이킹_북한산국립공원.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (631,1607,'/uploads/15546d3b-52b5-4c45-85b7-4dbc41ddd0ee.jpg','15546d3b-52b5-4c45-85b7-4dbc41ddd0ee.jpg','서울하이킹_북한산국립공원2.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (635,1607,'/uploads/2abaab02-8a37-41d8-ac3c-f0e4209fe5c7.jpg','2abaab02-8a37-41d8-ac3c-f0e4209fe5c7.jpg','서울하이킹_북한산국립공원6.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (636,1607,'/uploads/2881012b-1d2e-4737-9126-1f4acd4f3573.jpg','2881012b-1d2e-4737-9126-1f4acd4f3573.jpg','서울하이킹_북한산국립공원7.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (649,1606,'/uploads/7df8be0b-920f-434b-bcbe-28d4f9a25107.jpg','7df8be0b-920f-434b-bcbe-28d4f9a25107.jpg','서울출발부천봄꽃투어_벚꽃과진달래향연3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (655,1610,'/uploads/bd2565da-34a6-4859-8b69-50498b160820.jpg','bd2565da-34a6-4859-8b69-50498b160820.jpg','양평패러글라이딩체험2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (656,1610,'/uploads/60153ef4-1098-49ec-a5ab-65346893112b.jpg','60153ef4-1098-49ec-a5ab-65346893112b.jpg','양평패러글라이딩체험3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (657,1610,'/uploads/ca439c51-9647-4600-9606-103616229e03.jpg','ca439c51-9647-4600-9606-103616229e03.jpg','양평패러글라이딩체험4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (660,1611,'/uploads/d982223c-bfba-4486-a051-1ce30c374477.jpg','d982223c-bfba-4486-a051-1ce30c374477.jpg','[클룩단독특가]남이섬가평탑랜드번지점프체험3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (661,1612,'/uploads/1ebeb756-f748-46b9-8ba0-6846c3bf0487.jpg','1ebeb756-f748-46b9-8ba0-6846c3bf0487.jpg','프리다이빙체험.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (664,1612,'/uploads/eda03024-26bb-446c-b371-48231d01a8c5.jpg','eda03024-26bb-446c-b371-48231d01a8c5.jpg','프리다이빙체험4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (667,1613,'/uploads/0b6ee09c-b60f-41e3-b632-151d30c9b9cd.jpg','0b6ee09c-b60f-41e3-b632-151d30c9b9cd.jpg','보성강진녹차체험일일투어(광주출발)2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (668,1613,'/uploads/d650e3de-915e-4d44-9b23-d96056a8c013.jpg','d650e3de-915e-4d44-9b23-d96056a8c013.jpg','보성강진녹차체험일일투어(광주출발)3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (670,1613,'/uploads/df27bb4f-d7dc-40b7-bd64-bd9991995060.jpg','df27bb4f-d7dc-40b7-bd64-bd9991995060.jpg','보성강진녹차체험일일투어(광주출발)5.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (583,1595,'/uploads/6c1d15ca-25fb-4f1e-800a-5f439cd08723.png','6c1d15ca-25fb-4f1e-800a-5f439cd08723.png','DMZ2터널+한탄강하늘다리3.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (596,1598,'/uploads/5f251ad6-224c-4bf7-8d0a-c27fd2ba89bf.png','5f251ad6-224c-4bf7-8d0a-c27fd2ba89bf.png','부산나흠화방에서한국전통예술체험.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (605,1600,'/uploads/af5cad15-6958-435b-b942-2652ef6da78d.jpg','af5cad15-6958-435b-b942-2652ef6da78d.jpg','부산조향원데이클래스4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (613,1602,'/uploads/1014b93d-5c8b-45bb-b3a7-805037e70d51.jpg','1014b93d-5c8b-45bb-b3a7-805037e70d51.jpg','꽃장식인삼정과만들기쿠킹클래스4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (615,1603,'/uploads/88e6d70a-3b9a-45b2-b1e0-2c57e186eee7.jpg','88e6d70a-3b9a-45b2-b1e0-2c57e186eee7.jpg','스타벅스DMZ북한전망대현대아울렛.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (620,1603,'/uploads/8f943f6f-93da-4e6c-86e9-85952775c1e2.jpg','8f943f6f-93da-4e6c-86e9-85952775c1e2.jpg','스타벅스DMZ북한전망대현대아울렛4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (641,1608,'/uploads/824bac2a-2cce-4c1e-8201-1961896de494.jpg','824bac2a-2cce-4c1e-8201-1961896de494.jpg','서울출발수원화성+스타필드+와우정사투어4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (646,1608,'/uploads/09bbcc0b-fecf-4e1e-a0d8-294c09572989.jpg','09bbcc0b-fecf-4e1e-a0d8-294c09572989.jpg','서울출발수원화성+스타필드+와우정사투어9.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (651,1609,'/uploads/64d042c9-90bb-46e2-9a92-5b97bde0e791.jpg','64d042c9-90bb-46e2-9a92-5b97bde0e791.jpg','2025일산국제꽃박람회반나절투어2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (652,1609,'/uploads/46174bdd-9d4d-4a77-b9d3-b191675acb90.jpg','46174bdd-9d4d-4a77-b9d3-b191675acb90.jpg','2025일산국제꽃박람회반나절투어3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (665,1612,'/uploads/2b8674cf-fe04-4d55-ba90-ae54942b0a09.jpg','2b8674cf-fe04-4d55-ba90-ae54942b0a09.jpg','프리다이빙체험5.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (666,1613,'/uploads/63671806-19b2-4c34-823b-41c8d33e5c09.jpg','63671806-19b2-4c34-823b-41c8d33e5c09.jpg','보성강진녹차체험일일투어(광주출발).jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (671,1613,'/uploads/01d9b2de-bf2e-45ad-94ff-645ce95bd931.jpg','01d9b2de-bf2e-45ad-94ff-645ce95bd931.jpg','보성강진녹차체험일일투어(광주출발)6.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (672,1614,'/uploads/00845d07-7b20-4757-bc31-a6708c64dc50.jpg','00845d07-7b20-4757-bc31-a6708c64dc50.jpg','레트로클래식음악감상실감성여행.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (675,1614,'/uploads/708e5272-b62b-4981-8ea3-788dd53bb72c.jpg','708e5272-b62b-4981-8ea3-788dd53bb72c.jpg','레트로클래식음악감상실감성여행4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (676,1614,'/uploads/a3004336-2029-4901-8ecf-908a98a6452e.jpg','a3004336-2029-4901-8ecf-908a98a6452e.jpg','레트로클래식음악감상실감성여행5.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (677,1614,'/uploads/ea352bfb-0118-49a9-a480-d9c0f86e5f91.jpg','ea352bfb-0118-49a9-a480-d9c0f86e5f91.jpg','레트로클래식음악감상실감성여행6.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (679,1615,'/uploads/099f8199-6842-488a-839e-585a7b7ae32a.jpg','099f8199-6842-488a-839e-585a7b7ae32a.jpg','3D프린터테라리움원데이클래스(DIY키트배송가능)2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (680,1615,'/uploads/acca339e-7b43-41e3-b841-95b7debc5697.jpg','acca339e-7b43-41e3-b841-95b7debc5697.jpg','3D프린터테라리움원데이클래스(DIY키트배송가능)3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (681,1615,'/uploads/9af71811-4bb4-4ccd-960d-d1f3158d35b6.jpg','9af71811-4bb4-4ccd-960d-d1f3158d35b6.jpg','3D프린터테라리움원데이클래스(DIY키트배송가능)4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (682,1615,'/uploads/c2821a90-23e0-4881-b4dc-2abfb2ac539e.jpg','c2821a90-23e0-4881-b4dc-2abfb2ac539e.jpg','3D프린터테라리움원데이클래스(DIY키트배송가능)5.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (683,1615,'/uploads/009df493-f11f-4b50-b448-68eb35e52180.jpg','009df493-f11f-4b50-b448-68eb35e52180.jpg','3D프린터테라리움원데이클래스(DIY키트배송가능)6.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (684,1615,'/uploads/d1ebdddc-efc4-4d18-b22e-4a6a9f19c1a9.jpg','d1ebdddc-efc4-4d18-b22e-4a6a9f19c1a9.jpg','3D프린터테라리움원데이클래스(DIY키트배송가능)7.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (685,1616,'/uploads/9a9a5ef5-2f06-4eb0-b58a-b309245367a6.jpg','9a9a5ef5-2f06-4eb0-b58a-b309245367a6.jpg','나만의라탄트레이만들기원데이클래스(DIY키트배송가능).jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (686,1616,'/uploads/271f20d7-16b4-4ec3-8542-9ef1cd3c8e30.jpg','271f20d7-16b4-4ec3-8542-9ef1cd3c8e30.jpg','나만의라탄트레이만들기원데이클래스(DIY키트배송가능)2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (687,1616,'/uploads/d198d1a0-a6c2-458f-9d16-807bdd38a802.jpg','d198d1a0-a6c2-458f-9d16-807bdd38a802.jpg','나만의라탄트레이만들기원데이클래스(DIY키트배송가능)4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (689,1617,'/uploads/32980bc7-7fad-4824-90cf-9bc99f2b22b9.jpg','32980bc7-7fad-4824-90cf-9bc99f2b22b9.jpg','한국민화그리기원데이클래스.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (691,1617,'/uploads/4b0050b6-debc-49cf-9e40-087f7439bb87.jpg','4b0050b6-debc-49cf-9e40-087f7439bb87.jpg','한국민화그리기원데이클래스3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (692,1617,'/uploads/15c45461-5200-47cc-944f-e2d05d8a08b5.jpg','15c45461-5200-47cc-944f-e2d05d8a08b5.jpg','한국민화그리기원데이클래스4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (694,1618,'/uploads/2ee26184-47f7-462a-be37-2009c1e63240.jpg','2ee26184-47f7-462a-be37-2009c1e63240.jpg','여용국한방스파트리트먼트.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (695,1618,'/uploads/20b72556-b1a5-4db2-955f-b562c796ed8d.jpg','20b72556-b1a5-4db2-955f-b562c796ed8d.jpg','여용국한방스파트리트먼트2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (696,1618,'/uploads/e01ae0dc-efeb-4fa9-b9e1-10320dec1485.jpg','e01ae0dc-efeb-4fa9-b9e1-10320dec1485.jpg','여용국한방스파트리트먼트3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (697,1618,'/uploads/7e68eafa-29ed-47a2-8015-8746e68f6674.jpg','7e68eafa-29ed-47a2-8015-8746e68f6674.jpg','여용국한방스파트리트먼트4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (698,1618,'/uploads/01bfa9de-afaf-426d-ad17-31870dee69ac.jpg','01bfa9de-afaf-426d-ad17-31870dee69ac.jpg','여용국한방스파트리트먼트5.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (699,1618,'/uploads/43aeac66-dd5e-4ca5-a581-9516b52bc972.jpg','43aeac66-dd5e-4ca5-a581-9516b52bc972.jpg','여용국한방스파트리트먼트6.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (701,1619,'/uploads/14e30255-de79-4c2a-b820-991530a5949e.jpg','14e30255-de79-4c2a-b820-991530a5949e.jpg','충북단양패러글라이딩명소,카페산에서즐기는세계적인패러글라이딩2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (703,1619,'/uploads/cb3fea55-9caf-4257-a1c7-213269990469.jpg','cb3fea55-9caf-4257-a1c7-213269990469.jpg','충북단양패러글라이딩명소,카페산에서즐기는세계적인패러글라이딩4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (706,1620,'/uploads/9a218200-4e97-44a9-b924-ee935372b5f5.jpg','9a218200-4e97-44a9-b924-ee935372b5f5.jpg','보성녹차밭순천만국가정원[기차+버스]2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (709,1620,'/uploads/27acb9f4-3020-40e7-bcaa-8f8f2e4b3c9f.jpg','27acb9f4-3020-40e7-bcaa-8f8f2e4b3c9f.jpg','보성녹차밭순천만국가정원[기차+버스]5.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (714,1621,'/uploads/533b1d7f-cd98-445c-be02-b2df9c59a4a9.jpg','533b1d7f-cd98-445c-be02-b2df9c59a4a9.jpg','전주한옥마을한복체험사진촬영2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (722,1621,'/uploads/319d6baa-f1c5-458d-815e-1a60a8334ac4.jpg','319d6baa-f1c5-458d-815e-1a60a8334ac4.jpg','전주한옥마을한복체험사진촬영11.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (544,1588,'/uploads/e6061277-3b71-46eb-a3c4-4e7279b55790.png','e6061277-3b71-46eb-a3c4-4e7279b55790.png','부산벚꽃랜덤투어.png',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (549,1590,'/uploads/bc6634a9-3fa3-426b-a03f-1d426f12b813.png','bc6634a9-3fa3-426b-a03f-1d426f12b813.png','부산벚꽃명소주요관광지투어.png',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (554,1591,'/uploads/aec7f9b1-9ebd-4c07-bf58-8ae44031a653.png','aec7f9b1-9ebd-4c07-bf58-8ae44031a653.png','부산벚꽃랜덤투어.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (555,1591,'/uploads/938501a3-f76e-4b22-b3a2-5622b6942fd2.png','938501a3-f76e-4b22-b3a2-5622b6942fd2.png','부산벚꽃랜덤투어2.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (556,1591,'/uploads/bdeb79ca-af43-4bc4-9944-54d64a281eb3.png','bdeb79ca-af43-4bc4-9944-54d64a281eb3.png','부산벚꽃랜덤투어3.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (560,1592,'/uploads/1bf744cf-d018-4de8-9e92-d7c4a532e2e2.png','1bf744cf-d018-4de8-9e92-d7c4a532e2e2.png','부산프리미엄요트투어(반려견동반가능)2.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (565,1592,'/uploads/e107e14b-fe8e-43a5-8aca-c93aa15accae.png','e107e14b-fe8e-43a5-8aca-c93aa15accae.png','부산프리미엄요트투어(반려견동반가능)7.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (570,1592,'/uploads/fde735e1-29f4-4cfb-8d42-487e93494d11.png','fde735e1-29f4-4cfb-8d42-487e93494d11.png','부산프리미엄요트투어(반려견동반가능)11.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (571,1593,'/uploads/6a4389b4-f31f-4524-85e6-b8b1047f2945.png','6a4389b4-f31f-4524-85e6-b8b1047f2945.png','부산프라이빗택시투어.png',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (576,1593,'/uploads/0711ff18-73cd-4e66-8a93-3f72f078a641.png','0711ff18-73cd-4e66-8a93-3f72f078a641.png','부산프라이빗택시투어6.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (579,1594,'/uploads/dfc2f857-0384-40bc-b37a-f072a0e8763c.png','dfc2f857-0384-40bc-b37a-f072a0e8763c.png','부산프라이빗택시투어5.png',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (614,1602,'/uploads/bf8011ac-7030-440c-9113-048355499a1d.webp','bf8011ac-7030-440c-9113-048355499a1d.webp','꽃장식인삼정과만들기쿠킹클래스5.webp',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (618,1603,'/uploads/52cc9ae1-ab11-4d78-9144-bd923e4cd09c.jpg','52cc9ae1-ab11-4d78-9144-bd923e4cd09c.jpg','스타벅스DMZ북한전망대현대아울렛2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (634,1607,'/uploads/c43a7a17-7771-4574-8f14-13a9f9e8d8a3.jpg','c43a7a17-7771-4574-8f14-13a9f9e8d8a3.jpg','서울하이킹_북한산국립공원5.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (640,1608,'/uploads/5ee9896e-a645-4e00-bbbb-0e5850d820e4.jpg','5ee9896e-a645-4e00-bbbb-0e5850d820e4.jpg','서울출발수원화성+스타필드+와우정사투어3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (642,1608,'/uploads/26b66bec-294e-40be-83c2-63d1ab7fc707.jpg','26b66bec-294e-40be-83c2-63d1ab7fc707.jpg','서울출발수원화성+스타필드+와우정사투어5.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (645,1608,'/uploads/aeeacb61-c679-40f3-8470-961535334e14.jpg','aeeacb61-c679-40f3-8470-961535334e14.jpg','서울출발수원화성+스타필드+와우정사투어8.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (647,1608,'/uploads/cdedcf67-88eb-4d9a-a98d-1daf1d80d77f.jpg','cdedcf67-88eb-4d9a-a98d-1daf1d80d77f.jpg','서울출발수원화성+스타필드+와우정사투어10.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (658,1611,'/uploads/a4c3d729-6457-49ac-839f-be883e16cfa2.jpg','a4c3d729-6457-49ac-839f-be883e16cfa2.jpg','[클룩단독특가]남이섬가평탑랜드번지점프체험.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (659,1611,'/uploads/de15d9cb-0ab7-441d-9bf4-d9be461e7fc6.jpg','de15d9cb-0ab7-441d-9bf4-d9be461e7fc6.jpg','[클룩단독특가]남이섬가평탑랜드번지점프체험2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (662,1612,'/uploads/0e88a8b7-ddf2-43be-922e-b16686a3a1e4.jpg','0e88a8b7-ddf2-43be-922e-b16686a3a1e4.jpg','프리다이빙체험2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (663,1612,'/uploads/7d13a2f1-81ef-4406-916b-ad8f91166efc.jpg','7d13a2f1-81ef-4406-916b-ad8f91166efc.jpg','프리다이빙체험3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (669,1613,'/uploads/d00f9ce6-1296-4fff-be70-913df773cdf0.jpg','d00f9ce6-1296-4fff-be70-913df773cdf0.jpg','보성강진녹차체험일일투어(광주출발)4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (673,1614,'/uploads/b462f7a7-99a9-40ab-93c3-be6ca547e668.jpg','b462f7a7-99a9-40ab-93c3-be6ca547e668.jpg','레트로클래식음악감상실감성여행2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (693,1617,'/uploads/1cc69ea3-a6db-4146-bd4b-c01ababd36af.jpg','1cc69ea3-a6db-4146-bd4b-c01ababd36af.jpg','한국민화그리기원데이클래스5.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (707,1620,'/uploads/e96fbb2b-ee99-4f35-a861-a4b3ae33dc2a.jpg','e96fbb2b-ee99-4f35-a861-a4b3ae33dc2a.jpg','보성녹차밭순천만국가정원[기차+버스]3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (723,1622,'/uploads/df479279-61a4-422b-b679-c5db06a2cdca.jpg','df479279-61a4-422b-b679-c5db06a2cdca.jpg','전주한옥마을문화체험프라이빗일일투어.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (724,1622,'/uploads/0a2ee8d5-f63f-45d9-99d2-e0e5e009967e.jpg','0a2ee8d5-f63f-45d9-99d2-e0e5e009967e.jpg','전주한옥마을문화체험프라이빗일일투어2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (727,1622,'/uploads/f94c8498-2e93-4d44-bfa7-606ea4664c99.jpg','f94c8498-2e93-4d44-bfa7-606ea4664c99.jpg','전주한옥마을문화체험프라이빗일일투어5.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (728,1622,'/uploads/13ea5036-9a8a-4837-b080-268aff68af83.jpg','13ea5036-9a8a-4837-b080-268aff68af83.jpg','전주한옥마을문화체험프라이빗일일투어6.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (729,1622,'/uploads/7cd0c8ac-c0d1-4264-980b-56b934054b7c.jpg','7cd0c8ac-c0d1-4264-980b-56b934054b7c.jpg','전주한옥마을문화체험프라이빗일일투어7.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (732,1623,'/uploads/defe63ae-eb3a-4e2c-affc-a5ab0128da8a.jpg','defe63ae-eb3a-4e2c-affc-a5ab0128da8a.jpg','석정온천휴스파스파온천체험.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (733,1623,'/uploads/eb7457a8-86ef-42ab-b48a-cd3172c93dd4.jpg','eb7457a8-86ef-42ab-b48a-cd3172c93dd4.jpg','석정온천휴스파스파온천체험2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (735,1623,'/uploads/e2b2ffd3-236b-403f-a280-b1c31371e1e1.jpg','e2b2ffd3-236b-403f-a280-b1c31371e1e1.jpg','석정온천휴스파스파온천체험3.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (736,1623,'/uploads/6c9ba8c4-ad34-4ffe-ba1c-fb45b2322d3d.jpg','6c9ba8c4-ad34-4ffe-ba1c-fb45b2322d3d.jpg','석정온천휴스파스파온천체험4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (737,1623,'/uploads/90af2b84-5373-444a-ad08-5dfd669384ca.jpg','90af2b84-5373-444a-ad08-5dfd669384ca.jpg','석정온천휴스파스파온천체험5.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (738,1624,'/uploads/97e0c0c1-0468-417d-be48-66612b0f4961.jpg','97e0c0c1-0468-417d-be48-66612b0f4961.jpg','서울세계문화유산투어.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (739,1624,'/uploads/879a04c0-a3e6-434d-8794-d9aaafaf25e2.jpg','879a04c0-a3e6-434d-8794-d9aaafaf25e2.jpg','서울세계문화유산투어2.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (741,1624,'/uploads/a3446716-6b35-4192-ae2e-30f47f2c720a.jpg','a3446716-6b35-4192-ae2e-30f47f2c720a.jpg','서울세계문화유산투어4.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (742,1624,'/uploads/05a2f19c-0e25-4710-ba1e-1d710f30a076.jpg','05a2f19c-0e25-4710-ba1e-1d710f30a076.jpg','서울세계문화유산투어5.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (743,1624,'/uploads/3bd5e629-db51-4bf9-b4b7-f7d3e75522cf.jpg','3bd5e629-db51-4bf9-b4b7-f7d3e75522cf.jpg','서울세계문화유산투어6.jpg',null,null,null,'25/04/12','N');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (744,1625,'/uploads/7bb0d1be-fd3d-4aa3-9c8b-3ed140bca43c.jpg','7bb0d1be-fd3d-4aa3-9c8b-3ed140bca43c.jpg','pf3jomznwkht8amz6bcy.jpg',null,null,null,'25/04/12','Y');
Insert into SYSTEM.IMG (FILE_NO,TOUR_NO,FILE_PATH,FILE_NAME,FILE_ORG_NAME,FILE_TYPE,FILE_SIZE,FILE_EXTENSION,I_UPLOAD_DATE,THUMBNAIL) values (745,1625,'/uploads/61d79735-7687-4e1a-8e57-86d7b8e08fd2.jpg','61d79735-7687-4e1a-8e57-86d7b8e08fd2.jpg','전문패션스타일리스트와함께하는쇼핑투어3.jpg',null,null,null,'25/04/12','N');
REM INSERTING into SYSTEM.INQUIRIES
SET DEFINE OFF;
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (1,1,'투어정보','투어는 몇 시간 동안 진행되나요?','투어마다 다르지만 보통 4시간에서 종일 투어(8시간)까지 다양해요. 상세 시간은 투어 상세 페이지에 안내되어 있습니다.',to_date('24/07/23','RR/MM/DD'),to_date('24/09/12','RR/MM/DD'),'투어 시간 문의','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (2,2,'취소/환불','투어 당일에도 취소할 수 있나요?','죄송하지만 투어 당일 취소는 어려워요. 가급적 미리 취소 요청해 주세요.',to_date('23/01/14','RR/MM/DD'),to_date('23/03/03','RR/MM/DD'),'투어 당일 취소 문의','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (3,3,'결제','결제가 실패하면 어떻게 해야 하나요?','결제가 실패한 경우, 인터넷 연결 상태를 확인하거나 결제 수단을 다시 확인해 보세요. 그래도 안 되면 저희 고객센터로 연락 주시면 도와드리겠습니다.',to_date('23/11/23','RR/MM/DD'),to_date('24/01/06','RR/MM/DD'),'결제가 실패 했어요','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (4,4,'투어정보','투어에 어떤 장소들이 포함되나요?','각 투어의 상세 페이지에서 방문할 장소 목록을 확인하실 수 있어요. 주로 인기 관광지가 포함되어 있습니다.',to_date('25/05/15','RR/MM/DD'),to_date('25/06/05','RR/MM/DD'),'투어 장소 문의','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (5,5,'투어정보','점심 식사가 포함되어 있나요?','일부 투어는 점심이 포함되어 있고, 일부는 포함되어 있지 않아요. 투어 상세 정보에서 확인하실 수 있습니다.',to_date('24/07/23','RR/MM/DD'),to_date('24/08/01','RR/MM/DD'),'투어 중식 포함 여부','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (6,1,'결제','해외 신용카드로 결제할 수 있나요?','네, 해외에서 발행된 신용카드로도 결제하실 수 있어요. 결제 과정에서 카드 정보를 입력하시면 됩니다.',to_date('24/03/16','RR/MM/DD'),to_date('24/05/03','RR/MM/DD'),'해외 결제수단 사용 가능한가요?','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (7,2,'결제','어떤 결제 수단을 사용할 수 있나요?','신용카드, 직불카드, 페이팔 등 다양한 결제 수단을 사용하실 수 있어요.',to_date('24/11/20','RR/MM/DD'),to_date('24/11/26','RR/MM/DD'),'결제수단 문의 드립니다.','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (8,3,'취소/환불','예약을 취소하려면 어떻게 해야 하나요?','마이페이지에서 예약을 취소할 수 있어요. 또는 고객센터로 연락 주시면 안내해 드리겠습니다.',to_date('23/07/09','RR/MM/DD'),to_date('23/08/02','RR/MM/DD'),'예약 취소하고 싶어요','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (9,4,'투어정보','투어는 몇 시에 시작하나요?','투어에 따라 다르지만 대부분 오전 9시나 10시쯤 시작해요. 예약 시 정확한 시간을 확인하실 수 있습니다.',to_date('23/07/18','RR/MM/DD'),to_date('23/08/09','RR/MM/DD'),'투어 몇시에 시작해요?','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (10,5,'기타','여행자 보험이 포함되어 있나요?','표준 예약에는 여행자 보험이 포함되어 있지 않아요. 원하시면 추가로 가입하실 수 있도록 안내해드릴 수 있습니다.',to_date('24/12/05','RR/MM/DD'),to_date('25/01/12','RR/MM/DD'),'여행자 보험 있나요?','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (11,1,'취소/환불','취소 시 환불 규정은 어떻게 되나요?','투어 시작 7일 전까지 취소하시면 전액 환불해드려요. 그 이후에는 취소 수수료가 발생할 수 있습니다.',to_date('24/06/25','RR/MM/DD'),to_date('24/08/15','RR/MM/DD'),'환불 규정이 궁금해요','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (12,2,'투어정보','가이드는 어떤 언어로 안내하나요?','대부분 한국어와 영어로 안내 가능합니다. 필요하시면 다른 언어 가능 여부도 문의해 주세요.',to_date('23/03/30','RR/MM/DD'),to_date('23/05/15','RR/MM/DD'),'어떤 언어로 가이드 가능한가요?','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (13,3,'예약','미리 예약해야 하나요?','네, 원하시는 날짜에 이용하시려면 가능한 한 미리 예약하시는 게 좋아요. 인기 있는 투어는 빨리 마감될 수 있습니다.',to_date('25/07/29','RR/MM/DD'),to_date('25/09/01','RR/MM/DD'),'미리 예약 해야 되나요?','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (14,4,'취소/환불','환불은 얼마나 시간이 걸리나요?','환불은 취소 확인 후 영업일 기준 3~5일 정도 소요돼요. 결제 수단에 따라 차이가 있을 수 있습니다.',to_date('23/09/13','RR/MM/DD'),to_date('23/11/11','RR/MM/DD'),'환불 시간이 궁금해요.','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (15,5,'기타','연락 가능한 현지 전화번호가 있나요?','네, 현지에서 연락하실 수 있는 고객센터 전화번호는 02-1234-5678입니다. 필요하실 때 언제든 연락주세요.',to_date('25/02/14','RR/MM/DD'),to_date('25/02/19','RR/MM/DD'),'연락 가능한 현지 번호 있나요?','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (16,1,'취소/환불','부분 환불이 가능한가요?','상황에 따라 다르지만 일반적으로 투어 시작 후에는 부분 환불이 어렵습니다. 상세한 사항은 고객센터로 문의해 주세요.',to_date('24/08/23','RR/MM/DD'),to_date('24/10/15','RR/MM/DD'),'부분 환불 문의드립니다.','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (17,2,'예약','그룹 할인이 있나요?','네, 일정 인원 이상의 단체 예약에는 할인 혜택이 있어요. 자세한 내용은 저희에게 문의해 주세요.',to_date('25/01/10','RR/MM/DD'),to_date('25/02/15','RR/MM/DD'),'그룹 예약 할인 되나요?','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (18,3,'기타','비상시에는 어떻게 연락하면 되나요?','24시간 긴급 연락처로 연락하실 수 있어요. 비상 상황에서는 +82-10-1234-5678로 전화주시면 즉시 도움 드리겠습니다.',to_date('24/01/29','RR/MM/DD'),to_date('24/03/14','RR/MM/DD'),'비상 연락처가 있나요?','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (19,4,'예약','예약을 변경하려면 어떻게 해야 하나요?','예약 변경은 여행 시작일 기준으로 며칠 전까지 가능해요. 변경을 원하시면 고객센터로 연락 주시면 도와드리겠습니다.',to_date('23/05/23','RR/MM/DD'),to_date('23/05/25','RR/MM/DD'),'예약 변경 하고 싶어요.','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (20,5,'기타','가이드에게 팁을 주어야 하나요?','한국에서는 가이드에게 팁을 주실 필요가 없습니다. 좋은 서비스에 대해 감사 인사를 해주시면 됩니다.',to_date('24/04/11','RR/MM/DD'),to_date('24/05/30','RR/MM/DD'),'가이드 팁 드려야 할까요?','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (21,1,'결제','현장에서 현금으로 결제해도 되나요?','일부 투어는 현장 결제를 받을 수 있지만 가급적 사전 결제를 권장드려요. 현장 결제가 가능한지 사전에 문의해주세요.',to_date('24/08/15','RR/MM/DD'),to_date('24/08/20','RR/MM/DD'),'현장 결제 문의 드립니다.','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (22,2,'결제','결제 영수증을 받을 수 있나요?','네, 결제가 완료되면 이메일로 영수증을 보내드립니다. 필요하시면 현장에서 종이 영수증도 요청하실 수 있어요.',to_date('24/04/21','RR/MM/DD'),to_date('24/06/15','RR/MM/DD'),'결제 영수증이 필요해요','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (23,3,'예약','예약은 어떻게 하나요?','저희 웹사이트의 예약 페이지에서 원하는 날짜와 인원을 선택하여 예약할 수 있어요. 어려움이 있다면 고객센터로 문의해주시면 도와드리겠습니다.',to_date('23/07/26','RR/MM/DD'),to_date('23/08/19','RR/MM/DD'),'예약 방법이 궁금합니다.','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (24,4,'예약','예약 확인 이메일은 언제 받을 수 있나요?','예약을 완료하시면 즉시 확인 이메일을 보내드려요. 몇 분 내로 못 받으셨다면 스팸메일함도 확인해 보세요.',to_date('24/07/23','RR/MM/DD'),to_date('24/08/21','RR/MM/DD'),'예약 이메일은 언제 오나요?','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (25,5,'기타','공항 픽업 서비스를 제공하나요?','네, 별도의 요금으로 공항 픽업 서비스를 이용하실 수 있어요. 예약 시 옵션으로 선택하시면 됩니다.',to_date('25/01/17','RR/MM/DD'),to_date('25/01/27','RR/MM/DD'),'공항 픽업 서비스가 있나요?','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (33,65,'패키지','패키지 환불해주세요 재석씨 ','죄송합니다. 빠따 준비하겠습니다.',to_date('25/04/08','RR/MM/DD'),to_date('25/04/08','RR/MM/DD'),'패키지가 왜 이따위에요 ?','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (43,63,'예약/결제','test','test1',to_date('25/04/16','RR/MM/DD'),to_date('25/04/16','RR/MM/DD'),'teset','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (34,66,'취소/환불','다른 나라 갈거임','난 안돌려줄거임',to_date('25/04/09','RR/MM/DD'),to_date('25/04/09','RR/MM/DD'),'환불 요청','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (35,65,'예약/결제','결제가 안되네요 재석씨 ',null,to_date('25/04/10','RR/MM/DD'),to_date('25/04/10','RR/MM/DD'),'결제 ','답변대기');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (42,87,'예약/결제','결제 완료 ',null,to_date('25/04/14','RR/MM/DD'),to_date('25/04/14','RR/MM/DD'),'결제했어요','답변대기');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (38,36,'예약/결제','제주도 자리 있나요','판매 안된거 보면 몰라요?',to_date('25/04/10','RR/MM/DD'),to_date('25/04/10','RR/MM/DD'),'예약하고싶은데 자리있나요','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (32,29,'취소/환불','안쓸거임 ㅂㅂ',null,to_date('25/03/26','RR/MM/DD'),to_date('25/03/26','RR/MM/DD'),'뭐야 개비쌈','답변대기');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (39,66,'취소/환불','구입한건 없는데 환불해줘 !!',null,to_date('25/04/10','RR/MM/DD'),to_date('25/04/10','RR/MM/DD'),'환불해줘 !!!','답변대기');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (40,64,'패키지','알아맞춰 보세요','ddg',to_date('25/04/10','RR/MM/DD'),to_date('25/04/10','RR/MM/DD'),'어떻게 만들까요','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (29,1,'예약/결제','123123',null,to_date('25/03/25','RR/MM/DD'),to_date('25/03/25','RR/MM/DD'),'123123','답변대기');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (37,62,'패키지','환불 요청합니다.',null,to_date('25/04/10','RR/MM/DD'),to_date('25/04/10','RR/MM/DD'),'환불바랍니다','답변대기');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (31,1,'패키지','제발요 ','안돼. 받아줄 생각 없어 돌아가!',to_date('25/03/25','RR/MM/DD'),to_date('25/03/25','RR/MM/DD'),'패키지 당장 환불해주세요 ','답변완료');
Insert into SYSTEM.INQUIRIES (INQUIRY_NO,USER_NO,CATEGORY,QUESTION,ANSWER,INQ_CREATED_AT,INQ_UPDATED_AT,QNA_TITLE,QNA_STATUS) values (27,1,'취소환불','너무 열받아요 당장 취소해주세요 ','응 안돼~~ 안해줄거야',to_date('25/03/25','RR/MM/DD'),to_date('25/03/25','RR/MM/DD'),'당장 취소해주세요 ','답변완료');
REM INSERTING into SYSTEM.NOTICES
SET DEFINE OFF;
Insert into SYSTEM.NOTICES (NOTICE_NO,TITLE,CONTENT,N_CREATED_AT,N_UPDATED_AT) values (1,'벚꽃 명소 가이드 업데이트','전국 주요 벚꽃 명소와 개화 시기를 정리한 2025년 봄 벚꽃 가이드를 확인해보세요.',to_date('25/03/20','RR/MM/DD'),to_date('25/03/20','RR/MM/DD'));
Insert into SYSTEM.NOTICES (NOTICE_NO,TITLE,CONTENT,N_CREATED_AT,N_UPDATED_AT) values (2,'공항철도 이용 가이드 추가','인천공항에서 서울 도심까지 빠르게 이동할 수 있는 공항철도 이용 방법을 안내합니다.',to_date('25/03/21','RR/MM/DD'),to_date('25/03/21','RR/MM/DD'));
Insert into SYSTEM.NOTICES (NOTICE_NO,TITLE,CONTENT,N_CREATED_AT,N_UPDATED_AT) values (3,'한글날 연휴 주요 관광지 운영 시간 안내','한글날 연휴(10월 9일)를 맞아 주요 관광지의 특별 운영 시간 정보를 안내드립니다.',to_date('25/03/22','RR/MM/DD'),to_date('25/03/22','RR/MM/DD'));
Insert into SYSTEM.NOTICES (NOTICE_NO,TITLE,CONTENT,N_CREATED_AT,N_UPDATED_AT) values (4,'전통시장 방문 가이드 추가','한국의 전통시장을 즐기는 방법과 인기 시장 정보가 새롭게 추가되었습니다.',to_date('25/03/23','RR/MM/DD'),to_date('25/03/23','RR/MM/DD'));
Insert into SYSTEM.NOTICES (NOTICE_NO,TITLE,CONTENT,N_CREATED_AT,N_UPDATED_AT) values (5,'제주도 렌터카 예약 팁','제주도에서 렌터카를 보다 저렴하고 안전하게 예약하는 방법을 안내드립니다.',to_date('25/03/24','RR/MM/DD'),to_date('25/03/24','RR/MM/DD'));
Insert into SYSTEM.NOTICES (NOTICE_NO,TITLE,CONTENT,N_CREATED_AT,N_UPDATED_AT) values (6,'환전 및 교통카드 구매 정보 업데이트','외국인 여행자를 위한 환전소 위치와 교통카드 구매 방법을 최신 정보로 업데이트했습니다.',to_date('25/03/20','RR/MM/DD'),to_date('25/03/20','RR/MM/DD'));
Insert into SYSTEM.NOTICES (NOTICE_NO,TITLE,CONTENT,N_CREATED_AT,N_UPDATED_AT) values (7,'봄 축제 캘린더 안내','전국 봄꽃 축제 및 지역별 문화행사 일정을 한눈에 볼 수 있는 캘린더를 제공합니다.',to_date('25/03/19','RR/MM/DD'),to_date('25/03/19','RR/MM/DD'));
Insert into SYSTEM.NOTICES (NOTICE_NO,TITLE,CONTENT,N_CREATED_AT,N_UPDATED_AT) values (8,'지하철 앱 추천 목록 제공','외국인을 위한 지하철 길찾기 앱 및 실시간 교통 앱을 정리한 목록을 추가했습니다.',to_date('25/03/18','RR/MM/DD'),to_date('25/03/18','RR/MM/DD'));
Insert into SYSTEM.NOTICES (NOTICE_NO,TITLE,CONTENT,N_CREATED_AT,N_UPDATED_AT) values (9,'문화 체험 프로그램 예약 안내','한복 체험, 다도, 전통 공예 등 외국인 대상 체험 프로그램의 예약 정보를 제공합니다.',to_date('25/03/17','RR/MM/DD'),to_date('25/03/17','RR/MM/DD'));
Insert into SYSTEM.NOTICES (NOTICE_NO,TITLE,CONTENT,N_CREATED_AT,N_UPDATED_AT) values (10,'봄철 기상 특보 안내','봄철 황사 및 미세먼지 예보에 따른 건강 수칙과 여행 유의사항을 확인해 주세요.',to_date('25/03/16','RR/MM/DD'),to_date('25/03/16','RR/MM/DD'));
Insert into SYSTEM.NOTICES (NOTICE_NO,TITLE,CONTENT,N_CREATED_AT,N_UPDATED_AT) values (11,'서울 시티투어버스 운영 시간 변경','서울 시티투어버스의 봄철 노선 및 시간표가 변경되었습니다. 이용 전 확인 바랍니다.',to_date('25/03/15','RR/MM/DD'),to_date('25/03/15','RR/MM/DD'));
Insert into SYSTEM.NOTICES (NOTICE_NO,TITLE,CONTENT,N_CREATED_AT,N_UPDATED_AT) values (12,'지역 맛집 가이드 신규 등록','서울, 부산, 전주 등 인기 도시의 대표 맛집 정보를 새롭게 추가했습니다.',to_date('25/03/14','RR/MM/DD'),to_date('25/03/14','RR/MM/DD'));
Insert into SYSTEM.NOTICES (NOTICE_NO,TITLE,CONTENT,N_CREATED_AT,N_UPDATED_AT) values (13,'계절별 추천 여행지 안내','봄에 가기 좋은 여행지를 테마별로 정리해 소개드립니다.',to_date('25/03/13','RR/MM/DD'),to_date('25/03/13','RR/MM/DD'));
Insert into SYSTEM.NOTICES (NOTICE_NO,TITLE,CONTENT,N_CREATED_AT,N_UPDATED_AT) values (14,'숙소 예약 팁 및 주의사항 안내','외국인 관광객을 위한 합법 숙소 확인 방법과 예약 시 주의사항을 알려드립니다.',to_date('25/03/12','RR/MM/DD'),to_date('25/03/12','RR/MM/DD'));
Insert into SYSTEM.NOTICES (NOTICE_NO,TITLE,CONTENT,N_CREATED_AT,N_UPDATED_AT) values (15,'외국인 할인 정보 제공','외국인 전용 할인 가능한 교통, 공연, 입장권 정보를 한눈에 확인해보세요.',to_date('25/03/11','RR/MM/DD'),to_date('25/03/11','RR/MM/DD'));
Insert into SYSTEM.NOTICES (NOTICE_NO,TITLE,CONTENT,N_CREATED_AT,N_UPDATED_AT) values (16,'긴급 상황 시 대처 가이드','여권 분실, 의료 응급 상황 등 위급한 상황에서 대처할 수 있는 정보를 제공합니다.',to_date('25/03/10','RR/MM/DD'),to_date('25/03/10','RR/MM/DD'));
Insert into SYSTEM.NOTICES (NOTICE_NO,TITLE,CONTENT,N_CREATED_AT,N_UPDATED_AT) values (17,'야경 명소 가이드 추가','외국인 관광객이 많이 찾는 한국의 아름다운 야경 명소를 소개합니다.',to_date('25/03/09','RR/MM/DD'),to_date('25/03/09','RR/MM/DD'));
Insert into SYSTEM.NOTICES (NOTICE_NO,TITLE,CONTENT,N_CREATED_AT,N_UPDATED_AT) values (18,'한국 전통 명절 안내','설날과 추석 등 한국의 주요 명절 문화와 일정에 대해 설명드립니다.',to_date('25/03/08','RR/MM/DD'),to_date('25/03/08','RR/MM/DD'));
Insert into SYSTEM.NOTICES (NOTICE_NO,TITLE,CONTENT,N_CREATED_AT,N_UPDATED_AT) values (19,'공지사항 알림 설정 방법','새로운 여행 정보 공지를 빠르게 확인할 수 있는 알림 설정 방법을 안내합니다.',to_date('25/03/07','RR/MM/DD'),to_date('25/03/07','RR/MM/DD'));
Insert into SYSTEM.NOTICES (NOTICE_NO,TITLE,CONTENT,N_CREATED_AT,N_UPDATED_AT) values (20,'사이트 다국어 번역 기능 안내','웹사이트 내 자동 번역 기능을 활용해 한국어 외 여러 언어로 쉽게 정보를 확인할 수 있습니다.',to_date('25/03/06','RR/MM/DD'),to_date('25/03/06','RR/MM/DD'));
REM INSERTING into SYSTEM.PARTNERSHIP
SET DEFINE OFF;
Insert into SYSTEM.PARTNERSHIP (PARTNERSHIP_NO,TITLE,CONTENT,NAME,EMAIL,PHONE) values (1,'제휴맺자','우리랑','이태훈','sample@sample.com','010-9234-1232');
Insert into SYSTEM.PARTNERSHIP (PARTNERSHIP_NO,TITLE,CONTENT,NAME,EMAIL,PHONE) values (2,'제휴합시다','제휴 합시다 우리 asdjajdiwqjdjiwqjidjqw ＃','재석','sss@naver.com','010-2828-2828');
Insert into SYSTEM.PARTNERSHIP (PARTNERSHIP_NO,TITLE,CONTENT,NAME,EMAIL,PHONE) values (3,'test','test','test','test','test');
REM INSERTING into SYSTEM.PAYMENTS
SET DEFINE OFF;
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (313,66,1559,10,to_date('25/04/14','RR/MM/DD'),'거래완료','card','order_1744602508859',3,138,null);
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (318,98,1552,10,to_date('25/04/16','RR/MM/DD'),'결제완료','card','order_1744769234141',2,163,'땅콩 알러지가 있습니다.');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (315,87,1628,10,to_date('25/04/14','RR/MM/DD'),'거래완료','card','order_1744621551641',3,153,'땅콩알레르기가 잇어요 ');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (1,4,1594,621600,to_date('25/04/01','RR/MM/DD'),'거래완료','CREDIT_CARD','order_1743382110201',2,null,'비건식 원합니다');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (2,65,1548,200000,to_date('25/03/23','RR/MM/DD'),'거래완료','CREDIT_CARD','order_1743382110202',4,null,'비건식 원합니다');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (3,9,1634,132800,to_date('25/04/07','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110203',1,null,'매운 음식 피해 주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (4,10,1631,115200,to_date('25/04/02','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110204',4,null,'버섯 알러지 있어요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (5,60,1626,406400,to_date('25/03/28','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110205',2,null,'매운 음식 피해 주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (6,82,1628,120000,to_date('25/04/12','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110206',1,null,'해산물은 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (7,70,1578,144000,to_date('25/04/02','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110207',3,null,'비건식 원합니다');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (8,54,1630,212600,to_date('25/03/27','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110208',2,null,'채식 위주로 부탁드려요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (9,19,1568,64000,to_date('25/03/26','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110209',2,null,'버섯 알러지 있어요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (10,70,1611,60000,to_date('25/03/22','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110210',2,null,'비건식 원합니다');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (11,3,1553,40000,to_date('25/03/19','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110211',2,null,'고기 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (12,14,1629,120000,to_date('25/03/31','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110212',3,null,'고기 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (13,56,1557,100000,to_date('25/03/30','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110213',2,null,'버섯 알러지 있어요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (14,7,1559,84000,to_date('25/03/17','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110214',3,null,'밀가루 음식 피하고 싶어요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (15,5,1549,168900,to_date('25/04/08','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110215',3,null,'밀가루 음식 피하고 싶어요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (16,7,1569,126000,to_date('25/03/16','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110216',2,null,'버섯 알러지 있어요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (17,20,1635,150000,to_date('25/04/11','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110217',3,null,'버섯 알러지 있어요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (18,54,1590,136800,to_date('25/03/18','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110218',2,null,'비건식 원합니다');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (19,10,1591,200100,to_date('25/03/19','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110219',3,null,'해산물은 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (20,8,1632,910400,to_date('25/04/04','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110220',4,null,'밀가루 음식 피하고 싶어요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (21,13,1602,795600,to_date('25/03/20','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110221',4,null,'해산물은 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (22,66,1601,228000,to_date('25/04/09','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110222',4,null,'고기 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (23,19,1581,56000,to_date('25/04/05','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110223',4,null,'매운 음식 피해 주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (24,69,1610,160000,to_date('25/03/28','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110224',1,null,'비건식 원합니다');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (25,60,1552,140000,to_date('25/04/03','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110225',2,null,'해산물은 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (26,17,1563,60000,to_date('25/03/17','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110226',3,null,'버섯 알러지 있어요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (27,69,1550,50000,to_date('25/03/27','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110227',2,null,'채식 위주로 부탁드려요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (28,12,1576,72000,to_date('25/03/27','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110228',2,null,'비건식 원합니다');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (29,55,1570,920000,to_date('25/04/03','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110229',4,null,'버섯 알러지 있어요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (30,18,1633,207000,to_date('25/03/29','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110230',3,null,'해산물은 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (31,16,1582,91800,to_date('25/03/31','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110231',2,null,'매운 음식 피해 주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (32,82,1583,323310,to_date('25/03/23','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110232',3,null,'해산물은 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (33,60,1572,36000,to_date('25/04/01','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110233',1,null,'버섯 알러지 있어요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (34,2,1580,274000,to_date('25/04/11','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110234',2,null,'채식 위주로 부탁드려요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (35,57,1573,10000,to_date('25/03/15','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110235',1,null,'버섯 알러지 있어요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (36,6,1592,140000,to_date('25/04/05','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110236',4,null,'매운 음식 피해 주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (37,66,1609,138600,to_date('25/04/07','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110237',2,null,'채식 위주로 부탁드려요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (38,17,1564,106000,to_date('25/03/18','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110238',2,null,'고기 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (39,57,1603,320000,to_date('25/04/05','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110239',4,null,'채식 위주로 부탁드려요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (40,1,1595,114300,to_date('25/04/12','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110240',1,null,'비건식 원합니다');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (41,18,1575,210000,to_date('25/04/01','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110241',1,null,'고기 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (42,82,1596,142100,to_date('25/04/08','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110242',1,null,'해산물은 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (43,82,1554,60000,to_date('25/03/23','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110243',3,null,'고기 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (44,9,1556,160000,to_date('25/04/08','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110244',2,null,'계란 못 먹습니다');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (45,13,1597,330000,to_date('25/04/04','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110245',3,null,'비건식 원합니다');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (46,7,1598,168900,to_date('25/03/25','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110246',3,null,'채식 위주로 부탁드려요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (47,55,1599,30000,to_date('25/03/18','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110247',3,null,'채식 위주로 부탁드려요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (48,3,1600,194100,to_date('25/03/24','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110248',3,null,'매운 음식 피해 주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (49,57,1574,39000,to_date('25/03/28','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110249',3,null,'계란 못 먹습니다');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (50,4,1604,422100,to_date('25/03/20','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110250',3,null,'해산물은 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (51,16,1605,189200,to_date('25/03/29','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110251',2,null,'버섯 알러지 있어요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (52,56,1607,99500,to_date('25/03/15','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110252',1,null,'계란 못 먹습니다');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (53,57,1606,105600,to_date('25/04/07','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110253',1,null,'계란 못 먹습니다');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (54,14,1608,60000,to_date('25/04/12','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110254',1,null,'밀가루 음식 피하고 싶어요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (55,56,1612,140000,to_date('25/04/07','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110255',2,null,'해산물은 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (56,13,1613,250000,to_date('25/03/23','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110256',1,null,'버섯 알러지 있어요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (57,18,1579,20000,to_date('25/03/31','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110257',1,null,'고기 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (58,65,1684,1200000,to_date('25/04/01','RR/MM/DD'),'거래완료','CREDIT_CARD','order_1743382110258',4,null,'고기 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (59,66,1615,60000,to_date('25/03/20','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110259',2,null,'계란 못 먹습니다');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (60,59,1614,8000,to_date('25/03/31','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110260',1,null,'해산물은 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (61,54,1616,120000,to_date('25/04/13','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110261',2,null,'고기 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (62,16,1617,160000,to_date('25/03/18','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110262',2,null,'고기 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (63,57,1619,220000,to_date('25/04/11','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110263',2,null,'비건식 원합니다');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (64,11,1618,792000,to_date('25/04/04','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110264',4,null,'비건식 원합니다');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (66,56,1621,375000,to_date('25/04/10','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110266',2,null,'계란 못 먹습니다');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (67,54,1622,28900,to_date('25/04/04','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110267',1,null,'계란 못 먹습니다');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (68,1,1623,60000,to_date('25/03/31','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110268',2,null,'밀가루 음식 피하고 싶어요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (69,11,1625,506400,to_date('25/04/03','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110269',3,null,'비건식 원합니다');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (70,82,1624,302700,to_date('25/03/21','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110270',3,null,'고기 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (71,21,1627,175200,to_date('25/03/19','RR/MM/DD'),'결제완료','CREDIT_CARD','order_1743382110271',4,null,'해산물은 제외해주세요');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (316,90,1553,10,to_date('25/04/15','RR/MM/DD'),'결제완료','card','order_1744675523485',3,155,'땅콩알레르기가 있어요 ');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (317,97,1578,10,to_date('25/04/16','RR/MM/DD'),'결제완료','card','order_1744768576604',2,162,'땅콩 알러지가 있습니다.');
Insert into SYSTEM.PAYMENTS (PAYMENT_NO,USER_NO,TOUR_NO,AMOUNT,PAYMENT_DATE,PAYMENT_STATUS,METHOD,MERCHANT_ID,NUM_PEOPLE,BASKET_NO,ETC) values (314,65,1630,10,to_date('25/04/14','RR/MM/DD'),'환불요청','card','order_1744619896137',3,152,'땅콩알레르기 있어요 ');
REM INSERTING into SYSTEM.PROMOTIONS
SET DEFINE OFF;
REM INSERTING into SYSTEM.REGION
SET DEFINE OFF;
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,null,null);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'강남구',230);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'강동구',250);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'강북구',90);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'강서구',160);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'관악구',210);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'광진구',50);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'구로구',170);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'금천구',180);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'노원구',110);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'도봉구',100);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'동대문구',60);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'동작구',200);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'마포구',140);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'서대문구',130);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'서초구',220);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'성동구',40);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'성북구',80);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'송파구',240);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'양천구',150);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'영등포구',190);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'용산구',30);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'은평구',120);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'종로구',10);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'중구',20);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('서울특별시',11,'중랑구',70);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('부산광역시',21,null,null);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('부산광역시',21,'강서구',120);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('부산광역시',21,'금정구',110);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('부산광역시',21,'남구',70);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('부산광역시',21,'동구',30);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('부산광역시',21,'동래구',60);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('부산광역시',21,'부산진구',50);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('부산광역시',21,'북구',80);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('부산광역시',21,'사상구',150);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('부산광역시',21,'사하구',100);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('부산광역시',21,'서구',20);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('부산광역시',21,'수영구',140);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('부산광역시',21,'연제구',130);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('부산광역시',21,'영도구',40);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('부산광역시',21,'중구',10);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('부산광역시',21,'해운대구',90);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('부산광역시',21,'기장군',310);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('대구광역시',22,null,null);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('대구광역시',22,'남구',40);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('대구광역시',22,'달서구',70);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('대구광역시',22,'동구',20);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('대구광역시',22,'북구',50);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('대구광역시',22,'서구',30);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('대구광역시',22,'수성구',60);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('대구광역시',22,'중구',10);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('대구광역시',22,'달성군',310);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('인천광역시',23,null,null);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('인천광역시',23,'계양구',70);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('인천광역시',23,'남구',30);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('인천광역시',23,'남동구',50);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('인천광역시',23,'동구',20);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('인천광역시',23,'부평구',60);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('인천광역시',23,'서구',80);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('인천광역시',23,'연수구',40);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('인천광역시',23,'중구',10);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('인천광역시',23,'강화군',310);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('인천광역시',23,'옹진군',320);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('대전광역시',25,null,null);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('대전광역시',25,'대덕구',50);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('대전광역시',25,'동구',10);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('대전광역시',25,'서구',30);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('대전광역시',25,'유성구',40);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('대전광역시',25,'중구',20);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('세종특별자치시',29,'세종시',10);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('광주광역시',24,null,null);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('광주광역시',24,'광산구',50);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('광주광역시',24,'남구',30);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('광주광역시',24,'동구',10);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('광주광역시',24,'북구',40);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('광주광역시',24,'서구',20);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('울산광역시',26,null,null);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('울산광역시',26,'남구',20);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('울산광역시',26,'동구',30);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('울산광역시',26,'북구',40);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('울산광역시',26,'중구',10);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('울산광역시',26,'울주군',310);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,null,null);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'고양시',100);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'과천시',110);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'광명시',60);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'광주시',250);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'구리시',120);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'군포시',160);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'김포시',230);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'남양주시',130);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'동두천시',80);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'부천시',50);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'성남시',20);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'수원시',10);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'시흥시',150);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'안산시',90);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'안성시',220);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'안양시',40);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'양주시',260);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'오산시',140);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'용인시',190);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'의왕시',170);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'의정부시',30);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'이천시',210);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'파주시',200);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'평택시',70);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'포천시',270);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'하남시',180);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'화성시',240);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'가평군',370);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'양평군',380);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'여주시',280);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경기도',31,'연천군',350);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('강원도',32,null,null);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('강원도',32,'강릉시',30);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('강원도',32,'동해시',40);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('강원도',32,'삼척시',70);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('강원도',32,'속초시',60);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('강원도',32,'원주시',20);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('강원도',32,'춘천시',10);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('강원도',32,'태백시',50);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('강원도',32,'고성군',400);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('강원도',32,'양구군',380);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('강원도',32,'양양군',410);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('강원도',32,'영월군',330);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('강원도',32,'인제군',390);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('강원도',32,'정선군',350);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('강원도',32,'철원군',360);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('강원도',32,'평창군',340);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('강원도',32,'홍천군',310);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('강원도',32,'화천군',370);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('강원도',32,'횡성군',320);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청북도',33,null,null);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청북도',33,'제천시',30);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청북도',33,'청주시',40);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청북도',33,'충주시',20);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청북도',33,'괴산군',360);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청북도',33,'단양군',380);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청북도',33,'보은군',320);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청북도',33,'영동군',340);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청북도',33,'옥천군',330);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청북도',33,'음성군',370);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청북도',33,'증평군',390);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청북도',33,'진천군',350);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청남도',34,null,null);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청남도',34,'계룡시',70);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청남도',34,'공주시',20);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청남도',34,'논산시',60);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청남도',34,'보령시',30);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청남도',34,'서산시',50);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청남도',34,'아산시',40);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청남도',34,'천안시',10);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청남도',34,'금산군',310);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청남도',34,'당진시',80);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청남도',34,'부여군',330);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청남도',34,'서천군',340);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청남도',34,'예산군',370);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청남도',34,'청양군',350);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청남도',34,'태안군',380);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('충청남도',34,'홍성군',360);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,null,null);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'경산시',100);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'경주시',20);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'구미시',50);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'김천시',30);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'문경시',90);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'상주시',80);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'안동시',40);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'영주시',60);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'영천시',70);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'포항시',10);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'고령군',370);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'군위군',310);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'봉화군',410);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'성주군',380);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'영덕군',350);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'영양군',340);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'예천군',400);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'울릉군',430);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'울진군',420);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'의성군',320);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'청도군',360);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'청송군',330);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상북도',37,'칠곡군',390);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상남도',38,null,null);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상남도',38,'거제시',90);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상남도',38,'김해시',70);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상남도',38,'밀양시',80);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상남도',38,'사천시',60);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상남도',38,'양산시',100);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상남도',38,'진주시',30);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상남도',38,'창원시',110);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상남도',38,'통영시',50);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상남도',38,'거창군',390);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상남도',38,'고성군',340);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상남도',38,'남해군',350);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상남도',38,'산청군',370);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상남도',38,'의령군',310);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상남도',38,'창녕군',330);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상남도',38,'하동군',360);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상남도',38,'함안군',320);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상남도',38,'함양군',380);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('경상남도',38,'합천군',400);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라북도',35,null,null);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라북도',35,'군산시',20);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라북도',35,'김제시',60);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라북도',35,'남원시',50);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라북도',35,'익산시',30);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라북도',35,'전주시',10);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라북도',35,'정읍시',40);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라북도',35,'고창군',370);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라북도',35,'무주군',330);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라북도',35,'부안군',380);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라북도',35,'순창군',360);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라북도',35,'완주군',310);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라북도',35,'임실군',350);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라북도',35,'장수군',340);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라북도',35,'진안군',320);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,null,null);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'광양시',60);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'나주시',40);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'목포시',10);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'순천시',30);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'여수시',20);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'강진군',390);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'고흥군',350);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'곡성군',320);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'구례군',330);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'담양군',310);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'무안군',420);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'보성군',360);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'신안군',480);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'영광군',440);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'영암군',410);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'완도군',460);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'장성군',450);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'장흥군',380);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'진도군',470);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'함평군',430);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'해남군',400);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('전라남도',36,'화순군',370);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('제주특별자치도',39,null,null);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('제주특별자치도',39,'제주시',10);
Insert into SYSTEM.REGION (SI_NAME,SI_NO,GU_NAME,GU_NO) values ('제주특별자치도',39,'서귀포시',20);
REM INSERTING into SYSTEM.REQUEST_COMMENTS
SET DEFINE OFF;
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (1,1,9,'저도 양양 좋아하는데요 ',to_date('25/03/24','RR/MM/DD'),to_date('25/03/24','RR/MM/DD'),null,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (2,1,9,'양양은 서핑이 꿀잼이죠',to_date('25/03/24','RR/MM/DD'),to_date('25/03/24','RR/MM/DD'),null,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (10,47,51,'제주 좋음 ',to_date('25/04/03','RR/MM/DD'),to_date('25/04/03','RR/MM/DD'),null,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (37,47,111,'대댓글1111111',to_date('25/04/04','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),36,'Y');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (36,47,111,'테스트 이이삼',to_date('25/04/04','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),null,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (42,47,111,'댓글2',to_date('25/04/04','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),37,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (44,47,92,'너나 가셈',to_date('25/04/04','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),9,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (43,47,111,'댓글3',to_date('25/04/04','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),42,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (45,47,7,'댓글 1111',to_date('25/04/07','RR/MM/DD'),to_date('25/04/07','RR/MM/DD'),null,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (46,47,7,'댓글 22',to_date('25/04/07','RR/MM/DD'),to_date('25/04/07','RR/MM/DD'),null,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (47,47,7,'댓글 3333',to_date('25/04/07','RR/MM/DD'),to_date('25/04/07','RR/MM/DD'),null,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (48,47,7,'대댓글11111',to_date('25/04/07','RR/MM/DD'),to_date('25/04/07','RR/MM/DD'),45,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (49,47,7,'댓글 4444',to_date('25/04/07','RR/MM/DD'),to_date('25/04/07','RR/MM/DD'),null,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (50,47,7,'댓글 555',to_date('25/04/07','RR/MM/DD'),to_date('25/04/07','RR/MM/DD'),null,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (51,47,7,'댓글 666 수정',to_date('25/04/07','RR/MM/DD'),to_date('25/04/07','RR/MM/DD'),null,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (64,47,7,'댓글 5000111',to_date('25/04/07','RR/MM/DD'),to_date('25/04/07','RR/MM/DD'),50,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (73,66,153,'집에 갈래 1!!!',to_date('25/04/10','RR/MM/DD'),to_date('25/04/10','RR/MM/DD'),0,'Y');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (74,66,153,'집가고싶어',to_date('25/04/10','RR/MM/DD'),to_date('25/04/10','RR/MM/DD'),73,'Y');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (75,66,153,'집에...',to_date('25/04/10','RR/MM/DD'),to_date('25/04/10','RR/MM/DD'),74,'Y');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (76,66,154,'집에 보내주셈',to_date('25/04/10','RR/MM/DD'),to_date('25/04/14','RR/MM/DD'),0,'Y');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (77,64,154,'집에 가고싶음',to_date('25/04/10','RR/MM/DD'),to_date('25/04/14','RR/MM/DD'),0,'Y');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (78,84,171,'I was born in Jeju and have been living in Jeju for 30 years. I will help you to bring good memories for you since you said you are interested in Jeju after watching the drama

http://localhost:8080/tours/tour-info.do?tourNo=1684',to_date('25/04/14','RR/MM/DD'),to_date('25/04/14','RR/MM/DD'),0,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (97,63,171,'hi2',to_date('25/04/15','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),96,'Y');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (99,65,194,'대대댓글',to_date('25/04/16','RR/MM/DD'),to_date('25/04/16','RR/MM/DD'),98,'Y');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (3,1,10,'대구 아시는구나?',to_date('25/03/24','RR/MM/DD'),to_date('25/03/24','RR/MM/DD'),null,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (9,47,92,'집에 가자
',to_date('25/04/03','RR/MM/DD'),to_date('25/04/03','RR/MM/DD'),null,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (65,47,7,'댓글 7777',to_date('25/04/07','RR/MM/DD'),to_date('25/04/07','RR/MM/DD'),0,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (66,47,7,'댓글 7-1',to_date('25/04/07','RR/MM/DD'),to_date('25/04/07','RR/MM/DD'),65,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (67,47,7,'댓글 8',to_date('25/04/07','RR/MM/DD'),to_date('25/04/07','RR/MM/DD'),0,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (93,62,1,'안녕하세요 가이드 강재석입니다.

📅 3박 4일 제주 가족 여행 일정
🛬 Day 1: 제주 도착 & 서부 지역 탐방
오전: 김포공항 출발 → 제주공항 도착 → 렌터카 수령 오후:이호테우 해변 산책 협재해변에서 바다 감상 한림공원 방문 (자연 동굴, 식물원 등)
🌄 Day 2: 서귀포 & 동부 지역 탐방
오전:천지연 폭포 관람 여미지 식물원 또는 주상절리대 방문 오후:섭지코지 산책 성산일출봉 정상 등반 (일출 또는 일몰 감상)
🌿 Day 3: 자연 풍경 힐링 루트
오전:사려니숲길 또는 비자림 산책 쇠소깍  오후: 용머리해안 또는 사계해안 드라이브
🛫 Day 4: 제주 시내 투어 및 출발
오전:동문시장 또는 중앙지하상가에서 쇼핑 오후: 숙소 체크아웃 후 렌터카 반납

이 일정을 참고하셔서 가족과 함께 즐거운 제주 여행 되시길 바랍니다!',to_date('25/04/14','RR/MM/DD'),to_date('25/04/14','RR/MM/DD'),0,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (94,62,2,'안녕하세요! 가이드 강재석입니다
📅 Day 1: 해운대 맛집 탐방 및 주변 명소 방문
오전: 해운대 해수욕장 산책 점심: 현지 맛집에서 식사 오후: 해운대 블루라인파크 방문 저녁: 해운대 포장마차촌에서 저녁 식사
📅 Day 2: 주변 명소 탐방 및 미식
오전: 동백섬 산책 점심: 현지 맛집에서 식사 오후: 해운대 마린시티 방문 저녁: 해운대 달맞이길 따라 드라이브 및 야경 감상
이 일정을 통해 해운대의 다양한 맛집과 명소를 즐길 수 있을 것입니다. 즐거운 여행 되시길 바랍니다!​',to_date('25/04/14','RR/MM/DD'),to_date('25/04/14','RR/MM/DD'),0,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (6,13,8,'내가 그 투어 일정 짜서 알려줄게',to_date('25/03/24','RR/MM/DD'),to_date('25/03/24','RR/MM/DD'),null,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (7,13,8,'링크 걸어 줄게',to_date('25/03/24','RR/MM/DD'),to_date('25/03/24','RR/MM/DD'),6,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (8,35,71,'집에 가지 마',to_date('25/04/01','RR/MM/DD'),to_date('25/04/01','RR/MM/DD'),null,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (96,63,171,'hi ',to_date('25/04/15','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),0,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (68,47,7,'수정하겠음 7-1-1',to_date('25/04/07','RR/MM/DD'),to_date('25/04/07','RR/MM/DD'),66,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (13,47,51,'ㄴㄴ 좋을걸 ?',to_date('25/04/04','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),12,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (69,47,7,'7-1-1-1',to_date('25/04/07','RR/MM/DD'),to_date('25/04/07','RR/MM/DD'),68,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (70,47,131,'댓글1
',to_date('25/04/07','RR/MM/DD'),to_date('25/04/07','RR/MM/DD'),0,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (71,47,131,'댓글 222',to_date('25/04/07','RR/MM/DD'),to_date('25/04/07','RR/MM/DD'),70,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (72,47,131,'댓글 2',to_date('25/04/07','RR/MM/DD'),to_date('25/04/07','RR/MM/DD'),0,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (98,65,194,'댓글',to_date('25/04/16','RR/MM/DD'),to_date('25/04/16','RR/MM/DD'),0,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (4,2,4,'오전: 한옥마을 탐방 점심: 전주 한정식 맛보기 오후: 문화 체험 및 산책 저녁: 마을 야경과 저녁 식사 이 일정을 통해 전주 한옥마을의 역사와 문화를 깊이 있게 체험하실 수 있을 것입니다. 즐거운 여행 되시길 바랍니다!​',to_date('25/03/24','RR/MM/DD'),to_date('25/03/24','RR/MM/DD'),null,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (12,47,51,'ㄴㄴ 안좋음',to_date('25/04/03','RR/MM/DD'),to_date('25/04/03','RR/MM/DD'),10,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (95,63,171,'adad',to_date('25/04/15','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),0,'Y');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (100,35,194,'좋은생각이에요 ',to_date('25/04/16','RR/MM/DD'),to_date('25/04/16','RR/MM/DD'),0,'N');
Insert into SYSTEM.REQUEST_COMMENTS (COMMENT_NO,USER_NO,REQUEST_NO,MESSAGE,RQC_CREATED_AT,RQC_UPDATED_AT,PARENT_COMMENT_NO,DELETEYN) values (101,35,194,'좋은생각이에요',to_date('25/04/16','RR/MM/DD'),to_date('25/04/16','RR/MM/DD'),100,'Y');
REM INSERTING into SYSTEM.REQUESTS
SET DEFINE OFF;
Insert into SYSTEM.REQUESTS (REQUEST_NO,USER_NO,TITLE,REGION,BUDGET,STATUS,RQ_CREATED_AT,RQ_UPDATED_AT,CURRENCY) values (192,65,'test','test',200000,'0',to_date('25/04/15','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),'KRW');
Insert into SYSTEM.REQUESTS (REQUEST_NO,USER_NO,TITLE,REGION,BUDGET,STATUS,RQ_CREATED_AT,RQ_UPDATED_AT,CURRENCY) values (171,66,'Inspired by Netflix – I Want to Discover the Real Jeju Island','jeju',360,'1',to_date('25/04/14','RR/MM/DD'),to_date('25/04/14','RR/MM/DD'),'USD');
Insert into SYSTEM.REQUESTS (REQUEST_NO,USER_NO,TITLE,REGION,BUDGET,STATUS,RQ_CREATED_AT,RQ_UPDATED_AT,CURRENCY) values (193,65,'1111','11',200000,'0',to_date('25/04/15','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),'USD');
Insert into SYSTEM.REQUESTS (REQUEST_NO,USER_NO,TITLE,REGION,BUDGET,STATUS,RQ_CREATED_AT,RQ_UPDATED_AT,CURRENCY) values (1,1,'제주도 3박 4일 여행 계획','제주',800000,'1',to_date('25/03/24','RR/MM/DD'),to_date('25/03/24','RR/MM/DD'),'KRW');
Insert into SYSTEM.REQUESTS (REQUEST_NO,USER_NO,TITLE,REGION,BUDGET,STATUS,RQ_CREATED_AT,RQ_UPDATED_AT,CURRENCY) values (2,2,'부산 해운대 맛집 투어','부산',300000,'1',to_date('25/03/24','RR/MM/DD'),to_date('25/03/24','RR/MM/DD'),'KRW');
Insert into SYSTEM.REQUESTS (REQUEST_NO,USER_NO,TITLE,REGION,BUDGET,STATUS,RQ_CREATED_AT,RQ_UPDATED_AT,CURRENCY) values (3,3,'강원도 겨울 여행','강원',600000,'0',to_date('25/03/24','RR/MM/DD'),to_date('25/03/24','RR/MM/DD'),'KRW');
Insert into SYSTEM.REQUESTS (REQUEST_NO,USER_NO,TITLE,REGION,BUDGET,STATUS,RQ_CREATED_AT,RQ_UPDATED_AT,CURRENCY) values (4,4,'전주 한옥마을 당일치기 코스','전북',200000,'1',to_date('25/03/24','RR/MM/DD'),to_date('25/03/24','RR/MM/DD'),'KRW');
Insert into SYSTEM.REQUESTS (REQUEST_NO,USER_NO,TITLE,REGION,BUDGET,STATUS,RQ_CREATED_AT,RQ_UPDATED_AT,CURRENCY) values (5,5,'서울 도보 여행 추천','서울',100000,'0',to_date('25/03/24','RR/MM/DD'),to_date('25/03/24','RR/MM/DD'),'KRW');
Insert into SYSTEM.REQUESTS (REQUEST_NO,USER_NO,TITLE,REGION,BUDGET,STATUS,RQ_CREATED_AT,RQ_UPDATED_AT,CURRENCY) values (6,6,'남해 힐링 여행','경남',500000,'0',to_date('25/03/24','RR/MM/DD'),to_date('25/03/24','RR/MM/DD'),'KRW');
Insert into SYSTEM.REQUESTS (REQUEST_NO,USER_NO,TITLE,REGION,BUDGET,STATUS,RQ_CREATED_AT,RQ_UPDATED_AT,CURRENCY) values (7,7,'경주 문화유적 투어','경북',400000,'1',to_date('25/03/24','RR/MM/DD'),to_date('25/03/24','RR/MM/DD'),'KRW');
Insert into SYSTEM.REQUESTS (REQUEST_NO,USER_NO,TITLE,REGION,BUDGET,STATUS,RQ_CREATED_AT,RQ_UPDATED_AT,CURRENCY) values (8,8,'울릉도 2박 3일 여행','경북',700000,'1',to_date('25/03/24','RR/MM/DD'),to_date('25/03/24','RR/MM/DD'),'KRW');
Insert into SYSTEM.REQUESTS (REQUEST_NO,USER_NO,TITLE,REGION,BUDGET,STATUS,RQ_CREATED_AT,RQ_UPDATED_AT,CURRENCY) values (9,9,'속초와 양양 서핑 여행','강원',500000,'0',to_date('25/03/24','RR/MM/DD'),to_date('25/03/24','RR/MM/DD'),'KRW');
Insert into SYSTEM.REQUESTS (REQUEST_NO,USER_NO,TITLE,REGION,BUDGET,STATUS,RQ_CREATED_AT,RQ_UPDATED_AT,CURRENCY) values (10,10,'대구 핫플 여행','대구',300000,'1',to_date('25/03/24','RR/MM/DD'),to_date('25/03/24','RR/MM/DD'),'KRW');
Insert into SYSTEM.REQUESTS (REQUEST_NO,USER_NO,TITLE,REGION,BUDGET,STATUS,RQ_CREATED_AT,RQ_UPDATED_AT,CURRENCY) values (32,13,'i want go seoul','seoul',100,'0',to_date('25/03/25','RR/MM/DD'),to_date('25/03/25','RR/MM/DD'),'KRW');
Insert into SYSTEM.REQUESTS (REQUEST_NO,USER_NO,TITLE,REGION,BUDGET,STATUS,RQ_CREATED_AT,RQ_UPDATED_AT,CURRENCY) values (194,65,'제주도 여행','제주',40000,'1',to_date('25/04/16','RR/MM/DD'),to_date('25/04/16','RR/MM/DD'),'KRW');
Insert into SYSTEM.REQUESTS (REQUEST_NO,USER_NO,TITLE,REGION,BUDGET,STATUS,RQ_CREATED_AT,RQ_UPDATED_AT,CURRENCY) values (92,47,'여행을 떠나요 ','인천 부평구',3000000,'1',to_date('25/04/03','RR/MM/DD'),to_date('25/04/03','RR/MM/DD'),'USD');
REM INSERTING into SYSTEM.REVIEWS
SET DEFINE OFF;
Insert into SYSTEM.REVIEWS (REVIEW_NO,TOUR_NO,USER_NO,RATING,"COMMENT",R_CREATED_AT,R_UPDATED_AT,TITLE) values (11,1550,2,3,'The tour was well-organized and the guide was very friendly. I learned a lot and had a great time!',to_date('25/04/01','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),null);
Insert into SYSTEM.REVIEWS (REVIEW_NO,TOUR_NO,USER_NO,RATING,"COMMENT",R_CREATED_AT,R_UPDATED_AT,TITLE) values (12,1552,3,5,'Amazing experience! The scenery was beautiful and everything went smoothly.',to_date('25/04/02','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),null);
Insert into SYSTEM.REVIEWS (REVIEW_NO,TOUR_NO,USER_NO,RATING,"COMMENT",R_CREATED_AT,R_UPDATED_AT,TITLE) values (13,1553,4,4,'I was impressed by how knowledgeable the guide was. Highly recommend this tour.',to_date('25/04/03','RR/MM/DD'),to_date('25/04/13','RR/MM/DD'),null);
Insert into SYSTEM.REVIEWS (REVIEW_NO,TOUR_NO,USER_NO,RATING,"COMMENT",R_CREATED_AT,R_UPDATED_AT,TITLE) values (14,1554,5,5,'An unforgettable journey. Perfect for nature lovers and history buffs alike!',to_date('25/04/04','RR/MM/DD'),to_date('25/04/14','RR/MM/DD'),null);
Insert into SYSTEM.REVIEWS (REVIEW_NO,TOUR_NO,USER_NO,RATING,"COMMENT",R_CREATED_AT,R_UPDATED_AT,TITLE) values (15,1556,6,3,'The pace was comfortable, and the group size was just right. Loved the local food too.',to_date('25/04/05','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),null);
Insert into SYSTEM.REVIEWS (REVIEW_NO,TOUR_NO,USER_NO,RATING,"COMMENT",R_CREATED_AT,R_UPDATED_AT,TITLE) values (16,1557,7,4,'A relaxing and insightful tour. I especially enjoyed the storytelling from the guide.',to_date('25/04/06','RR/MM/DD'),to_date('25/04/16','RR/MM/DD'),null);
Insert into SYSTEM.REVIEWS (REVIEW_NO,TOUR_NO,USER_NO,RATING,"COMMENT",R_CREATED_AT,R_UPDATED_AT,TITLE) values (17,1559,8,3,'Everything from pickup to drop-off was perfectly handled. A must-do if you visit the area.',to_date('25/04/07','RR/MM/DD'),to_date('25/04/17','RR/MM/DD'),null);
Insert into SYSTEM.REVIEWS (REVIEW_NO,TOUR_NO,USER_NO,RATING,"COMMENT",R_CREATED_AT,R_UPDATED_AT,TITLE) values (18,1563,9,5,'Great value for money. I discovered hidden gems I wouldn''t have found on my own.',to_date('25/04/08','RR/MM/DD'),to_date('25/04/18','RR/MM/DD'),null);
Insert into SYSTEM.REVIEWS (REVIEW_NO,TOUR_NO,USER_NO,RATING,"COMMENT",R_CREATED_AT,R_UPDATED_AT,TITLE) values (19,1564,10,4,'The guide created a very friendly atmosphere. Felt like traveling with friends.',to_date('25/04/09','RR/MM/DD'),to_date('25/04/19','RR/MM/DD'),null);
Insert into SYSTEM.REVIEWS (REVIEW_NO,TOUR_NO,USER_NO,RATING,"COMMENT",R_CREATED_AT,R_UPDATED_AT,TITLE) values (67,1549,21,5,'광화문, 경복궁이랑 가까워서 편했어요! 가격도 엄청 저렴해요. 머리 장식은 3가지 스타일로 가능한데(5천원 추가) 꼭 하는 것을 추천합니다! 한복 퀄리티 너무 좋아서 아주 만족스러웠어요. 사진 찍고 돌아다니려면 4시간은 넉넉하게 잡아야 합니다.',to_date('25/04/14','RR/MM/DD'),to_date('25/04/14','RR/MM/DD'),'경복궁 투어 후기');
Insert into SYSTEM.REVIEWS (REVIEW_NO,TOUR_NO,USER_NO,RATING,"COMMENT",R_CREATED_AT,R_UPDATED_AT,TITLE) values (86,1684,65,5,'좋아요',to_date('25/04/15','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),null);
REM INSERTING into SYSTEM.TERMS
SET DEFINE OFF;
Insert into SYSTEM.TERMS (TERMS_ID,TITLE,TE_UPDATED_AT) values (1,'마케팅 정보 수신 동의',to_date('25/04/08','RR/MM/DD'));
Insert into SYSTEM.TERMS (TERMS_ID,TITLE,TE_UPDATED_AT) values (3,'이용약관',to_date('25/04/08','RR/MM/DD'));
Insert into SYSTEM.TERMS (TERMS_ID,TITLE,TE_UPDATED_AT) values (2,'개인정보 수집 및 이용 동의',to_date('25/04/08','RR/MM/DD'));
REM INSERTING into SYSTEM.THEME
SET DEFINE OFF;
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (509,'인상적인',500);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (100,'고요한 테마',null);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (101,'차분한',100);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (102,'평온한',100);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (103,'잔잔한',100);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (104,'느긋한',100);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (105,'온화한',100);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (106,'편안한',100);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (107,'아늑한',100);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (108,'부드러운',100);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (109,'조용한',100);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (200,'짜릿한 테마',null);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (201,'스릴 넘치는',200);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (202,'도전적인',200);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (203,'강렬한',200);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (204,'에너제틱한',200);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (205,'파워풀한',200);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (206,'격렬한',200);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (207,'흥분되는',200);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (208,'터프한',200);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (209,'극한의',200);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (300,'감성적인 테마',null);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (301,'설레는',300);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (302,'로맨틱한',300);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (303,'몽환적인',300);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (304,'감미로운',300);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (305,'잔잔한',300);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (306,'매혹적인',300);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (307,'사랑스러운',300);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (308,'달콤한',300);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (309,'포근한',300);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (400,'활기찬 테마',null);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (401,'신나는',400);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (402,'유쾌한',400);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (403,'흥겨운',400);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (404,'짜릿한',400);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (405,'활기찬',400);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (406,'경쾌한',400);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (407,'즐거운',400);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (408,'상쾌한',400);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (409,'통쾌한',400);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (500,'경이로운 테마',null);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (501,'감동적인',500);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (502,'웅장한',500);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (503,'압도적인',500);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (504,'몽환적인',500);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (505,'찬란한',500);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (506,'눈부신',500);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (507,'황홀한',500);
Insert into SYSTEM.THEME (THEME_NO,THEME_NAME,THEME_PARENT_NO) values (508,'심오한',500);
REM INSERTING into SYSTEM.TOURS
SET DEFINE OFF;
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1549,50,'경복궁 한복남 한복 체험 & 헤어 스타일링','오후',56300,4,to_date('25/04/19','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'N',11,10,302,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1550,16,'서울 시티투어 버스(도심고궁남산 코스)','종일',25000,4,to_date('25/04/24','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'N',11,10,301,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1603,35,'스타벅스 DMZ 북한 전망대 & 현대아울렛','오전',80000,4,to_date('25/04/27','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',31,230,503,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1684,50,'Jone Doh를 위한 맞춤 제주 여행','종일',300000,4,to_date('25/04/01','RR/MM/DD'),to_date('25/04/14','RR/MM/DD'),to_date('25/04/14','RR/MM/DD'),'Y',39,10,304,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1578,50,'제주 한국 문화 체험: 한복 & 교복 렌탈, K-뷰티 & 촬영','오후',48000,4,to_date('25/04/17','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'Y',39,10,309,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1574,50,'제주 아르떼뮤지엄 투어','오후',13000,4,to_date('25/05/02','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'N',39,10,504,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1597,49,'아침고요수목원 + 레고랜드 또는 홍천 루지월드','종일',110000,4,to_date('25/04/30','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',32,10,401,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1602,16,'꽃 장식 인삼 정과 만들기 쿠킹 클래스','오후',198900,4,to_date('25/04/22','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',21,50,308,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1609,16,'2025 일산국제꽃박람회 반나절 투어','오후',69300,4,to_date('25/04/27','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',31,100,401,'COMPANY');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1612,3,'프리다이빙 체험','종일',70000,4,to_date('25/05/05','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',22,70,402,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1620,16,'보성 녹차밭 & 순천만국가정원[기차+버스]','종일',497300,4,to_date('25/05/10','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',36,360,103,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1627,3,'사진작가 & 역사학자와 함께하는 서울 레트로 도보 투어','종일',43800,4,to_date('25/05/15','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',11,10,101,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1628,49,'서울에서 즐기는 사우나, 바디 스크럽 & 마사지','오후',120000,4,to_date('25/04/11','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'Y',11,130,408,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1568,3,'부산 나이트 투어 - 송도 케이블카 & 더베이 101 & 광안리 해변 & 영도 수변공원','오후',32000,4,to_date('25/04/18','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'N',21,140,101,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1575,50,'케이팝 아이돌 헤어 & 메이크업 & 퍼스널 컬러진단','오전',210000,4,to_date('25/04/28','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'N',11,230,301,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1582,41,'부산 진짜배기 투어','종일',45900,4,to_date('25/04/24','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',21,90,406,'COMPANY');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1595,41,'DMZ 2터널 + 한탄강 하늘다리','종일',114300,4,to_date('25/04/28','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',32,360,509,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1618,41,'여용국 한방 스파 트리트먼트','오전',198000,4,to_date('25/05/09','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',11,240,507,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1622,3,'전주 한옥마을 문화 체험 프라이빗 일일 투어','종일',28900,4,to_date('25/05/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',35,10,407,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1633,3,'제주도 스쿠버 다이빙 체험','오후',69000,4,to_date('25/04/24','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',39,20,408,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1606,49,'서울 출발 부천 봄꽃 투어: 벚꽃과 진달래 향연','종일',105600,4,to_date('25/05/04','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',31,50,308,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1624,3,'서울 세계문화유산 투어','종일',100900,4,to_date('25/05/14','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',11,10,502,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1591,49,'부산 벚꽃 랜덤 투어','종일',66700,4,to_date('25/04/21','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',21,150,303,'COMPANY');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1635,3,'제주 무지개 요트 투어','오전',50000,4,to_date('25/04/20','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',39,10,408,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1564,50,'제주 9.81 파크 풀패키지 투어 ','종일',53000,4,to_date('25/04/27','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'N',39,10,201,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1552,50,'전통 한옥 마당에서 즐기는 김치 만들기 체험 & 한국 바비큐','종일',70000,4,to_date('25/04/23','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'Y',11,10,509,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1580,50,'수원 화성 투어','종일',137000,4,to_date('25/04/26','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'N',31,10,301,'COMPANY');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1572,50,'제주의 바다를 그대로 옮긴 듯한 제주 아쿠아 플라넷 제주 투어 ','종일',36000,4,to_date('25/04/25','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'N',39,20,502,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1689,50,'서울 난타 공연','오후',50000,4,to_date('25/04/29','RR/MM/DD'),to_date('25/04/14','RR/MM/DD'),to_date('25/04/14','RR/MM/DD'),'N',11,20,205,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1563,49,'경복궁 투어 ( + 한복 대여 )','오후',20000,4,to_date('25/04/24','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'N',11,10,504,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1576,35,'한강 세빛섬 요트 투어','오후',36000,4,to_date('25/04/24','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'N',11,220,305,'COMPANY');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1579,50,'N서울타워 전망대 투어','오후',20000,4,to_date('25/05/07','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'N',11,30,305,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1698,16,'test','오전',11,4,to_date('25/04/15','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),'N',32,340,101,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1592,3,'부산 프리미엄 요트 투어 (반려견 동반 가능)','종일',35000,4,to_date('25/04/26','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',21,90,204,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1554,35,'한복 대여 & 사진 촬영 체험 (그날 그 한복)','오후',20000,4,to_date('25/04/30','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'N',11,10,302,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1569,35,'부산 원데이 투어','종일',63000,4,to_date('25/04/19','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'N',21,30,101,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1573,49,'제주 카멜리아 힐 ','오전',10000,4,to_date('25/04/26','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'N',39,20,307,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1607,50,'서울 하이킹: 북한산 국립공원','종일',99500,4,to_date('25/05/04','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',31,100,408,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1601,35,'양양 물치해변 서프살롱 서핑 강습 & 대여','오전',57000,4,to_date('25/04/22','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',32,340,201,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1619,35,'충북 단양 패러글라이딩 명소, 카페산에서 즐기는 세계적인 패러글라이딩','오후',110000,4,to_date('25/05/09','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',33,380,202,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1626,35,'서울 벚꽃 & 한옥 체험 | 프라이빗 차량 투어','종일',203200,4,to_date('25/04/16','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',11,120,104,'COMPANY');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1632,3,'제주 바다낚시 투어 (점심 식사 포함) | 잊지 못할 제주 낚시 체험','종일',227600,4,to_date('25/04/21','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',39,20,409,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1631,16,'제주 ATV 사륜 오토바이 체험','오전',28800,4,to_date('25/04/15','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',39,20,404,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1634,3,'제주 벚꽃 & 해녀 공연 소규모 단체 일일 투어','종일',132800,4,to_date('25/04/15','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',39,20,504,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1614,3,'레트로 클래식 음악감상실 감성 여행','오전',8000,4,to_date('25/05/07','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',22,10,108,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1611,41,'남이섬 가평탑랜드 번지점프 체험','오전',30000,4,to_date('25/04/18','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',31,370,209,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1617,49,'한국 민화 그리기 원데이 클래스','오후',80000,4,to_date('25/05/08','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',22,40,101,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1548,50,'서울 난타 공연','오후',50000,4,to_date('25/04/13','RR/MM/DD'),to_date('25/04/14','RR/MM/DD'),to_date('25/04/14','RR/MM/DD'),'Y',11,20,205,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1581,49,'감천문화마을 사진첩 만들기 원데이 클래스','오전',14000,4,to_date('25/04/23','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',21,100,301,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1590,41,'부산 벚꽃 명소 & 주요 관광지 투어','종일',68400,4,to_date('25/04/20','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',21,30,407,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1594,3,'부산 프라이빗 택시 투어','종일',310800,4,to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',21,30,104,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1599,3,'자갈치 해수탕: 전통 한국식 해수 바스 체험','오후',10000,4,to_date('25/05/01','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',21,10,107,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1600,3,'부산 조향 원데이클래스','오전',64700,4,to_date('25/05/01','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',21,70,306,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1605,41,'서울 출발 가평 사계절 당일 투어','종일',94600,4,to_date('25/05/03','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',31,370,406,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1608,35,'서울 출발 수원 화성 + 스타필드 + 와우정사 투어','종일',60000,4,to_date('25/05/04','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',31,10,509,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1553,16,'창덕궁 한복 대여 by Dorothy Hanbok','오후',20000,4,to_date('25/04/18','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'Y',11,10,307,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1570,50,'서울  K - 헤어스타일링 & 메이크업','오전',230000,4,to_date('25/04/24','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'N',11,230,302,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1596,3,'경주 프라이빗 투어 & 부산 야경 투어 + 점심 식사','종일',142100,4,to_date('25/04/29','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',37,20,502,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1598,3,'부산 나흠화방에서 한국 전통 예술 체험','오전',56300,4,to_date('25/04/30','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',21,50,403,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1604,16,'서울 출발 수원 화성 투어','종일',140700,4,to_date('25/05/02','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',31,240,509,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1613,16,'보성 & 강진 녹차 체험 일일 투어 (광주 출발)','종일',250000,4,to_date('25/05/06','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',36,360,109,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1610,41,'양평 패러글라이딩 체험','오후',160000,4,to_date('25/04/23','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',31,380,201,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1615,3,'3D 프린터 테라리움 원데이 클래스 (DIY 키트 배송 가능)','오후',30000,4,to_date('25/05/07','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',22,60,106,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1616,49,'나만의 라탄트레이 만들기 원데이 클래스 (DIY키트 배송가능)','오전',60000,4,to_date('25/05/08','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',22,60,103,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1623,3,'석정온천 휴스파 스파 & 온천 체험','오후',30000,4,to_date('25/05/13','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',35,370,106,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1621,3,'전주 한옥마을 한복체험 & 사진촬영','오전',187500,4,to_date('25/05/11','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',35,10,501,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1625,50,'전문 패션 스타일리스트와 함께 하는 쇼핑 투어','오전',168800,4,to_date('25/05/13','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',11,230,401,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1630,41,'나만의 특별한 막걸리 만들기 체험','오전',106300,4,to_date('25/04/17','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'Y',11,140,402,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1629,3,'제주 향수 박물관 원데이 클래스','오후',40000,4,to_date('25/04/18','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',39,20,106,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1583,3,'포항 스페이스 워크 & 벚꽃, 구룡포, 호미곶 유채꽃','종일',107770,4,to_date('25/04/25','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'N',21,80,307,'GUIDE');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1556,50,'롯데월드 ( + 교복 대여 )','종일',80000,4,to_date('25/04/30','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'N',11,240,201,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1557,50,'성수 셀프 조향 클래스','오후',50000,4,to_date('25/04/18','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'N',11,50,306,'PUBLIC');
Insert into SYSTEM.TOURS (TOUR_NO,GUIDE_NO,TITLE,DURATION,PRICE,MAX_PEOPLE,TOUR_DATE,T_CREATED_AT,T_UPDATED_AT,DELETEYN,SI_NO,GU_NO,THEME_NO,VEHICLE) values (1559,50,'코엑스 아쿠아리움 투어','오전',28000,4,to_date('25/04/10','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'Y',11,230,508,'PUBLIC');
REM INSERTING into SYSTEM.USERS
SET DEFINE OFF;
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (83,'$2a$10$C7koey1V//wdc/qgqGIKgus/uv1un2zJxaMNr7OC735HHERxkMRTG','js@naver.com','01022222222','GUIDE',to_date('25/04/09','RR/MM/DD'),'미추홀구','F',to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'강재석',null,null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (35,'$2a$10$6D4g8P7DzuvSN0HOrqPvB.ClHKYq3slX5GNUNNQQLbkPVJKgYnsB2','admin','01012345678','ADMIN',to_date('25/04/04','RR/MM/DD'),'인천광역시 부평구','M',to_date('25/03/26','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),'관리자',null,null,'N','N','N',to_date('25/04/16','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (47,'$2a$10$jZZkX2EMdJuMFPkuzACpqudVo4sihv84JM8nzACzSSLvLEVRE7HRu','al','01099999999','ADMIN',to_date('95/01/22','RR/MM/DD'),null,'M',to_date('25/03/27','RR/MM/DD'),to_date('25/04/09','RR/MM/DD'),'관리자','관리자',null,'Y','N','N',to_date('25/04/15','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (62,'$2a$10$5Ysy2bwV5oqrLXtu7fa0bOuV.b5SwfhJSyZGXaX2GxkyTNuQX4ikS','kjsbest007@gmail.com','01023294146','GUIDE',to_date('98/12/20','RR/MM/DD'),null,'M',to_date('25/04/07','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),'강재석',null,null,'N','Y','N',to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (65,'$2a$10$DNRsAHZsFEHvSFrW6W/4K.MV07GKJpqDdU/XTRkAiuLaKHWMpvHAm','abcd','01012345678','TOURIST',to_date('82/12/22','RR/MM/DD'),'전라 south도','M',to_date('25/04/08','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),'smith','coco',null,'Y','Y','N',to_date('25/04/16','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (67,'$2a$10$FKN80GEnwCDCDYp7uP3jz.H43KXfw05GuoHMW6bQhaCD3uCfjegT2','강재석','강재석','GUIDE',to_date('25/04/09','RR/MM/DD'),'강재석','M',to_date('25/04/09','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),'강재석',null,null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (69,'Test1234!','gggeon22@gmail.com','010-1234-1234','TOURIST',null,null,null,to_date('25/04/10','RR/MM/DD'),to_date('25/04/10','RR/MM/DD'),'박건형','N/A','SOCIAL','Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (70,'Test1234!','gggeon22@twitter.com','010-1234-1234','TOURIST',null,null,null,to_date('25/04/10','RR/MM/DD'),to_date('25/04/10','RR/MM/DD'),'박건형','N/A','SOCIAL','Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (93,'$2a$10$TooxCMNst8CrbNFoAc3yMOMSA3x.Wu9uwDtjoxH9oP7uIlscFbrpe','leejh8997@gmail.com','010-1234-1234','GUIDE',null,null,null,to_date('25/04/15','RR/MM/DD'),to_date('25/04/16','RR/MM/DD'),'이재형','N/A','SOCIAL','Y','N','N',to_date('25/04/15','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (1,'1234','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),'Seoul, Korea','M',to_date('25/03/20','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (2,'securepassword456','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),'Busan, Korea','M',to_date('25/03/20','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (3,'mypassword789','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),'Jeju, Korea','M',to_date('25/03/20','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (4,'password987','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),'Gyeongju, Korea','M',to_date('25/03/20','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (5,'mypassword111','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),'Gangwon, Korea','M',to_date('25/03/20','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (6,'secure1234','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),'Incheon, Korea','M',to_date('25/03/20','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (7,'password5678','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),'Daegu, Korea','M',to_date('25/03/20','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (8,'strongpassword222','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),'Seoul, Korea','M',to_date('25/03/20','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (9,'securepassword333','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),'Busan, Korea','M',to_date('25/03/20','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (10,'mypassword444','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),'Jeju, Korea','M',to_date('25/03/20','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (11,'$2a$10$5DZU9Mkv8U45alWz7WpYKO8rl0mt8/TWOOFqb8PDoIDrU7.AL2xou','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),'서울특별시 강남구','M',to_date('25/03/20','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (12,'$2a$10$NLjBjmhsiPzq4R/aYWSwTe2PKJKj9LzJ5v9E2NRSHZy5txMTo9V3y','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),'부산광역시 해운대구','M',to_date('25/03/20','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (13,'$2a$10$qcQGgbi5t.HKJAX1fEsQ1uQrhJNdwU389V8sU0IFdgSJbQMtp8RJ2','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),'대구광역시 달서구','M',to_date('25/03/20','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (14,'$2a$10$ncqRf34ETQfo5SwR9bb61.R.i.3lVLVxKnpZ6LBQWm4VKfOluC0GG','w','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),'인천광역시 연수구','M',to_date('25/03/20','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (15,'$2a$10$WTj85fZmhvEkIor0IK45yegeXDK1/36mkewl9cOSzVf5bxPLOgw/C','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),'대전광역시 유성구','M',to_date('25/03/20','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (16,'$2a$10$99xlNRk77d0qWd9YcNB5T.WFpbaR5ai3QQJpRWhf7h1pv7WbyAdhi','g@naver.com','0102222222','GUIDE',to_date('95/01/22','RR/MM/DD'),'경기도 수원시','F',to_date('25/03/20','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),'미진','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (17,'$2a$10$j6FYkyR4Zq713R6kdJS1GeNEtaL5rhI9IFjWjl0CjX1wdosZYKcV6','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),'서울특별시 종로구','M',to_date('25/03/20','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (18,'$2a$10$XgE7rb3Hnh0oDvIDpze.guSgkZ/M7.3t6lC1HDZ.4XvC3FfR5pVUW','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),'부산광역시 남구','M',to_date('25/03/20','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (19,'$2a$10$9TZP77UqsinY2HgkkNtVaePOZTmFuhiaE9IMnJWJBCx1bnQgKewg2','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),'경기도 고양시','M',to_date('25/03/20','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (20,'$2a$10$mdLLoee9Fl1QvSVgBmzCYOychHMqK3O3/a8lBCH/7T.mCTwMlSunq','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),'서울특별시 마포구','M',to_date('25/03/20','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (36,'$2a$10$XXS0788Gz5GR4nkOO55UZeWt3UXvBGrnS38nxKlG9tFKQmpBQiYD2','k@naver.com','0102222222','ADMIN',to_date('95/01/22','RR/MM/DD'),null,'M',to_date('25/03/26','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (84,'$2a$10$rk4vN77/0WLoYCEmlpBetOaPLm0z2/bzBj1EQZTWvXh8dkKbpqNDW','gs','01099999999','GUIDE',to_date('92/12/18','RR/MM/DD'),null,'M',to_date('25/04/11','RR/MM/DD'),to_date('25/04/12','RR/MM/DD'),'가이드','Lee',null,'N','N','N',to_date('25/04/15','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (91,'Test1234!','taehun1218@gmail.com','010-1234-1234','TOURIST',null,null,null,to_date('25/04/15','RR/MM/DD'),to_date('25/04/15','RR/MM/DD'),'태훈','N/A','SOCIAL','Y','N','N',to_date('25/04/15','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (59,'$2a$10$BiLEnuM3HoDANTBHpOKMv.V9EPKsDoEKVVkrixq/O5GYmLdvAthyC','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),null,'M',to_date('25/04/01','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (21,'$2a$10$tzEEr5cXHr1LZywLdoz7PeEcIc//8Ygg2q1lmFtEqcKRPi8xGRCsm','jsk@naver.com','01022222222','GUIDE',to_date('10/04/15','RR/MM/DD'),'서울특별시 강남구','M',to_date('25/04/11','RR/MM/DD'),to_date('25/04/11','RR/MM/DD'),'재','석',null,'Y','N','N',to_date('25/04/16','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (55,'$2a$10$rMVfAjuVAziMlhdXXSoy5ec.2IvFInX4Bvjdx6fXKVkEzfXlza9Ky','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),'ㅗㅗ','M',to_date('25/03/28','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),'건','형','SOCIAL','Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (56,'$2a$10$TtNCSwygzjaQ9XVUUJpuq.aPFdWmshKQHhlHTFwy7K6Ez57obSnsW','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),null,'M',to_date('25/03/31','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (54,'$2a$10$rCysOeOLR8CeGCanMvDTp.UdM57/wre8SoZCdNt3BDsbkOsw6rSWu','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),null,'M',to_date('25/03/28','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (85,'$2a$10$6D4g8P7DzuvSN0HOrqPvB.ClHKYq3slX5GNUNNQQLbkPVJKgYnsB2','ijaehyeong42054@twitter.com','01012341234','TOURIST',null,null,'M',to_date('25/04/14','RR/MM/DD'),to_date('25/04/14','RR/MM/DD'),'이재형','N/A','SOCIAL','Y','N','N',to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (86,'$2a$10$/xs.szMC8aDnKCGx9W8GHu7WvIoADvcDGxXT6Po/2Uh4AOXgRffly','abcdefg@naver.com','01028282828','TOURIST',to_date('95/09/22','RR/MM/DD'),null,'M',to_date('25/04/14','RR/MM/DD'),to_date('25/04/14','RR/MM/DD'),'jone','park',null,'Y','Y','N',to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (63,'$2a$10$smu7WQu7ueHmC/1SW8VePOEMuXSDr99Zk2Kcta68NJHVsKJTQCPSa','a@naver.com','0103933333','GUIDE',to_date('92/02/01','RR/MM/DD'),null,'M',to_date('25/04/07','RR/MM/DD'),to_date('25/04/16','RR/MM/DD'),'건형','민지',null,'N','N','N',to_date('25/04/16','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (60,'$2a$10$TSDS/U3IoJgsjRfFFO3O9eA9OsgIuDhY6u/nBgxPPtBa.YaIWN8Wa','g@naver.com','0102222222','TOURIST',to_date('95/01/22','RR/MM/DD'),null,'M',to_date('25/04/04','RR/MM/DD'),to_date('25/04/04','RR/MM/DD'),'건','형',null,'Y','N','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (64,'$2a$10$PXm/jdYHIBRBplL5mhd8FeWyGGG8B92qIoGZkqTrcEz6.yXc.jl1C','gl','01092341232','GUIDE',to_date('92/12/18','RR/MM/DD'),null,'M',to_date('25/04/08','RR/MM/DD'),to_date('25/04/08','RR/MM/DD'),'재형','이',null,'N','Y','N',to_date('25/04/11','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (66,'$2a$10$5VnOaNYME1GQRDMResh0POdtygmDgzCIp6VGUNtSqyFdEda4EG6rq','tl','01092341232','TOURIST',to_date('92/12/18','RR/MM/DD'),null,'M',to_date('25/04/09','RR/MM/DD'),to_date('25/04/09','RR/MM/DD'),'Jone','Do',null,'Y','N','N',to_date('25/04/15','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (95,'$2a$10$VB881vyfofaWUZvNtky6xexc8a6VNheABqHgMFC7nB9rxD7IaDazm','ooo17o@naver.com','01082503501','TOURIST',to_date('95/09/22','RR/MM/DD'),null,'M',to_date('25/04/16','RR/MM/DD'),to_date('25/04/16','RR/MM/DD'),'park','geonhyung',null,'Y','Y','N',to_date('25/04/16','RR/MM/DD'));
Insert into SYSTEM.USERS (USER_NO,PASSWORD,EMAIL,PHONE,ROLE,BIRTHDAY,ADDRESS,GENDER,U_CREATED_AT,U_UPDATED_AT,USER_FIRSTNAME,USER_LASTNAME,SOCIAL_TYPE,ISFOREIGNER,PUSHYN,UNREGISTERYN,LAST_LOGIN) values (98,'$2a$10$jwHE1zTu7vxuHMukewL08u0C125CNR2d2ntzTTb7FmudHai7xh8lG','chelee24@naver.com','01089971472','TOURIST',to_date('94/06/09','RR/MM/DD'),'인천광역시 부평구','M',to_date('25/04/16','RR/MM/DD'),to_date('25/04/16','RR/MM/DD'),'이재형형',null,null,'N','N','Y',to_date('25/04/16','RR/MM/DD'));
REM INSERTING into SYSTEM.WISHLIST
SET DEFINE OFF;
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1,12,36,to_date('25/04/10','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1553,50,62,to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1594,3,85,to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (8,12,36,to_date('25/04/10','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1559,50,62,to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1564,50,93,to_date('25/04/15','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1557,50,93,to_date('25/04/15','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1552,50,93,to_date('25/04/15','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1549,50,96,to_date('25/04/16','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (3,12,36,to_date('25/04/10','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (6,12,36,to_date('25/04/10','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (4,12,62,to_date('25/04/10','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (5,12,36,to_date('25/04/10','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1570,50,62,to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1563,50,84,to_date('25/04/12','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1552,50,98,to_date('25/04/16','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1,12,47,to_date('25/04/08','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1549,50,62,to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (2,12,47,to_date('25/04/08','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (2,12,65,to_date('25/04/10','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (8,12,65,to_date('25/04/10','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (3,12,62,to_date('25/04/10','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (2,12,62,to_date('25/04/10','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1552,50,62,to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1556,50,62,to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1573,50,62,to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1574,50,62,to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1576,50,62,to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1548,50,62,to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (59,1,65,to_date('25/04/08','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1575,50,84,to_date('25/04/12','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1557,50,62,to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1550,50,62,to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1563,50,62,to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1575,50,62,to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1568,3,65,to_date('25/04/15','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (2,12,36,to_date('25/04/10','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1554,50,62,to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1,12,62,to_date('25/04/10','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (8,12,62,to_date('25/04/10','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1568,3,62,to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1564,50,62,to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1569,3,62,to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1572,50,62,to_date('25/04/14','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1569,35,96,to_date('25/04/16','RR/MM/DD'));
Insert into SYSTEM.WISHLIST (TOUR_NO,GUIDE_NO,USER_NO,W_CREATED_AT) values (1688,50,85,to_date('25/04/14','RR/MM/DD'));
--------------------------------------------------------
--  DDL for Index ADMIN_LOGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."ADMIN_LOGS_PK" ON "SYSTEM"."ADMIN_LOGS" ("LOG_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BASKET_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."BASKET_PK" ON "SYSTEM"."BASKET" ("BASKET_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BOOKINGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."BOOKINGS_PK" ON "SYSTEM"."BOOKINGS" ("BOOKING_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GUIDE_IMG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."GUIDE_IMG_PK" ON "SYSTEM"."GUIDE_IMG" ("P_FILE_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GUIDE_SCHEDULES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."GUIDE_SCHEDULES_PK" ON "SYSTEM"."GUIDE_SCHEDULES" ("SCHEDULE_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GUIDES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."GUIDES_PK" ON "SYSTEM"."GUIDES" ("GUIDE_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index INQUIRIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."INQUIRIES_PK" ON "SYSTEM"."INQUIRIES" ("INQUIRY_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index NOTICES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."NOTICES_PK" ON "SYSTEM"."NOTICES" ("NOTICE_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C006607
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C006607" ON "SYSTEM"."PARTNERSHIP" ("PARTNERSHIP_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PAYMENTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PAYMENTS_PK" ON "SYSTEM"."PAYMENTS" ("PAYMENT_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PROMOTIONS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PROMOTIONS_PK" ON "SYSTEM"."PROMOTIONS" ("PROMO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index REQUESTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REQUESTS_PK" ON "SYSTEM"."REQUESTS" ("REQUEST_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C006597
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C006597" ON "SYSTEM"."TERMS" ("TERMS_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index USERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."USERS_PK" ON "SYSTEM"."USERS" ("USER_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ADMIN_LOGS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ADMIN_LOGS" MODIFY ("LOG_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ADMIN_LOGS" ADD CONSTRAINT "ADMIN_LOGS_PK" PRIMARY KEY ("LOG_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SYSTEM"."ADMIN_LOGS" MODIFY ("USER_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BASKET
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."BASKET" MODIFY ("BASKET_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."BASKET" MODIFY ("TOUR_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."BASKET" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."BASKET" ADD CONSTRAINT "BASKET_PK" PRIMARY KEY ("BASKET_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SYSTEM"."BASKET" MODIFY ("NUM_PEOPLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOOKINGS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."BOOKINGS" MODIFY ("BOOKING_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."BOOKINGS" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."BOOKINGS" MODIFY ("TOUR_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."BOOKINGS" MODIFY ("BOOKING_DATE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."BOOKINGS" MODIFY ("TOTAL_PRICE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."BOOKINGS" ADD CONSTRAINT "BOOKINGS_PK" PRIMARY KEY ("BOOKING_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SYSTEM"."BOOKINGS" MODIFY ("PEOPLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FAQ
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."FAQ" MODIFY ("FAQ_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."FAQ" MODIFY ("QUESTION" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."FAQ" MODIFY ("ANSWER" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."FAQ" MODIFY ("CATEGORY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GUIDE_IMG
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."GUIDE_IMG" MODIFY ("P_FILE_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."GUIDE_IMG" MODIFY ("P_GUIDE_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."GUIDE_IMG" MODIFY ("P_FILE_PATH" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."GUIDE_IMG" MODIFY ("P_FILE_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."GUIDE_IMG" MODIFY ("P_UPLOAD_DATE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."GUIDE_IMG" MODIFY ("P_FILE_SIZE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."GUIDE_IMG" ADD CONSTRAINT "GUIDE_IMG_PK" PRIMARY KEY ("P_FILE_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table GUIDE_SCHEDULES
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."GUIDE_SCHEDULES" MODIFY ("SCHEDULE_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."GUIDE_SCHEDULES" MODIFY ("GUIDE_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."GUIDE_SCHEDULES" MODIFY ("TOUR_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."GUIDE_SCHEDULES" MODIFY ("SCHEDULE_DATE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."GUIDE_SCHEDULES" ADD CONSTRAINT "GUIDE_SCHEDULES_PK" PRIMARY KEY ("SCHEDULE_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table GUIDES
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."GUIDES" MODIFY ("GUIDE_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."GUIDES" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."GUIDES" ADD CONSTRAINT "GUIDES_PK" PRIMARY KEY ("GUIDE_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table IMG
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."IMG" MODIFY ("FILE_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."IMG" MODIFY ("FILE_PATH" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."IMG" MODIFY ("FILE_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."IMG" MODIFY ("I_UPLOAD_DATE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."IMG" MODIFY ("THUMBNAIL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table INQUIRIES
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."INQUIRIES" MODIFY ("QNA_TITLE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."INQUIRIES" ADD CONSTRAINT "INQUIRIES_PK" PRIMARY KEY ("INQUIRY_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SYSTEM"."INQUIRIES" MODIFY ("INQUIRY_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."INQUIRIES" MODIFY ("USER_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NOTICES
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."NOTICES" MODIFY ("NOTICE_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."NOTICES" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."NOTICES" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."NOTICES" ADD CONSTRAINT "NOTICES_PK" PRIMARY KEY ("NOTICE_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PARTNERSHIP
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."PARTNERSHIP" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PARTNERSHIP" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PARTNERSHIP" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PARTNERSHIP" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PARTNERSHIP" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PARTNERSHIP" ADD PRIMARY KEY ("PARTNERSHIP_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PAYMENTS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."PAYMENTS" MODIFY ("PAYMENT_DATE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PAYMENTS" MODIFY ("MERCHANT_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PAYMENTS" ADD CONSTRAINT "PAYMENTS_PK" PRIMARY KEY ("PAYMENT_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SYSTEM"."PAYMENTS" MODIFY ("PAYMENT_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PAYMENTS" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PAYMENTS" MODIFY ("TOUR_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PAYMENTS" MODIFY ("AMOUNT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PAYMENTS" MODIFY ("PAYMENT_STATUS" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PAYMENTS" MODIFY ("METHOD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROMOTIONS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."PROMOTIONS" MODIFY ("PROMO_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PROMOTIONS" MODIFY ("CODE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PROMOTIONS" MODIFY ("EXPIRY_DATE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PROMOTIONS" ADD CONSTRAINT "PROMOTIONS_PK" PRIMARY KEY ("PROMO_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REGION
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REGION" MODIFY ("SI_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REGION" MODIFY ("SI_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REQUEST_COMMENTS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REQUEST_COMMENTS" MODIFY ("COMMENT_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REQUEST_COMMENTS" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REQUEST_COMMENTS" MODIFY ("REQUEST_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REQUEST_COMMENTS" MODIFY ("DELETEYN" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REQUEST_COMMENTS" MODIFY ("MESSAGE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REQUESTS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REQUESTS" MODIFY ("REQUEST_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REQUESTS" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REQUESTS" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REQUESTS" ADD CONSTRAINT "REQUESTS_PK" PRIMARY KEY ("REQUEST_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REVIEWS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REVIEWS" MODIFY ("REVIEW_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REVIEWS" MODIFY ("TOUR_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REVIEWS" MODIFY ("USER_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TERMS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."TERMS" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TERMS" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TERMS" MODIFY ("TE_UPDATED_AT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TERMS" ADD PRIMARY KEY ("TERMS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table THEME
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."THEME" MODIFY ("THEME_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."THEME" MODIFY ("THEME_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TOURS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."TOURS" MODIFY ("TOUR_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TOURS" MODIFY ("GUIDE_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TOURS" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TOURS" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TOURS" MODIFY ("DELETEYN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."USERS" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."USERS" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."USERS" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."USERS" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."USERS" MODIFY ("ROLE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."USERS" ADD CONSTRAINT "USERS_PK" PRIMARY KEY ("USER_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SYSTEM"."USERS" MODIFY ("USER_FIRSTNAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."USERS" MODIFY ("ISFOREIGNER" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."USERS" MODIFY ("PUSHYN" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."USERS" MODIFY ("UNREGISTERYN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table WISHLIST
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."WISHLIST" MODIFY ("TOUR_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."WISHLIST" MODIFY ("GUIDE_NO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."WISHLIST" MODIFY ("USER_NO" NOT NULL ENABLE);
