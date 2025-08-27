--Find the names of sailors who have reserved all boats called Interlake

BEGIN;

PREPARE int_s AS


SELECT DISTINCT s.name
FROM sailors s
WHERE NOT EXISTS (
    SELECT id FROM boats b
    WHERE b.name = 'Interlake'
    EXCEPT
    SELECT bid FROM reserves 
    WHERE sid = s.id
);


EXECUTE int_s;

COMMIT;
