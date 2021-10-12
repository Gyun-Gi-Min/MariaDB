CREATE TABLE t_student2(
	sno INT UNSIGNED AUTO_INCREMENT,
	nm VARCHAR(5) NOT NULL,
	age INT NOT NULL,
	addr VARCHAR(20),
	PRIMARY KEY(sno)
);


SELECT * FROM t_student2;

CREATE TABLE t_hobby(
	hno INT UNSIGNED AUTO_INCREMENT,
	nm VARCHAR(10) NOT NULL,
	PRIMARY KEY (hno)
);

DROP TABLE t_student2;

INSERT INTO t_student2
(nm, age, addr)
VALUES
('홍길동', 20, '서울'), 
('신사임당', 22, '대구'),
('강감찬', 24, '부산'),
('유관순', 26, '부산'),
('동찬', 28, '부산');


INSERT INTO t_student2
(nm, age, addr)
VALUES
('유관순', 26, '대전');

INSERT INTO t_hobby
(nm)
VALUES
('게임'),  ('배타기'), ('수영'), ('등산'), ('명상'), ('붓글씨'), ('독서');

SELECT * FROM t_hobby;

DROP TABLE t_studenthobby;
CREATE TABLE t_studenthobby(
	sno INT UNSIGNED,
	hno INT UNSIGNED,
	PRIMARY KEY (sno, hno),
	FOREIGN KEY (sno) REFERENCES t_student2 (sno),
	FOREIGN KEY (hno) REFERENCES t_hobby (hno)
);

SELECT * FROM t_studenthobby;

INSERT INTO t_studenthobby
(sno, hno)
VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 6),
(2, 5),
(3, 2);

INSERT INTO t_studenthobby
(sno, hno)
VALUES
(4, 5),
(4, 6);  -- 못넣음.


INSERT INTO t_studenthobby
(sno, hno)
VALUES
(10, 10);

-- 알리아스 Alias

SELECT A.snoCREATE TABLE t_student2(
	sno INT UNSIGNED AUTO_INCREMENT,
	nm VARCHAR(5) NOT NULL,
	age INT NOT NULL,
	addr VARCHAR(20),
	PRIMARY KEY(sno)
)-- 알리아스 Alias
SELECT A.sno as ss, A.hno as hh
FROM t_studenthobby A as ss, A.hno  as hh
FROM t_studenthobby A;

SELECT t_studenthobby.sno 
FROM t_studenthobby;

SELECT B.nm, C.nm
FROM t_studenthobby A
INNER JOIN t_student2 B
ON A.sno = B.sno
INNER JOIN t_hobby C
ON A.hno = C.hno;

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
view_joinresult