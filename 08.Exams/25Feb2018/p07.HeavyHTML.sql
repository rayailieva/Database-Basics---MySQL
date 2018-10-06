SELECT f.id, f.name, f.size
FROM files AS f
WHERE f.size > 1000 AND  f.name LIKE '%html%'
ORDER BY f.size DESC;