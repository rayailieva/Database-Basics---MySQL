DELIMITER $$
CREATE PROCEDURE udp_filter (hashtag VARCHAR(100))
BEGIN
	SELECT p.id, p.caption, u.username
    FROM posts AS p
    JOIN users AS u
		ON p.user_id = u.id
    WHERE p.caption LIKE (CONCAT('%', hashtag ,'%'))
    ORDER BY p.id;
END $$

CALL udp_filter('cool');