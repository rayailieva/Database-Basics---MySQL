DELETE u FROM users AS u
LEFT JOIN users_followers AS uf
ON u.id = uf.user_id
WHERE uf.follower_id IS NULL;