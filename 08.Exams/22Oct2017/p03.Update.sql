UPDATE reports AS r 
SET 
    r.status_id = 2
WHERE
    r.status_id = 1 AND r.category_id = 4;