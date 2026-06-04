CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      WITH RNK_TABLE AS (
        SELECT id
                , salary
                , DENSE_RANK() OVER(ORDER BY salary DESC) AS RNK
        FROM Employee  
      )

      SELECT MAX(salary) 
      FROM RNK_TABLE
      WHERE RNK = N

  );
END
