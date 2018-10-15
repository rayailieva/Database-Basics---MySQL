SELECT u2.id, u.username, COUNT(p.id) AS 'posts', u2.followers
FROM
	(SELECT 
		   uf.user_id AS 'id',
		   COUNT(uf.follower_id) AS 'followers'
    FROM users_followers AS uf
    GROUP BY uf.user_id) AS u2
JOIN users AS u
	ON u.id = u2.id
JOIN posts AS p
	ON u.id = p.user_id
GROUP BY u2.id
ORDER BY u2.followers DESC LIMIT 1;