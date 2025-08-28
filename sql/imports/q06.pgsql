--Find the names of sailors who have reserved a red and a green boat

DEALLOCATE ALL;


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


WITH rb AS (
    SELECT r.sid, b.color
    FROM reserves r
    JOIN boats b 
    ON b.id = r.bid
),
redgreen_s AS (
    SELECT sid FROM rb 
    WHERE color = 'red'
    INTERSECT
    SELECT sid FROM rb 
    WHERE color = 'green'
)
SELECT s.name
FROM sailors s
JOIN redgreen_s rg ON rg.sid = s.id;


EXECUTE sname_rg2;

COMMIT;
