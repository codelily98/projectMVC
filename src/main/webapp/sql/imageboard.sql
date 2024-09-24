--[테이블]
CREATE TABLE imageboard(
 seq NUMBER PRIMARY KEY, 
 imageid VARCHAR2(20) NOT NULL, -- 상품코드 
 imagename VARCHAR2(40) NOT NULL, -- 상품명
 imageprice NUMBER NOT NULL, -- 단가
 imageqty NUMBER NOT NULL, -- 개수
 imagecontent VARCHAR2(4000) NOT NULL, 
 image1 varchar2(200), 
 logtime DATE DEFAULT SYSDATE
);

--[시퀀스]
create sequence seq_imageboard nocache nocycle;

DROP TABLE IMAGEBOARD PURGE;
DROP SEQUENCE SEQ_IMAGEBOARD;
SELECT * FROM IMAGEBOARD;
COMMIT;

-- [MySQL TABLE]
CREATE TABLE IMAGEBOARD(
 seq INTEGER PRIMARY KEY AUTO_INCREMENT,	-- 상품번호
 imageid VARCHAR(20) NOT NULL, 				-- 상품코드 
 imagename VARCHAR(40) NOT NULL, 			-- 상품명
 imageprice INT NOT NULL, 					-- 단가
 imageqty INT NOT NULL, 					-- 개수
 imagecontent VARCHAR(4000) NOT NULL, 		-- 이미지 내용
 image1 VARCHAR(200), 						-- 이미지 파일(파일이름)
 logtime TIMESTAMP DEFAULT NOW()			-- 등록일
);