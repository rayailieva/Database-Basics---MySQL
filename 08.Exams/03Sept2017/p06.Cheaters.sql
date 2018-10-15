SELECT u.id, u.username
FROM users AS u
JOIN users_followers AS uf
	ON u.id = uf.user_id
WHERE u.id = uf.follower_id
ORDER BY u.id;