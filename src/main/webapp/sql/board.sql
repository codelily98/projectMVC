-- [테이블] Oracle
CREATE TABLE board(
     seq NUMBER NOT NULL,               -- 글번호 (시퀀스 객체 이용)
     id VARCHAR2(20) NOT NULL,          -- 아이디
     name VARCHAR2(40) NOT NULL,        -- 이름
     email VARCHAR2(40),                -- 이메일
     subject VARCHAR2(255) NOT NULL,    -- 제목
     content VARCHAR2(4000) NOT NULL,   -- 내용 
     ref NUMBER NOT NULL,               -- 그룹번호
     lev NUMBER DEFAULT 0 NOT NULL,     -- 단계
     step NUMBER DEFAULT 0 NOT NULL,    -- 글순서
     pseq NUMBER DEFAULT 0 NOT NULL,    -- 원글번호
     reply NUMBER DEFAULT 0 NOT NULL,   -- 답변수
     hit NUMBER DEFAULT 0,              -- 조회수
     logtime DATE DEFAULT SYSDATE
 );

-- [시퀀스]
CREATE SEQUENCE seq_board  NOCACHE NOCYCLE;

-- [MySQL TABLE]
CREATE TABLE board(
     seq INTEGER PRIMARY KEY AUTO_INCREMENT,	-- 글번호
     id VARCHAR(20) NOT NULL,          			-- 아이디
     name VARCHAR(40) NOT NULL,        			-- 이름
     email VARCHAR(40),                			-- 이메일
     subject VARCHAR(255) NOT NULL,    			-- 제목
     content VARCHAR(4000) NOT NULL,   			-- 내용 
     ref int NOT NULL,               			-- 그룹번호
     lev int DEFAULT 0 NOT NULL,     			-- 단계
     step int DEFAULT 0 NOT NULL,    			-- 글순서
     pseq int DEFAULT 0 NOT NULL,    			-- 원글번호
     reply int DEFAULT 0 NOT NULL,   			-- 답변수
     hit int DEFAULT 0,              			-- 조회수
     logtime TIMESTAMP DEFAULT NOW()			-- 작성일
 );




