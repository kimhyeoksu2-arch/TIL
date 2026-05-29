SELECT MAX(salary) AS SecondHighestSalary 
FROM (
    SELECT *
        , DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
    FROM Employee
) AS t
WHERE rnk = 2
