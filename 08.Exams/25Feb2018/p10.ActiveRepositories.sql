SELECT 
    r.id, r.name, COUNT(i.id) AS 'issues'
FROM
    repositories AS r
        JOIN
    issues AS i ON r.id = i.repository_id
GROUP BY r.id
ORDER BY issues DESC , r.id
LIMIT 5;
