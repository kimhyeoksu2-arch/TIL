WITH cal AS (
    SELECT query_name
        , rating/position AS percentage
        , CASE WHEN rating < 3 THEN 1 ELSE 0 END AS rate
    FROM Queries
)

SELECT query_name
    , ROUND(SUM(percentage) / COUNT(*), 2) AS quality
    , ROUND(SUM(rate) / COUNT(*) * 100, 2) AS poor_query_percentage 
FROM cal
GROUP BY query_name
