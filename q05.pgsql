--Find the names of sailors who have reserved a red or a green boat

BEGIN;

WITH green_s  AS (
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
 red_green AS (
    SELECT sid FROM green_s
    UNION
    SELECT sid FROM red_s
)
SELECT DISTINCT s.name
FROM sailors s
JOIN red_green rg
ON rg.sid = s.id;

COMMIT;



BEGIN;

WITH red_green AS (
    SELECT DISTINCT sid
    FROM boats b
    JOIN reserves r 
    ON r.bid = b.id
    WHERE b.color = 'red'
    OR b.color = 'green'
)
SELECT DISTINCT s.name
FROM sailors s
JOIN red_green rg ON rg.sid = s.id;

COMMIT;
