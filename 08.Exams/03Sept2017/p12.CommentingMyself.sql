SELECT 
    u.id, u.username, COUNT(c.user_id) AS 'my_comments'
FROM
    users AS u
        JOIN
    posts AS p ON u.id = p.user_id
        JOIN
    comments AS c ON p.id = c.post_id
WHERE
    u.id = c.user_id
GROUP BY u.id
ORDER BY `my_comments` DESC , u.id;