BEGIN;
WITH red_r AS (
    SELECT DISTINCT r.sid
    FROM boats b
    JOIN reserves r
    ON r.bid = b.id
    WHERE b.color = 'red'
)
SELECT DISTINCT s.name        --projection
FROM sailors s
JOIN red_r 
ON s.id = red_r.sid;
COMMIT;
