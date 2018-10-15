INSERT INTO comments
			(content, user_id, post_id)
SELECT 
	CONCAT('Omg!', u.username, '!This is so cool!'),
    CEIL((p.id * 3) / 2),
    p.id
FROM posts AS p
JOIN users AS u
	ON p.user_id = u.id
WHERE p.id BETWEEN 1 AND 10;