SELECT 
    CONCAT_WS(' ', e.first_name, e.last_name) AS 'name',
    COUNT(r.user_id) AS 'users_count'
FROM
    employees AS e
        LEFT JOIN
    reports AS r ON e.id = r.employee_id
GROUP BY `name`
ORDER BY `users_count` DESC , `name`;