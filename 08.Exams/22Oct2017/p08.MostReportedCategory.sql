SELECT 
    c.name, COUNT(r.category_id) AS 'reports_number'
FROM
    categories AS c
        JOIN
    reports AS r ON c.id = r.category_id
GROUP BY c.name
ORDER BY `reports_number` , c.name;