BEGIN;
SELECT DISTINCT name       --projection
FROM sailors AS s
JOIN reserves AS r
ON r.sid = s.id             --equijoin
WHERE bid = 103;            --selection
COMMIT;
