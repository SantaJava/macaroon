-- members 테이블
drop table MEMBERS

create table MEMBERS(
   user_id       varchar2(20) primary key,
   name         varchar2(20),
   password       varchar2(20),
   cell_phone      varchar2(50),
   email         varchar2(50),
   address       varchar2(200),
   grade          number,
   profile_pic      varchar2(100) default 'default.png',
   reg_date       date    default sysdate,
   update_date    date    default sysdate
);

-- 일반회원 추가
insert into MEMBERS (user_id, name, password, cell_phone, email, address, grade)
values('sj', '조서진', '1234', '010-1111-1111', 'seojin@gmail.com', null, 1);

insert into MEMBERS (user_id, name, password, cell_phone, email, address, grade)
values('iw', '구인우', '1234', '010-1111-1111', 'inwu@gmail.com', null, 1);

insert into MEMBERS (user_id, name, password, cell_phone, email, address, grade)
values('jh', '한주형', '1234', '010-1111-1111', 'juhyeong@gmail.com', null, 1);

insert into MEMBERS (user_id, name, password, cell_phone, email, address, grade)
values('jw', '김재욱', '1234', '010-1111-1111', 'jw@gmail.com', null, 1);
-- 관리자 추가
insert into MEMBERS (user_id, name, password, cell_phone, email, address, grade)
values('admin', '관리자', '1234', null, null, null, 0); 

select * from members;

-- images 테이블
DROP TABLE IMAGES;

create table IMAGES(
   image_id   number primary key,
   title      varchar2(100),
   description   varchar2(500),
   file_name   varchar2(100),
   new_name    varchar2(100),
   thumb_name   varchar2(100),
   file_size   number,
   mime_type   varchar2(30),
   reg_date   date   default sysdate
);

select * from IMAGES;

create sequence images_seq;

-- boards 테이블
DELETE TABLE BOARDS;

CREATE TABLE BOARDS (
    BOARD_ID    NUMBER PRIMARY KEY,
    TITLE      VARCHAR2(256) NOT NULL,
    WRITER       VARCHAR2(50) NOT NULL,
    READ_CNT    NUMBER,
    CONTENT    CLOB,
    REPLY_CNT    NUMBER,
    REG_DATE    DATE,
    UPDATE_DATE DATE
);

CREATE SEQUENCE BOARDS_SEQ;

SELECT * FROM BOARDS;

insert into BOARDS (BOARD_ID, TITLE, WRITER, READ_CNT, CONTENT, REPLY_CNT,REG_DATE,UPDATE_DATE)
values(boards_seq.nextval, '테스트TABLE', 'jh', 0,'안녕하세요' ,0,SYSDATE,SYSDATE); 

insert into BOARDS (BOARD_ID, TITLE, WRITER, READ_CNT, CONTENT, REPLY_CNT,REG_DATE,UPDATE_DATE)
values(boards_seq.nextval, '테스트TABLE', 'sj', 0,'난서진' ,0,SYSDATE,SYSDATE); 

insert into BOARDS (BOARD_ID, TITLE, WRITER, READ_CNT, CONTENT, REPLY_CNT,REG_DATE,UPDATE_DATE)
values(boards_seq.nextval, '테스트TABLE', 'iw', 0,'hello' ,0,SYSDATE,SYSDATE); 

insert into BOARDS (BOARD_ID, TITLE, WRITER, READ_CNT, CONTENT, REPLY_CNT,REG_DATE,UPDATE_DATE)
values(boards_seq.nextval, '테스트TABLE', 'jw', 0,'난재욱 ㅋ' ,0,SYSDATE,SYSDATE); 
-- attachments 테이블
DELETE TABLE ATTACHMENTS;

CREATE TABLE ATTACHMENTS(
    ATTACHMENT_ID       NUMBER PRIMARY KEY,
    FILE_NAME         VARCHAR2(256),
    LOCATION          VARCHAR2(1024),
    BOARD_ID          NUMBER,
    REG_DATE          DATE,
    CONSTRAINT F_ATTACHMENTS_BOARD FOREIGN KEY(BOARD_ID) REFERENCES BOARDS(BOARD_ID)
);

CREATE SEQUENCE ATTACHMENTS_SEQ;

SELECT * FROM ATTACHMENTS;

DROP TABLE REPLYS;
DROP TABLE REPLIES;

-- replies 테이블
CREATE TABLE REPLIES(
   REPLY_ID      NUMBER PRIMARY KEY,
   BOARD_ID      NUMBER,
   WRITER         VARCHAR2(20),
   CONTENT         CLOB,
   REG_DATE      DATE DEFAULT SYSDATE,
   PARENT_REPLY    NUMBER DEFAULT NULL,
   LIKE_CNT      NUMBER,
   REPLY_CNT      NUMBER,
   CONSTRAINT F_REPLIES_MEMBERS FOREIGN KEY(WRITER) REFERENCES MEMBERS(USER_ID),
   CONSTRAINT F_REPLIES_BOARDS FOREIGN KEY(BOARD_ID) REFERENCES BOARDS(BOARD_ID)
);

CREATE SEQUENCE REPLIES_SEQ;

SELECT * FROM REPLIES;