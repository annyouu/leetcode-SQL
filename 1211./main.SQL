-- SELECT query_name, (
--     ROUND(AVG(rating / position), 2)
-- ) AS quality,
-- (
--     ROUND(100 * COUNT(CASE WHEN rating < 3 THEN 1 END) / COUNT(*), 2)
-- ) AS poor_query_percentage
-- FROM Queries
-- GROUP BY (query_name);

-- より早くする方法

WITH cte AS (
    SELECT
        query_name,
        rating / position AS quality_ratio,
        CASE WHEN rating < 3 THEN 1 ELSE 0 END AS is_poor_query
    FROM Queries
)
SELECT query_name, (
    ROUND(AVG(quality_ratio), 2)
) AS quality, (
    ROUND((SUM(is_poor_query) / COUNT(*)) * 100, 2)
) AS poor_query_percentage
FROM cte
GROUP BY (query_name);