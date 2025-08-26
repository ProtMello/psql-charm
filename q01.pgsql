SELECT DISTINCT sname       --projection
FROM Sailors
JOIN Reserves USING (sid)   --equijoin
WHERE bid = 103;            --selection
