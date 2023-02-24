CREATE TABLE "HR"."NOTICE"
(	"BOARDNO" NUMBER(38,0), 
	"TITLE" VARCHAR2(100), 
	"CONTENTS" VARCHAR2(100), 
	"WRITER" VARCHAR2(100), 
	"WRITE_DATE" DATE, 
	"RECOMMEND" NUMBER(38,0), 
	"view" NUMBER(38,0)
	--추천게시판(recommend)
	--re_no 숫자
	--title, content,writer 문자
 )
 
 ALTER TABLE HR.RECOMMEND ADD VIEWCOUNT NUMBER(38,0) NULL;


 
 CREATE TABLE "RECOMMEND"(
	RE_NO NUMBER(38,0),
	TITLE VARCHAR2(100),
	CONTENT VARCHAR2(100),
	WRITER VARCHAR2(100)
 )  
 
 DROP TABLE RECOMMEND -- 테이블 통째로 던져버림.
 
  CREATE TABLE "RECOMMEND"(
	RE_NO NUMBER(38,0),
	TITLE VARCHAR2(100),
	CONTENT VARCHAR2(100),
	WRITER VARCHAR2(100)
 )  
 
 CREATE TABLE "HR"."BOARD3" 
   (	"BOARDNO" NUMBER(38,0), 
	"TITLE" VARCHAR2(100), 
	"CONTENTS" VARCHAR2(100), 
	"WRITER" VARCHAR2(100), 
	"WRITE_DATE" DATE, 
	"RECOMMEND" NUMBER(38,0), 
	"view" NUMBER(38,0)
   )

ALTER TABLE BOARD3 MODIFY WRITER VARCHAR(200)

ALTER TABLE BOARD3 DROP COLUMN TITLE

ALTER TABLE BOARD3 ADD TEST2 VACHAR2(100)

DROP TABLE BOARD3

-- DLC : DB 관리/제어해주는 문법 (계정생성, 계정권한부여, 백업, 복구)

CREATE USER apple IDENTIFIED BY a1234

GRANT CONNECT, resource, dba TO apple

CREATE TABLE "HR"."PRODUCT3"
("ID" VARCHAR2(100) PRIMARY key, 
	"NAME" VARCHAR2(100), 
	"CONTENT" VARCHAR2(100), 
	"PRICE" NUMBER(38,0)
   )
   
   INSERT INTO MEMBER VALUES ('100','100','park','011')
   
   INSERT INTO MEMBER VALUES ('200','200','park','011')
   
   INSERT INTO MEMBER VALUES ('300','100','park','011')
   
   SELECT * FROM "MEMBER" 

   SELECT * FROM MEMBER WHERE ID = '100' --ID가 100일 경우에만 보여준다 
   
   SELECT ID FROM MEMBER WHERE ID = '100' --ID가 100인 ID 컬럼
   
   SELECT ID, NAME FROM MEMBER WHERE ID = '100' --ID가 100인 ID, NAME 컬럼
   
   SELECT ID AS ID, NAME FROM MEMBER WHERE ID = '100' --ID가 100인 ID, NAME 컬럼 
   
   SELECT tel FROM MEMBER WHERE name = 'park'
   
   UPDATE MEMBER SET NAME = 'kim' WHERE id = '100'
   
   UPDATE MEMBER SET NAME = 'kang' WHERE id = '200'
   
   UPDATE MEMBER SET NAME = 'yang' WHERE id = '300'
   
   SELECT * FROM "MEMBER" 
   
   UPDATE MEMBER SET PW = '888', tel = '9999' WHERE id = 'ice'

 	DELETE FROM MEMBER WHERE id = '100'
 
 	DELETE FROM MEMBER WHERE tel = '011'
 	
 	SELECT * FROM MEMBER WHERE id = '200' AND tel = '011'

SELECT * FROM MEMBER WHERE id = '200' or tel = '011'



CREATE TABLE product (
	id varchar2(200),
	name varchar2(200),
	content varchar2(200),
	price varchar2(200),
	company varchar2(200),
	img varchar2(200)
)


SELECT * FROM MEMBER ORDER BY id --오름차순

SELECT * FROM MEMBER ORDER BY id DESC--내림차순





-- select, update, delete 정리 문제 --

 SELECT * FROM PRODUCT ORDER BY PRICE DESC -- 1.pice로 내림차순 정렬하여 전체컬럼 검색
 
 SELECT name, content, PRICE FROM PRODUCT ORDER BY company -- 2. company로 오름차순 정렬하여 제품의 이름, 내용, 가격 검색
 
 SELECT name, price FROM PRODUCT WHERE id = '100'-- 3. id가 100인 제품의 이름과 가격 검색

 SELECT name, company FROM PRODUCT WHERE price = '5000' -- 4. price가 5000인 제품명과 회사명
 
 SELECT name, img FROM PRODUCT WHERE id = '100' AND price = '1000'-- 5.id가 100이고, 가격이 1000인 제품명과 이미지 검색
 
 SELECT company, name FROM PRODUCT WHERE COMPANY = 'c100' --6.회사명이 c100인 회사명과 제품명
 
 SELECT name, price FROM PRODUCT WHERE COMPANY = 'c100' or 'c200'--7.회사명이 c100, c200인 제품명과 가격 ★(다른 행에 있는 것은 and로 불러오지 못한다)
 
 UPDATE PRODUCT SET CONTENT = '품절' WHERE price = '5000' --8.price가 5000원인 제품의 content를 품절로 수정
 
 UPDATE PRODUCT SET img = '0.png', PRICE = '10000' WHERE id = '100' OR '102'  --9.id가 100,102번 제품의 img를 o.png로, price를 10000으로 수정 ★
 
 UPDATE PRODUCT SET COMPANY = 'apple', name = 'appleshoes' WHERE id = '101'--10.id가 101번 제품의 company를 apple, name은 appleshoes로 수정
 
 DELETE FROM PRODUCT WHERE name = 'shoes1' OR id = '107' --11. name이 shoes1이거나 id가 107인 제품 삭제
 
 DELETE FROM PRODUCT WHERE COMPANY = 'c100' --12.회사명이 c100인 경우 모든 정보 삭제
 
 DELETE FROM PRODUCT --13.테이블의 모든 정보 삭제
 
 DROP TABLE PRODUCT --14.테이블삭제