--Find the names of sailors who have reserved all boats

BEGIN;

PREPARE s_all_b AS


SELECT DISTINCT s.name
FROM sailors s
WHERE NOT EXISTS (
    SELECT id FROM boats
    EXCEPT
    SELECT bid FROM reserves 
    WHERE sid = s.id
);


EXECUTE s_all_b;

COMMIT;
