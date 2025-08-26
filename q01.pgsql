SELECT DISTINCT s.sname         --projection
FROM Sailors s
WHERE EXISTS (
    SELECT 1 FROM Reserves r    --equijoin
    WHERE r.sid = s.sid 
    AND r.bid = 103             --selection
);
