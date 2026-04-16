
-- Task 1

SELECT *
FROM TestMultipleZero
WHERE NOT (A = 0 AND B = 0 AND C = 0 AND D = 0);


-- Task 2

SELECT 
    Year1,
    (SELECT MAX(v) 
     FROM (VALUES (Max1), (Max2), (Max3)) AS value(v)
    ) AS MaxValue
FROM TestMax;


-- Task 3

SELECT *
FROM EmpBirth
WHERE MONTH(BirthDate) = 5
AND DAY(BirthDate) BETWEEN 7 AND 15;


-- Task 4

SELECT *
FROM letters
ORDER BY CASE WHEN letter = 'b' THEN 0 ELSE 1 END, letter;

SELECT *
FROM letters
ORDER BY CASE WHEN letter = 'b' THEN 1 ELSE 0 END, letter;

SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               ORDER BY CASE WHEN letter = 'b' THEN 1 ELSE 0 END, letter
           ) AS rn
    FROM letters
) t
ORDER BY CASE WHEN letter = 'b' THEN 3 ELSE rn END;
