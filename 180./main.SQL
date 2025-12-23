SELECT 
    DISTINCT d1.num AS 'ConsecutiveNums'
FROM Logs d1
JOIN Logs d2 ON d2.id = d1.id + 1
JOIN Logs d3 ON d3.id = d1.id + 2
WHERE d1.num = d2.num AND d1.num = d3.num;