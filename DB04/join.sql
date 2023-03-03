-----------------------------------------
-- join: 왜 하는가? 검색을 하고 싶은데 항목들이 여러개의 테이블에 흩어져있는 경우
--       테이블을 모아서 (합해서) 검색

SELECT *
FROM hr."MEMBER" m, hr.BBS b
WHERE m.ID = b.WRITER

SELECT b."no", title, name 
FROM hr."MEMBER" m, hr.BBS b
WHERE m.ID = b.WRITER

-------Inner join : 테이블간 공통된 값만 추출
-------emp테이블과 dept 테이블을 조인하세요.
-------하나의 컬럼이상이 동일한 컬럼이 있어야 함.
-------empno, ename, job, deptno, loc 칼럼 검색
-------조인 조건: deptno

SELECT d.DEPTNO, e.ENAME, e.JOB, d.DEPTNO, d.LOC
FROM HR.DEPT d, HR.EMP e
WHERE d.DEPTNO = e.DEPTNO

SELECT *
FROM HR."MEMBER" m 
LEFT OUTER JOIN HR.BBS b
ON(m.ID = b.writer)

SELECT *
FROM HR."MEMBER" m 
right OUTER JOIN HR.BBS b
ON(m.ID = b.writer)

--left/right outer JOIN 
--1.emp테이블의 정보는 다 보이게 하고 싶음. dept는 맞는 것만 오른쪽에 붙여주고 싶음.
SELECT *
FROM hr.EMP e 
LEFT OUTer JOIN hr.DEPT d 
ON (e.DEPTNO = d.DEPTNO)

--2.dept테이블의 정보는 다 보이게 하고 싶음. emp는 맞는 것만 오른쪽에 붙여주고 싶음.
SELECT *
FROM hr.EMP e 
right OUTer JOIN hr.DEPT d 
ON (e.DEPTNO = d.DEPTNO)


-- inner join
SELECT *
FROM "MEMBER" m , BBS b 
WHERE m.ID = b.WRITER 

-- outer join(left, right)
SELECT m.id, m.NAME, b.TITLE, b.CONTENT 
FROM "MEMBER" m 
LEFT OUTER JOIN BBS b 
on(m.id = b.WRITER)

SELECT m.id, m.NAME, b.TITLE, b.CONTENT 
FROM "MEMBER" m 
right OUTER JOIN BBS b 
on(m.id = b.WRITER)


-------------예제 문제--------------
SELECT *
FROM COMPANY c ,PRODUCT p 
WHERE c.ID = p.COMPANY 

SELECT * 
FROM COMPANY c 
LEFT OUTER JOIN PRODUCT p 
on(c.id = p.COMPANY)

SELECT *
FROM COMPANY c 
right OUTER JOIN PRODUCT p 
on(c.id = p.COMPANY)



