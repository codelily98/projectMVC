-- 회원가입과 로그인 (Oracle)
create table member(
name varchar2(30) not null,
id varchar2(30) primary key, -- 기본키, unique, not null, 무결성 제약 조건
pwd varchar2(70) not null,
gender varchar2(3),
email1 varchar2(20),
email2 varchar2(20),
tel1 varchar2(10),
tel2 varchar2(10),
tel3 varchar2(10),
zipcode varchar2(10),
addr1 varchar2(100),
addr2 varchar2(100),
logtime date);

-- Member Table(mySQL)
CREATE TABLE MEMBER (
    id VARCHAR(15) PRIMARY KEY,    -- 아이디, 필수, 기본키
    pwd VARCHAR(255) NOT NULL,     -- 비밀번호, 필수
    name VARCHAR(50) NOT NULL,     -- 이름, 필수
    gender CHAR(1) NOT NULL,        -- 성별, 필수
    email1 VARCHAR(100),           -- 이메일 아이디
    email2 VARCHAR(100),           -- 이메일 주소
    tel1 VARCHAR(3),               -- 전화번호 앞자리
    tel2 VARCHAR(4),               -- 전화번호 중간자리
    tel3 VARCHAR(4),               -- 전화번호 뒷자리
    zipcode VARCHAR(20),           -- 우편번호
    addr1 VARCHAR(255),            -- 주소
    addr2 VARCHAR(255),            -- 상세주소
    logtime DATE					-- 가입일
);

select * from member;