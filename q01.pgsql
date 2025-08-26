SELECT DISTINCT sname       --projection
FROM Sailors
JOIN Reserves USING(sid)    --natural join
WHERE bid = 103;            --selection
