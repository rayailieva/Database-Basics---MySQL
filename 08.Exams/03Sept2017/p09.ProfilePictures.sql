SELECT u.id, u.username, CONCAT(p.size,'KB') AS 'size'
FROM users AS u
JOIN pictures AS p
	ON u.profile_picture_id = p.id
GROUP BY u.profile_picture_id
HAVING COUNT(u.profile_picture_id) > 1
ORDER BY u.id;
