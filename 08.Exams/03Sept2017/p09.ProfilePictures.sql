SELECT DISTINCT(u.id), u.username, CONCAT(p.size, 'KB') AS 'size'
FROM users AS u
JOIN pictures as p 
	ON u.profile_picture_id = p.id
JOIN users AS u2
	ON u.profile_picture_id = u2.profile_picture_id
WHERE u.id != u2.id
ORDER BY u.id;