UPDATE users AS u
JOIN 
	(SELECT
			uf.user_id AS 'id',
			COUNT(uf.follower_id) AS 'followers'
     FROM users_followers AS uf
     GROUP BY uf.user_id) AS m
SET u.profile_picture_id =
	IF(m.followers > 0, m.followers, 0)
WHERE u.profile_picture_id IS NULL;