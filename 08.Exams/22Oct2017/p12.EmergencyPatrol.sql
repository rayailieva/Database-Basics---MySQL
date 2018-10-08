SELECT 
    r.open_date, r.description, u.email AS 'reporter_email'
FROM
    reports AS r
        JOIN
    users AS u ON r.user_id = u.id
        JOIN
    categories AS c ON r.category_id = c.id
WHERE
    c.department_id IN (1 , 4, 5)
        AND r.close_date IS NULL
        AND (LENGTH(r.description) > 20
        AND r.description LIKE '%str%')
ORDER BY r.open_date , `reporter_email` , r.id;