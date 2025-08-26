--Find the names of sailors who have reserved a red and a green boat

BEGIN;

WITH redgreen AS (
    SELECT DISTINCT sid         --projection
    FROM boats b 
    JOIN reserves r
    ON r.bid = b.id             --equijoin
    WHERE color = 'green'       --selection
    INTERSECT
    SELECT DISTINCT sid         --projection
    FROM boats b 
    JOIN reserves r
    ON r.bid = b.id             --equijoin
    WHERE color = 'red'         --selection
)
SELECT DISTINCT s.name
FROM sailors s
JOIN redgreen rg
ON rg.sid = s.id;

COMMIT;
