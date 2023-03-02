
CREATE TABLE "HR"."depart" 
   (	
   	"ID" VARCHAR2(10), 
	"NAME" VARCHAR2(10), 
	"INSTRUCTOR" VARCHAR2(10)
   ) 
   

CREATE TABLE "HR"."student" 
   (	
   	"ID" VARCHAR2(10), 
	"NAME" VARCHAR2(10), 
	"TEL" VARCHAR2(10),
	"DEPART_ID" VARCHAR2(10)
   ) 

INSERT INTO "depart" VALUES ('abc','홍길동','김철수')

INSERT INTO "depart" VALUES ('def','김길동','김영희')

SELECT * FROM "depart"




CREATE TABLE "HR"."BBS2" 
(	"no" VARCHAR2(100), 
	"TITLE" VARCHAR2(100), 
	"CONTENT" VARCHAR2(100), 
	"WRITER" VARCHAR2(100), 
	 CONSTRAINT "BBS_PK22" PRIMARY KEY ("no"),
	 CONSTRAINT "FK_MEMBER22" FOREIGN KEY ("WRITER")
	  REFERENCES "HR"."MEMBER" ("ID")
) 


CREATE TABLE "HR"."BBS3" 
(	"no" VARCHAR2(100), 
	"TITLE" VARCHAR2(100), 
	"CONTENT" VARCHAR2(100), 
	"WRITER" VARCHAR2(100)
) 

--pk 제약조건 추가
ALTER TABLE HR.BBS3
ADD CONSTRAINT BBS3_PK PRIMARY KEY ("no")

--fk 제약조건 추가
ALTER TABLE HR.BBS3
ADD CONSTRAINT FK_MEMBER33
FOREIGN KEY (WRITER) REFERENCES HR."MEMBER"(ID);


CREATE TABLE "HR"."depart2"(
	"id" VARCHAR2(100),
	"name" VARCHAR2(100),
	"instructor" VARCHAR2(100),
	CONSTRAINT "depart2_PK" PRIMARY KEY ("id")
)

CREATE TABLE "HR"."student2"(
	"id" VARCHAR2(100),
	"name" VARCHAR2(100),
	"tel" VARCHAR2(100),
	"depart_id" VARCHAR2(100)
)


ALTER TABLE HR."student2"
ADD CONSTRAINT STUDENT2_PK PRIMARY KEY ("id")

ALTER TABLE HR."student2"
ADD CONSTRAINT "FK_depart2"
FOREIGN KEY ("depart_id")
REFERENCES HR."depart2"("id"); --연결하다라는 뜻 REFERENCES


-- 테이블 복사
 CREATE TABLE member22
 AS SELECT * FROM member

INSERT INTO MEMBER22
VALUES ('banana3','banana3','banana3','banana3',sysdate)

SELECT * FROM MEMBER22  

INSERT INTO MEMBER22
VALUES ('banana4','banana4','banana4','banana4',sysdate,'aaa')


INSERT INTO BBS
VALUES (bbs_id_seq.nextval, 'happy', 'happy day', 'ice')

INSERT INTO BBS
VALUES (bbs_id_seq.nextval, 'happy2', 'happy day2', 'ice')

INSERT INTO BBS
VALUES (bbs_id_seq.nextval, 'happy3', 'happy day3', 'ice')

SELECT * FROM bbs

CREATE SEQUENCE pd_id_seq
INCREMENT BY 1
START WITH 1

CREATE TABLE product3 (
	id number(38, 0),
	name varchar2(100)
)

INSERT INTO product3
VALUES (pd_id_seq.nextval, 'shoes')

SELECT * FROM product3



CREATE TABLE orderlist3(
	id number(38,0),
	title varchar2(100),
	price number(38, 0)
)

INSERT INTO orderlist3
VALUES (or_seq.nextval, '짜장면', '5000')

INSERT INTO orderlist3
VALUES (or_seq.nextval, '짬뽕', '7000')

INSERT INTO orderlist3
VALUES (or_seq.nextval, '탕수육', '12000')

SELECT * FROM orderlist3

SELECT * FROM orderlist3
ORDER BY id --오름차순

SELECT * FROM orderlist3
ORDER BY id DESC --내림차순

SELECT * FROM ORDERLIST3
WHERE ID >= 3
ORDER BY id DESC



CREATE TABLE DEPT (
	DEPTNO NUMBER(2),
	DNAME VARCHAR2(14 BYTE),
	LOC VARCHAR2(13 BYTE)
)

CREATE TABLE EMP (
	EMPNO NUMBER(4),
	ENAME VARCHAR2(10 BYTE),
	JOB VARCHAR2(9 BYTE),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2)
)

CREATE TABLE SALGRADE(
	GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER
)

ALTER TABLE DEPT ADD (
CONSTRAINT PK_DEPT
PRIMARY KEY
(DEPTNO));

ALTER TABLE EMP ADD (
CONSTRAINT PK_EMP
PRIMARY KEY
(EMPNO));

ALTER TABLE EMP ADD (
CONSTRAINT FK_DEPTNO
FOREIGN KEY (DEPTNO)
REFERENCES DEPT (DEPTNO));


SELECT * FROM emp --selection

SELECT deptno FROM emp --projection

SELECT DISTINCT deptno FROM emp --distinct (중복된 값 제거)

SELECT ename, sal * 12 AS yearsal FROM emp

SELECT * FROM EMP
ORDER BY sal DESC

SELECT * FROM EMP
WHERE DEPTNO = 30 --30일때
ORDER BY EMPNO DESC

SELECT * FROM EMP
WHERE NOT DEPTNO = 30 --30이 아닐때
ORDER BY EMPNO DESC

SELECT * FROM EMP
WHERE DEPTNO = 30 AND JOB = 'SALESMAN'

SELECT * FROM EMP
WHERE DEPTNO = 30 or JOB = 'SALESMAN'

SELECT * FROM EMP
WHERE sal >= 3000

SELECT * FROM EMP
WHERE sal != 3000 --3000이 아닌 사람

SELECT * FROM EMP
WHERE job IN ('SALESMAN', 'MANAGER')
ORDER BY job

SELECT * FROM EMP
WHERE job NOT IN ('SALESMAN', 'MANAGER')
ORDER BY job

SELECT * FROM EMP
WHERE sal BETWEEN 2000 AND 3000
ORDER BY empno

SELECT * FROM EMP
WHERE sal NOT BETWEEN 2000 AND 3000
ORDER BY empno

SELECT * FROM EMP
WHERE ENAME LIKE '_L%'

SELECT * FROM EMP
WHERE ENAME NOT LIKE '_L%'

SELECT * FROM EMP
WHERE COMM IS NULL

SELECT * FROM EMP
WHERE COMM IS NOT NULL


CREATE TABLE dept_temp2
AS
SELECT * FROM DEPT

SELECT * FROM dept_temp2

UPDATE dept_temp2
SET LOC = 'SEOUL'

UPDATE dept_temp2
SET DNAME = 'DATABASE', loc = 'BUSAN'
WHERE DEPTNO = 40 --40인 값만 부산으로 바꿔줌

DELETE FROM DEPT_TEMP2
WHERE DNAME = 'SALES'

SELECT * FROM DEPT_TEMP2



SELECT * FROM EMP
WHERE NOT DEPTNO = 30 --30이 아닐때
ORDER BY EMPNO DESC


--------------------예제 문제--------------------

CREATE TABLE PRODUCT3
(	"ID" VARCHAR2(200),
"NAME" VARCHAR2(200),
"CONTENT" VARCHAR2(200),
"PRICE" NUMBER(38,0),
"COMPANY" VARCHAR2(200),
"IMG" VARCHAR2(200)
)

SELECT * FROM PRODUCT3
ORDER BY PRICE DESC --2.price 내림차순 정렬하여 전체컬럼 검색 

SELECT NAME,CONTENT,PRICE  FROM PRODUCT3
ORDER BY COMPANY --3.company로 오름차순 정렬하여 제품의 이름,내용,가격 검색

SELECT DISTINCT COMPANY FROM PRODUCT3 --4.company의 목록의 검색(중복제거)

SELECT price * 5 AS PRICE5 FROM PRODUCT3 --5.각 신발을 5개씩 주문했을 때의 가격을 price5라고 항목명을 지정하여 출력 ★

SELECT name, company FROM PRODUCT3
WHERE price = 5000 --6.price가 5000인 제품명과 회사명

SELECT name, price, company FROM PRODUCT3
WHERE price BETWEEN 3000 AND 6000 --7.price가 3000와 6000사이인 제품명과 가격, 회사명 검색

SELECT name, company FROM PRODUCT3
WHERE company != 'c100' --8.회사명이 c100이 아닌 회사명과 제품명

SELECT name, price FROM PRODUCT3
WHERE company = 'c100' or company = 'c200' --9.회사명이 c100, c200인 제품명과 가격

SELECT * FROM PRODUCT3
WHERE NAME LIKE '_4%' --10.제품명에 4로 끝나는 제품의 전체 정보 검색

SELECT * FROM PRODUCT3
WHERE content LIKE '%food%' --11.제품내용에 food를 포함하는 제품의 전체 정보 검색

UPDATE PRODUCT3 
SET content = '품절'
WHERE price = 5000 --12.price가 5000원인 제품의 content를 품절로 수정

UPDATE PRODUCT3
SET img = 'o.png', price = 10000
WHERE id = '100' OR  id = '102' --13.id가 100,102번 제품의 img를 o.png로 price를 10000으로 수정

DELETE FROM PRODUCT3
WHERE COMPANY = 'c100' --14.회사명이 c100인 경우 모든 정보 삭제


