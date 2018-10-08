SELECT p.id, p.caption, COUNT(DISTINCT(c.user_id)) AS 'users'
FROM posts AS p
LEFT JOIN comments AS c
ON p.id = c.post_id
GROUP BY p.id
ORDER BY `users` DESC, p.id;