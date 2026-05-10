SELECT Department
    , Employee
    , Salary
FROM (
    SELECT d.name AS Department
        , e.name AS Employee
        , salary AS Salary
        , DENSE_RANK() OVER(PARTITION BY d.name ORDER BY salary DESC) AS rnk
    FROM Employee e 
        JOIN Department d ON e.departmentId = d.id
) AS t 
WHERE rnk <= 3
