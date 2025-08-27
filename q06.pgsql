--Find the names of sailors who have reserved a red and a green boat

BEGIN;

WITH green_s AS (
    SELECT DISTINCT sid         --projection
    FROM boats b 
    JOIN reserves r
    ON r.bid = b.id             --equijoin
    WHERE color = 'green'       --selection
),
red_s AS (
    SELECT DISTINCT sid         --projection
    FROM boats b 
    JOIN reserves r
    ON r.bid = b.id             --equijoin
    WHERE color = 'red'         --selection
),
redgreen_s AS (
    SELECT sid FROM green_s
    INTERSECT
    SELECT sid FROM red_s
)
SELECT DISTINCT s.name
FROM sailors s
JOIN redgreen rg
ON rg.sid = s.id;

COMMIT;
