SELECT  * FROM t_product;

DROP TABLE t_product;


CREATE TABLE t_product(
iproduct INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
nm	VARCHAR(8) NOT NULL,
price INT(10) NOT NULL,
company VARCHAR(8) NOT NULL()
);

INSERT INTO t_product (nm,price,company)
VALUES ("맥북프로",5000000,'apple'),
("갤럭시s21",1500000,'samsung'),
("버즈",300000,'samsung'),
("에어팟",400000,'apple');

SELECT  * FROM t_product;
SELECT  * FROM t_product WHERE company='apple';

UPDATE t_product SET nm='버즈프로',price='250000' WHERE iproduct=3;

WHERE iproduct IN ( 2,3);
UPDATE t_product SET company = '삼성' WHERE company='samsung';

DELETE from t_product  WHERE iproduct=4;

SELECT company, COUNT(nm),SUM(price),AVG(price),MAX(price),MIN(price) 
FROM t_product;

SELECT company, COUNT(nm),SUM(price),AVG(price),MAX(price),MIN(price) 
FROM t_product
GROUP BY company;

-- java, sql,Android, JSP, HTML, CSS, Javascript