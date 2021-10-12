-- DDL (데이터 정의어) DML (데이터 조작어) DCL (데이터 제어어)
CREATE TABLE t_student2(
	sno INT UNSIGNED AUTO_INCREMENT,
	nm VARCHAR(5) NOT NULL,
	age INT NOT NULL,
	addr VARCHAR(20),
	PRIMARY KEY(sno)
);

INSERT INTO t_student2
(nm, age, addr)
VALUES
('홍길동', 20, '서울'),
('신사임당', 22, '대구'),
('강감찬', 24, '부산');

SELECT * FROM t_student2;

CREATE TABLE t_hobby(
	hno INT UNSIGNED AUTO_INCREMENT,
	nm VARCHAR(10) NOT NULL,
	PRIMARY KEY(hno)
);

INSERT INTO t_hobby
(nm)
VALUES
('게임'),
('배타기'),
('수영'),
('등산'),
('명상'),
('붓글씨'),
('독서');

SELECT * FROM t_hobby;

다드

DROP TABLE t_studenthobby;
CREATE TABLE t_studenthobby(
	sno INT UNSIGNED,
	hno INT UNSIGNED,
	PRIMARY KEY (sno,hno),
	FOREIGN KEY (sno) REFERENCES t_student2 (sno),
	FOREIGN KEY (hno) REFERENCES t_hobby(hno)
);

create table 테이블명(
	블라블라,
)
constraint 제약조건이름 FOREIGN key



SELECT * FROM t_studenthobby;

INSERT INTO t_studenthobby
(sno,hno)
VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 6),
(2, 5),
(3, 2);

INSERT INTO t_studenthobby
(sno,hno)
VALUES
(10, 10);

SELECT A.sno AS ss, A.hno AS hh
FROM t_studenthobby A;

SELECT * FROM t_studenthobby A;

SELECT A.sno AS sh_sno, B.*, C.nm
FROM t_studenthobby A
INNER JOIN t_student2 B
ON A.sno = B.sno
INNER JOIN t_hobby C
ON A.hno = C.hno
ORDER BY B.nm ASC;

CREATE TABLE t_customer(
	nu INT UNSIGNED AUTO_INCREMENT,
	id INT UNSIGNED,
	fn VARCHAR(5) NOT NULL,
	sn VARCHAR(5) NOT NULL,
	PRIMARY KEY (nu)
);

INSERT INTO t_customer
(id, fn, sn)
VALUES
(123, 'Pooja', 'Singh'),
(456, 'San', 'Zhanh'),
(789, 'John', 'Doe');

DROP TABLE t_customer2;
CREATE TABLE t_customer2(
	nu INT UNSIGNED,
	tn INT UNSIGNED,
	PRIMARY KEY (nu),
	FOREIGN KEY (nu) REFERENCES t_customer (nu)
);
	
INSERT INTO t_customer2
(nu, tn)
VALUES
(1, 555),
(2, 554),
(3, 556);

SELECT * FROM t_customer2;

SELECT A.*, B.tn
FROM t_customer A
INNER JOIN t_customer2 B
ON A.nu = B.nu;
ORDER BY B.nu 

CREATE TABLE t_company(
	en INT UNSIGNED,
	lsn VARCHAR(10) NOT NULL,
	nm VARCHAR(10) NOT NULL,
);

INSERT INTO t_company
(en, lsn, nm)
VALUES
(1001, '앤드류스', '잭'),
(1002, 'Schwatz', '잭'),
(1009, '컵', '잭'),
(1007, 'Harvey', '잭'),
(1007, 'Harvey', '잭');

CREATE INDEX idx_student_age
ON t_student2 (age);

DROP INDEX idx_student_age
ON t_student2;

SHOW INDEX FROM t_student2;
-- PRIMARY key
-- unique
-- not null
-- index

CREATE VIEW view_joinresult
AS
SELECT B.sno, B.nm AS snm, A.hno, C.nm AS hnm
FROM t_studenthobby A
INNER JOIN t_student2 B
ON A.sno = B.sno
INNER JOIN t_hobby C
ON A.hno = C.hno;

DROP VIEW view_joinresult;

SELECT * FROM view_joinresult;

CREATE TABLE t_temp_1(
 id INT UNSIGNED PRIMARY KEY,
 nm VARCHAR(5) NOT NULL
);


CREATE TABLE t_temp_2(
 id INT UNSIGNED PRIMARY KEY,
 tid INT UNSIGNED,
 nm VARCHAR(5) NOT NULL
);

INSERT INTO t_temp_1 (id, nm)
VALUES (1, '가'), (2, '나'), (3, '다');

INSERT INTO t_temp_2 (id,tid, nm)
VALUES (1, 1, 'A'), (2, 1, 'B'), (3, 3, 'C'), (4, 4, 'D');

SELECT * FROM t_temp_1;
SELECT * FROM t_temp_2;

SELECT
A.id AS id2, A.tid AS tid, A.nm AS nm2
, B.id AS id1, B.nm AS nm1
FROM t_temp_2 A
INNER JOIN t_temp_1 B
ON A.id = B.tid;

SELECT
A.*, B.*
FROM t_temp_1 A
LEFT JOIN t_temp_2 B
ON A.id = B.tid;

SELECT
A.*
, IFNULL(B.id, 0) AS id 
, IFNULL(B.nm, '값 없음') Aview_joinresultS nm
FROM t_temp_2 A
LEFT JOIN t_temp_1 B
ON A.tid = B.id;
ORDER BY A.tid;






