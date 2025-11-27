SELECT
    r.contest_id,
    ROUND(COUNT(DISTINCT r.user_id) / u.total_users * 100, 2) AS percentage
FROM Register r
CROSS JOIN
    (SELECT COUNT(*) AS total_users FROM Users) u
GROUP BY
    r.contest_id, u.total_users
ORDER BY
    percentage DESC,
    r.contest_id ASC;