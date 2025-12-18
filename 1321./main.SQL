WITH daily AS (
    SELECT
        visited_on,
        SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
)

SELECT
FROM daily d1
JOIN daily d2
ON d2.visited_on BETWEEN d1.visited_on - INTERVAL 6 DAY
AND d1.visited_on
GROUP BY d1.visited_on
HAVING COUNT(*) = 7
ORDER BY d1.visited_on;