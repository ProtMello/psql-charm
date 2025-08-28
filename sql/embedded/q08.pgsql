--Find the sids of sailors with age over 20 who have not reserved a red boat

SELECT DISTINCT id AS sid
FROM sailors
WHERE age > 20
INTERSECT
SELECT DISTINCT sid
FROM boats b
JOIN reserves r
ON r.bid = b.id
WHERE b.color != 'red';
