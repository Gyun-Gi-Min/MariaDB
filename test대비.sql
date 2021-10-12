-- ---------------------CRUD 

CREATE TABLE abc_stu(
	pk INT UNSIGNED AUTO_INCREMENT,
	nm VARCHAR(5) NOT NULL,
	age CHAR(2) not NULL,
	addr VARCHAR(40) NOT NULL,
	gender CHAR(1) NOT NULL DEFAULT '남' CHECK(gender IN('남','여')),
	rdt	DATETIME DEFAULT NOW(),
	PRIMARY KEY(pk)
);

DROP TABLE abc_stu;

SELECT * FROM abc_stu;


INSERT INTO abc_stu
(nm,age,addr,gender)
VALUES
('카리나','22','제주도','여'),
('윈터','21','서울','여'),
('지젤','21','미국','남'),
('닝닝','20','영국','남');

SELECT nm,age,addr FROM abc_stu
WHERE age = '21';

DELETE FROM abc_stu WHERE nm='닝닝';

INSERT INTO abc_stu
(nm,age,addr,gender)
values
('new닝닝','19','대구','여');

UPDATE abc_stu SET age='25',addr='강원도' WHERE nm='new닝닝';

-- ---------------------  PK, FK 설정.

CREATE TABLE human1(
	sno INT UNSIGNED AUTO_INCREMENT,
	nm VARCHAR(5) NOT NULL,
	age INT NOT NULL,
	addr VARCHAR(20),
	PRIMARY KEY(sno)
);

INSERT INTO human1
(nm,age,addr)
VALUES
('가나','30','제주'),
('다라','23','경산'),
('마바','26','구미'),
('사아','27','포항');

SELECT * FROM human1;

CREATE TABLE  hhobby(
	hno INT UNSIGNED AUTO_INCREMENT,
	nm VARCHAR(10) NOT NULL,
	PRIMARY KEY(hno)
);

INSERT INTO hhobby
(nm)
VALUES
('숨쉬기'),
('걷기'),
('게임'),
('공부'),
('영화'),
('밥먹기'),
('헬스');

SELECT * FROM hhobby;
SELECT * FROM human1;

DROP TABLE hhobby;


DROP TABLE humanhobby;

CREATE TABLE humanhobby(
	sno INT UNSIGNED,
	hno INT UNSIGNED,
	PRIMARY KEY(sno,hno),
	FOREIGN KEY (sno) REFERENCES human1 (sno),
	FOREIGN KEY (hno) REFERENCES hhobby (hno)
);

SELECT * FROM humanhobby;

INSERT INTO humanhobby
VALUES 
(1,1),
(1,2),
(1,3),
(2,1),
(3,1),
(4,1),
(4,2);

INSERT INTO humanhobby
(sno,hno)
VALUES
(10, 10);  -- foreingn에 10이 없으므로 error 뜬다~

SELECT A.sno AS snum, A.hno AS hnum
FROM humanhobby A;    -- 컬럼명 변경(알리아스(닉네임, 별명) 이용.)



-- 요거 잘보기
SELECT A.sno AS hh, B.*, C.nm
FROM humanhobby A
INNER JOIN human1 B
ON A.sno = B.sno
INNER JOIN hhobby C
ON A.hno = C.hno
ORDER BY c.nm ASC;


-- -----------------------------------------------

CREATE TABLE customer(
	nu INT UNSIGNED AUTO_INCREMENT,
	id INT UNSIGNED,
	fn VARCHAR(5) NOT NULL,
	sn VARCHAR(5) NOT NULL,
	PRIMARY KEY(nu)
);

INSERT INTO customer
(id,fn,sn)
VALUES
(12,'pi','zza'),
(23,'chik','ken'),
(34,'zza','zang');

SELECT * FROM customer;


CREATE TABLE customer2(
	nu INT UNSIGNED,
	tn INT UNSIGNED,
	PRIMARY KEY (nu),
	FOREIGN KEY (nu) REFERENCES customer(nu)
);

INSERT INTO customer2;
(nu,tn)
VALUES
(1,1234),
(2,4567),
(3,7890);

SELECT * FROM customer2;


SELECT A.*, B.tn
FROM customer A
INNER JOIN customer2 B
ON A.nu = B.nu;

-- index human1 테이블 사용
CREATE INDEX idx_human1
ON human1 (age);

SHOW INDEX FROM human1;

DROP INDEX idx_human1
ON human1;


CREATE VIEW view_js
AS
SELECT B.sno, B.nm AS hnm, A.hno,C.nm AS hhnm
FROM humanhobby A
INNER JOIN human1 B
ON B.sno = A.sno
INNER JOIN hhobby C
ON C.hno = a.hno;

DROP VIEW view_js;

SELECT * FROM view_js;

-- -------------------------------

CREATE TABLE temp_1(
 id INT UNSIGNED PRIMARY KEY,
 nm VARCHAR(5) NOT NULL
);

CREATE TABLE temp_2(
 id INT UNSIGNED PRIMARY KEY,
 tid INT UNSIGNED,
 nm VARCHAR(5) NOT NULL
);

INSERT INTO temp_1 (id, nm)
VALUES (1, '가'), (2, '나'), (3, '다');

INSERT INTO temp_2 (id,tid, nm)
VALUES (1, 1, 'A'), (2, 1, 'B'), (3, 3, 'C'), (4, 4, 'D');

SELECT * FROM temp_1;
SELECT * FROM temp_2;

SELECT
A.id AS id2, A.tid AS tid, A.nm AS nm2
, B.id AS id1, B.nm AS nm1
FROM temp_2 A
INNER JOIN temp_1 B
ON A.id = B.tid;

-- B.tid가 없네.

SELECT
A.*, B.*
FROM temp_1 A
LEFT JOIN temp_2 B  -- temp_2 를 보장하네.
ON A.id = B.tid;

