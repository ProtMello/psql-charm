--Find the colors of boats reserved by Lubber

DEALLOCATE ALL;


BEGIN;

PREPARE lub_b AS


WITH lubber_r AS (
    SELECT DISTINCT r.bid       --projection 
    FROM reserves r
    JOIN sailors s
    ON r.sid = s.id
    WHERE s.name = 'Lubber'
)
SELECT DISTINCT b.color         --projection
FROM boats b
JOIN lubber_r 
ON b.id = lubber_r.bid;


EXECUTE lub_b;

COMMIT;
