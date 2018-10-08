SELECT DISTINCT
    c.name AS 'category_name'
FROM
    categories AS c
        JOIN
    reports AS r ON c.id = r.category_id
        JOIN
    users AS u ON r.user_id = u.id
WHERE
    DAY(r.open_date) = DAY(u.birthdate)
        AND MONTH(r.open_date) = MONTH(u.birthdate)
ORDER BY c.name;    
