SELECT 
request_at AS 'Day', 
ROUND(
    SUM(CASE WHEN status LIKE 'cancelled%' THEN 1 ELSE 0 END) / COUNT(*)
     ,2) AS 'Cancellation Rate'
FROM Trips t
LEFT JOIN Users u1 ON client_id = u1.users_id AND u1.role = 'client'
LEFT JOIN Users u2 ON driver_id = u2.users_id AND u2.role = 'driver'
WHERE u1.banned = 'No' AND u2.banned = 'No'
AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY request_at;