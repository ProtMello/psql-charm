--Find the names of sailors who have reserved at least two boats

BEGIN;

PREPARE s_two_b AS


WITH rs AS (
    SELECT DISTINCT s.name,sid,bid
    FROM sailors s
    JOIN reserves r
    ON r.sid = s.id
)
SELECT DISTINCT rs1.name
FROM rs rs1
CROSS JOIN rs rs2
WHERE rs1.name = rs2.name
AND rs1.bid != rs2.bid;


EXECUTE s_two_b;

COMMIT;
