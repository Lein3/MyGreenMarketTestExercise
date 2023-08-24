CREATE MATERIALIZED VIEW public."UsersSalary"
AS
WITH RECURSIVE CTE ("ID", "ID_Owner", "Salary", depth) AS (
SELECT FIRSTLEVEL."ID", FIRSTLEVEL."ID" AS ID_OWNER, FIRSTLEVEL."Salary", 1 FROM "Users" AS FIRSTLEVEL
UNION ALL 
SELECT CTE."ID", NEXTLEVEL."ID", NEXTLEVEL."Salary", depth + 1 FROM "Users" AS NEXTLEVEL
INNER JOIN CTE ON CTE."ID_Owner" = NEXTLEVEL."ID_Owner"
where depth < 10), --ограничим уровни вложенности 10 чтобы не уходить в бесконечный цикл

CTE2 AS (
SELECT CTE."ID", SUM(CTE."Salary") AS "TotalSalaryWithChildren"
FROM CTE
GROUP BY CTE."ID")

SELECT 
	"Users"."Name",
	CTE2."TotalSalaryWithChildren"
FROM CTE2
LEFT JOIN "Users" ON "Users"."ID" = CTE2."ID"
WITH DATA;

ALTER TABLE IF EXISTS public."UsersSalary"
    OWNER TO postgres;
	
--SELECT * FROM public."UsersSalary"