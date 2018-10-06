SELECT 
    f.id, f.name, CONCAT(f.size, 'KB') AS 'size'
FROM
    files AS f
LEFT JOIN files AS fi
    ON f.id = fi.parent_id
WHERE fi.id IS NULL;