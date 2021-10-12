SELECT *
FROM t_student2
WHERE addr = '부산';

--스칼라 값(컬럼 1개 , 레코드 1개)

SELECT addr FROM t_student2
WHERE sno = 6;

SELECT *
FROM t_student2
WHERE addr = (SELECT addr FROM t_student2 WHERE sno = 6 );

-- sno가 6,7번과 같으느 addr인 사람들 전부 뽑아내기

SELECT *
FROM t_student2 
WHERE addr IN('부산','서울');
-- where addr = '부산' or addr='서울'; 

SELECT *
FROM t_student2 
WHERE addr IN (SELECT addr FROM t_student2 WHERE sno IN (6,7));

-- 셀프 조인으로 해결

SELECT A.*
FROM t_student2 A
INNER JOIN t_student2 B
ON A.addr = B.addr
WHERE B.sno IN (6,7);



SELECT -10,10, ABS(-10),ABS(10);

SELECT CEIL(10.0), CEIL(10.1),CEIL(10.5),CEIL(10.9);  -- 올림
SELECT ROUND(10.16666,1), ROUND(10.5), ROUND(10.9); -- 반올림
SELECT floor(10.1), floor(10.5), floor(10.9); -- 내림


SELECT ROUND(10.44,1),ROUND(10.45,1),TRUNCATE(10.44,1),TRUNCATE(10.45,1);


TRUNCATE TABLE 테이블명; -- ROLLBACK 안됨. 트랜잭션 안걸림. 조심해서 쓰기.
DELETE FROM 테이블명;


SELECT*, GREATEST (sno,hno,5), least (sno,hno,5)
FROM t_studenthobby;

SELECT INTERVAL (6,1,2,3,4,1100);  -- 잘 안쓰일듯...?

-- 문자 함수

SELECT CONCAT('안녕','하세요','누구누구','입니다');
SELECT CONCAT ('10000',' 원'); -- 문자열을 이어준다.

SELECT INSERT('ABCDEFG',3,2,'가나');
SELECT INSERT('ABCDEFG',3,1,'가나');
SELECT INSERT('ABCDEFG',3,0,'가나');

SELECT REPLACE ('ABCDEFG','D','디');

SELECT LEFT('ABCDEFG',4);
SELECT RIGHT('ABCDEFG',4);

SELECT MID('ABCDEFG',2,4); -- 데이터베이스는 보통 인덱스가 아닌 길이.  
SELECT MID('ABCDEFG',3,4);
SELECT SUBSTRING('ABCDEFG',3,4); -- MID = SUBSTR = SUBSTRING


SELECT MID(TRIM('    ABCDEFG'),3,4) ,SUBSTRING('ABCDEFG',3,4);

SELECT LCASE('AbCdEfG'), UCASE('AbCdEfG');
SELECT REVERSE('AbCdEfG')
,LEFT(REPLACE(UCASE(REVERSE('AbCdEfG')),'D','디'),4);

-- 날짜 

SELECT NOW(),SYSDATE(), CURRENT_TIMESTAMP();   -- SYSDATE()는 오라클에서도 쓰임. 
SELECT DATE_FORMAT(NOW(),'%y년 %m월 %d일 %T');

SELECT WEEKDAY(NOW());

-- weekday(), now(), case문 활용
-- 0 > 월요일
-- 1 > 화요일
-- 2 > 수요일
-- 3 > 못요일
-- 4 > 금요일
-- 5 > 토요일
-- 6 > 일요일

SELECT 
CONCAT(
case WEEKDAY(NOW())
	when 0 then '월'
	when 1 then '화'
	when 2 then '수'
	when 3 then '목'
	when 4 then '금'
	when 5 then '토'
	when 6 then '일'
	END,
'요일') AS weekday ;
		
SELECT DATEDIFF(DATE('2021-10-30'),NOW()) AS dday;

SELECT CONCAT(FORMAT(1000000000,0),'원');

SELECT concat(cast(10000 AS CHAR),'원'), CONVERT(10000,CHAR);

-- union VS union all 차이점 및 union 이해하기.

SELECT pk ,nm ,addr FROM t_student
UNION 
SELECT sno ,nm,addr FROM t_student2;

-- distinct 중복 제거

SELECT * FROM t_student2;

SELECT addr FROM t_student2;
SELECT distinct addr FROM t_student2;

-- insert + select 문

INSERT INTO t_student2
(nm,age,addr)
VALUES
('','','');

INSERT INTO t_student2
(nm,age,addr)
SELECT '김구',32,'원주';

INSERT INTO t_student2
(nm,age,addr)
SELECT '이순신',34,addr
FROM t_student2
WHERE sno = 5;

