--Find the names of sailors who have reserved at least one boat

BEGIN;

SELECT DISTINCT s.name       --projection
FROM sailors AS s
JOIN reserves AS r
ON r.sid = s.id;             --equijoin

COMMIT;
