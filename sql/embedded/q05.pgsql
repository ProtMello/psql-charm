--Find the names of sailors who have reserved a red or a green boat

WITH red_green AS (
    SELECT DISTINCT sid
    FROM boats b
    JOIN reserves r 
    ON r.bid = b.id
    WHERE b.color = 'red'
    OR b.color = 'green'
)
SELECT DISTINCT s.name
FROM sailors s
JOIN red_green rg ON rg.sid = s.id;
