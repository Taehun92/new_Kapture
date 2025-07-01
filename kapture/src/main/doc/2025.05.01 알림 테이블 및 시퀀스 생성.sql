CREATE TABLE ALARM (
    ALARM_NO         NUMBER PRIMARY KEY,                        -- 알림 고유번호
    TARGET_USER_NO   NUMBER NOT NULL,                           -- 알림 대상자 (USERS.USER_NO)
    REFERENCE_TYPE   VARCHAR2(30) NOT NULL,                     -- 참조 테이블명 ('PAYMENT', 'COMMENT', 'TOUR' 등)
    REFERENCE_ID     NUMBER NOT NULL,                           -- 참조하는 PK 번호
    URL_PARAM        VARCHAR2(200),                             -- URL 파라미터 (댓글알림일 때만 사용 가능)
    ALARM_STATUS     CHAR(1) DEFAULT 'N' CHECK (ALARM_STATUS IN ('Y', 'N')) NOT NULL, -- 알림 확인 여부
    AL_CREATED_AT    DATE DEFAULT SYSDATE NOT NULL              -- 생성일시
);
CREATE SEQUENCE ALARM_SEQ
INCREMENT BY 1 -- 1씩 증가
START WITH 16 -- 1부터 시작 
MINVALUE 1
MAXVALUE 99999
NOCYCLE;
COMMIT;