SELECT w1.id
FROM Weather w1
INNER JOIN Weather w2
ON DATEDIFF(w1.RecordDate, w2.RecordDate) = 1
WHERE w1. Temperature > w2.Temperature;