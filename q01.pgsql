--Find names of sailors who have reserved boat 103

BEGIN;

PREPARE s_103 AS


SELECT DISTINCT name       --projection
FROM sailors AS s
JOIN reserves AS r
ON r.sid = s.id             --equijoin
WHERE bid = 103;            --selection


EXECUTE s_103;

COMMIT;
