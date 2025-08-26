SELECT DISTINCT s.sname
FROM Sailors s
WHERE EXISTS (
    SELECT 1 FROM Reserves r
    WHERE r.sid = s.sid 
    AND r.bid = 103
);
