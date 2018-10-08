SELECT u.id, u.username, COUNT(p.user_id) AS 'my_comments'
FROM users AS u
 JOIN posts AS p
	ON u.id = p.user_id
 JOIN comments AS c
 ON p.id = c.post_id
WHERE p.user_id = c.user_id
GROUP BY u.id
ORDER BY `my_comments` DESC, u.id;

SELECT u.id, u.username
FROM users AS u
 JOIN posts AS p
  ON u.id = p.user_id
  LEFT JOIN comments AS c
  ON p.id = c.post_id
UNION
SELECT u.id, u.username
FROM users AS u
 JOIN posts AS p
  ON u.id = p.user_id
  RIGHT JOIN comments AS c
  ON p.id = c.post_id;
  
  
