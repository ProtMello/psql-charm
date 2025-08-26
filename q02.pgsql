BEGIN;
SELECT DISTINCT s.name        --projection
FROM sailors AS s
JOIN reserves AS r
ON r.sid = s.id
JOIN boats AS b 
ON b.id = r.bid
WHERE b.color = 'red';        --selection
COMMIT;
