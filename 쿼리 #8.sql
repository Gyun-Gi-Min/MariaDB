-- 데이터 사전.

-- DB에 있는 모든 테이블 조회
SHOW full TABLES;

-- 특정 테이블 인덱스 조회
SHOW INDEX FROM t_student2;

-- DB에 있는 모든 view 조회
SHOW FULL TABLES WHERE table_type = 'view';