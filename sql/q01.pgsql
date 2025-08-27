--Find names of sailors who have reserved boat 103

DEALLOCATE ALL;


BEGIN;

PREPARE s_103(int) AS


SELECT DISTINCT name       --projection
FROM sailors AS s
JOIN reserves AS r
ON r.sid = s.id             --equijoin
WHERE bid = $1;            --selection


EXECUTE s_103(103);

COMMIT;
