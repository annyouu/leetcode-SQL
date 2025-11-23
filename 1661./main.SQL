-- SELECT
-- a.machine_id,
-- ROUND(AVG(e.timestamp - s.timestamp), 3) AS processing_time
-- FROM Activity a
-- JOIN Activity s
--     ON a.machine_id = s.machine_id
--     AND a.process_id = s.process_id
--     AND s.activity_type = 'start'
-- JOIN Activity e
--     ON a.machine_id = e.machine_id
--     AND a.process_id = e.process_id
--     AND e.activity_type = 'end'
-- GROUP BY a.machine_id;

SELECT machine_id,
ROUND(AVG(t.end_time - t.start_time), 3) AS processing_time
FROM (
    SELECT machine_id, process_id,
        MAX(
            CASE
                WHEN activity_type = 'start' THEN timestamp
            END
        ) AS start_time,
        MAX(
            CASE
                WHEN activity_type = 'end' THEN timestamp
            END
        ) AS end_time
    FROM Activity
    GROUP BY machine_id, process_id
) t
GROUP BY machine_id;