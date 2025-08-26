--Find the names of sailors who have reserved a red or a green boat

BEGIN;

WITH red_green AS (
    SELECT DISTINCT sid         --projection
    FROM boats b 
    JOIN reserves r
    ON r.bid = b.id             --equijoin
    WHERE color = 'green'       --selection
    UNION
    SELECT DISTINCT sid         --projection
    FROM boats b 
    JOIN reserves r
    ON r.bid = b.id             --equijoin
    WHERE color = 'red'         --selection
)
SELECT DISTINCT s.name
FROM sailors s
JOIN red_green rg
ON rg.sid = s.id;

COMMIT;
