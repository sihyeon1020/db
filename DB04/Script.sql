
--문자함수

SELECT UPPER(name) FROM PRODUCT3 --대문자 변환

SELECT lower(name) FROM PRODUCT3 --소문자 변환

SELECT INITCAP(name) FROM HR.PRODUCT3 --첫글자만 대문자로 변환

SELECT LENGTH(company) FROM HR.PRODUCT3 --글자수

SELECT SUBSTR(NAME ,3) FROM HR.PRODUCT3 --(3번째 글자부터 끝까지)

SELECT SUBSTR(NAME ,1,3) FROM HR.PRODUCT3 --(1번째 글자부터 3개)

SELECT SUBSTR(NAME , -2) FROM HR.PRODUCT3 --(-2번째 글자부터 끝까지)

SELECT REPLACE(NAME, 'f', 'B') FROM HR.PRODUCT3 --특정문자를 다른 문자로 대체 (f를 B로 대체)

SELECT concat(CONCAT(empno, ':'), ENAME) AS concat_result FROM HR.EMP 

SELECT empno || ':' || ename AS concat_result FROM HR.EMP 


SELECT TRIM('f'FROM name)FROM HR.PRODUCT3 --특정문자나 공백 삭제

SELECT TRIM('od')FROM HR.PRODUCT3 --특정문자나 공백 삭제

SELECT LENGTH(ename) FROM HR.EMP

SELECT LENGTH(trim(ename)) FROM HR.EMP --trim 앞뒤 공백을 삭제

SELECT trim(BOTH 'A' FROM ename) FROM HR.EMP --양쪽끝에 A를 제거

SELECT trim(LEADING 'A' FROM ename) FROM HR.EMP --앞쪽 A를 제거

SELECT trim(TRAILING 'A' FROM ename) FROM HR.EMP --뒤쪽 A를 제거

SELECT REPLACE(ename, ' ','')FROM hr.EMP 

UPDATE HR.EMP
SET HR.EMP.COMM = 0
WHERE HR.EMP.COMM IS NULL

SELECT * FROM HR.EMP

SELECT SAL + HR.EMP.COMM AS TOTAL
FROM HR.EMP

--------------------문자함수,숫자함수 정리 문제-------------------------

SELECT LENGTH(ename) FROM hr.EMP -- 1. ename의 글자수 검색

SELECT LENGTH(ename) FROM HR.EMP WHERE job = 'MANAGER'--2.JOB이 MANAGER인 사람의 ENAME 글자수 검색

SELECT ename, job FROM hr.EMP WHERE comm IS null

SELECT SUBSTR (ename ,2) FROM hr.EMP --5.ename의 2번째 글자부터 끝까지 검색

SELECT substr (JOB , 1, 3)FROM hr.EMP --6.JOB의 1번째 글자부터 3번째 글자까지 검색

SELECT REPLACE(ename, 'K' , 'P')FROM HR.EMP --7.ename의 글자 중 k를 p으로 변경하여 검색

SELECT empno ||'번은 '|| ename || '입니다.' FROM HR.EMP

SELECT hiredate, to_char(SYSDATE, 'mm') AS mm, TO_CHAR(SYSDATE, 'day') AS DAY FROM HR.EMP 

--------------------집계/그룹함수 정리 문제-------------------------

SELECT count(*) FROM HR.EMP

SELECT COUNT(SAL) FROM HR.EMP

SELECT COUNT(SAL), SUM(SAL), AVG(SAL), MIN(SAL), MAX(SAL)
FROM HR.EMP WHERE JOB = 'SALESMAN' -- 집계는 NULL 함수를 연산하지 않는다. 

SELECT job, COUNT(SAL), SUM(SAL), round(AVG(SAL)), MIN(SAL), MAX(SAL) --round <-소수점 잘라버리기
FROM HR.EMP 
GROUP BY JOB
HAVING COUNT(SAL) >= 4 -- 검색결과에서 추려내고 싶을 때 HAVING
ORDER BY JOB DESC


SELECT COUNT(*) FROM HR.EMP -- 1.전체 직원수 출력

SELECT COUNT(*) FROM HR.EMP
WHERE DEPTNO = 20 OR MGR <= 7700 -- 2. DEPTNO가 20이거나 MGR이 7700이하인 직원수 출력

SELECT MIN(SAL)
FROM HR.EMP
WHERE DEPTNO = 10 OR DEPTNO = 20 --3.DEPTNO가 10 또는 20인 직원의 SAL최저 출력

SELECT MIN(SAL), MAX(SAL), SUM(SAL)
FROM HR.EMP --4.직원의 SAL 최저, 최고, 합계 출력

SELECT ROUND(AVG(SAL))
FROM HR.EMP 
GROUP BY DEPTNO --5.DEPTNO 별 SAL 평균 출력

SELECT DEPTNO, SUM(SAL)
FROM HR.EMP
GROUP BY DEPTNO
ORDER BY DEPTNO --6.DEPTNO 별 SAL 합계를 DEPTNO 오름차순으로 출력

SELECT DEPTNO ,ROUND(AVG(SAL))
FROM HR.EMP 
GROUP BY DEPTNO
HAVING AVG(SAL) >= 2000 
ORDER BY DEPTNO DESC --7.DEPTNO 별 SAL 평균이 2000이상인 SAL 평균을 DEPTNO 역순으로 출력

SELECT COUNT(*), ROUND(AVG(SAL))
FROM HR.EMP
WHERE JOB = 'MANAGER' --8.JOB이 MANAGER인 직원의 전체 수, 월급의 평균 검색 

SELECT COUNT(*)
FROM HR.EMP
WHERE ENAME LIKE '%S%' --9.ENAME에 S를 포함하는 직원의 전체 수를 검색 

SELECT COUNT(*)
FROM HR.EMP
WHERE SAL >= 3000 AND COMM IS NOT NULL
ORDER BY SAL DESC  --10.SAL이 3000이상이고, COMM이 null이 아닌 직원의 전체 수 검색, SAL의 역순으로 출력


