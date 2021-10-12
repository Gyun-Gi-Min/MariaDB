SELECT
*,if(age >=24,'성인',
		if(age=22,'스물둘','청소년')) AS typ
FROM t_student2;

-- 25이상 >> 성인
-- 24 >> 스물넷
-- 23 >> 스물셋
-- 22 >> 스물둘
-- 나머지 청소년


SELECT *,
case when age >= 25 then '성인'
		when age = 24 then '스물넷'
		when age = 23 then '스물셋'
		when age = 22 then '스물둘'
		ELSE '청소년'
END AS typ
FROM t_student2;


SELECT
*,
case addr when '서울' then '대도시'
			 when '부산' then '중도시'
			 ELSE '소도시'
END AS TYP2
FROM t_student2;