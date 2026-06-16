SELECT Email 
FROM (
    SELECT email
        , COUNT(*) AS CNT
    FROM Person 
    GROUP BY email
) AS t
WHERE CNT >= 2
