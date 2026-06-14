SELECT DISTINCT(num) AS ConsecutiveNums 
FROM (
    SELECT id
        , num 
        , LAG(num, 1) OVER(ORDER BY id) AS num1
        , LAG(num, 2) OVER(ORDER BY id) AS num2
    FROM Logs
) AS t
WHERE num = num1 AND num = num2
