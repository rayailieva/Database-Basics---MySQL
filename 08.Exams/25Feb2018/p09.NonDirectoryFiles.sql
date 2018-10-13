SELECT f.id, f.name, CONCAT(f.size, 'KB') AS 'size'
FROM files AS f
LEFT JOIN files AS f2
	ON f.id = f2.parent_id
WHERE f2.id IS NULL
ORDER BY f.id;