--Find the names of sailors who have reserved all boats

BEGIN;

SELECT DISTINCT s.name
FROM sailors s
WHERE NOT EXISTS (
    SELECT id FROM boats
    EXCEPT
    SELECT bid FROM reserves 
    WHERE sid = s.id
);

COMMIT;
