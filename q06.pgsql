--Find the names of sailors who have reserved a red and a green boat

BEGIN;

PREPARE sname_rg AS 


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
JOIN redgreen_s rg
ON rg.sid = s.id;


EXECUTE sname_rg;

COMMIT;


--version 2

BEGIN;

PREPARE sname_rg2 AS 


WITH redgreen_s AS (
    SELECT DISTINCT sid
    FROM boats b
    JOIN reserves r 
    ON r.bid = b.id
    WHERE b.color = 'red'
    AND b.color = 'green'
)
SELECT DISTINCT s.name
FROM sailors s
JOIN redgreen_s rg ON rg.sid = s.id;


EXECUTE sname_rg2;

COMMIT;
