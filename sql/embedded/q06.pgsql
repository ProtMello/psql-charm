--Find the names of sailors who have reserved a red and a green boat

WITH rb AS (
    SELECT r.sid, b.color
    FROM reserves r
    JOIN boats b 
    ON b.id = r.bid
),
redgreen_s AS (
    SELECT sid FROM rb 
    WHERE color = 'red'
    INTERSECT
    SELECT sid FROM rb 
    WHERE color = 'green'
)
SELECT s.name
FROM sailors s
JOIN redgreen_s rg ON rg.sid = s.id;
