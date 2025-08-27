--Find the names of sailors who have reserved at least one boat

BEGIN;

PREPARE s_r AS


SELECT DISTINCT s.name       --projection
FROM sailors AS s
JOIN reserves AS r
ON r.sid = s.id;             --equijoin


EXECUTE s_r;

COMMIT;
