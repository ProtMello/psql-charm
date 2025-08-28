--Find names of sailors who have reserved boat 103

SELECT DISTINCT s.name
FROM sailors AS s
JOIN reserves AS r 
ON r.sid = s.id
WHERE r.bid = $1;

