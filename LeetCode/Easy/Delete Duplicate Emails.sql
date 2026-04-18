## 내 풀이

WITH Email_Cnt AS (
    SELECT id
        , email
        , COUNT(*) OVER (PARTITION BY email ORDER BY id) AS CNT
    FROM Person
)

DELETE FROM Person
WHERE id IN (SELECT id FROM Email_Cnt WHERE CNT >= 2)

## 깔끔한 풀이 (Self Join)

DELETE p1 
FROM Person p1, Person p2
WHERE p1.email = p2.email 
  AND p1.id > p2.id;  

## 깔끔한 풀이 2

DELETE FROM Person 
WHERE id NOT IN (
    SELECT min_id 
    FROM (SELECT MIN(id) AS min_id FROM Person GROUP BY email) t
);
