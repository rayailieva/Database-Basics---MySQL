DELIMITER $$
CREATE PROCEDURE udp_commit
	(username VARCHAR(50), password VARCHAR(50), caption VARCHAR(200), path VARCHAR(200))
BEGIN
	START TRANSACTION;
    IF(
		SELECT u.password
        FROM users AS u
		WHERE u.username = username) != password
	THEN 
    SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Password is incorrect!';
        ROLLBACK;
	ELSEIF(
			SELECT p.path
            FROM pictures AS p
            WHERE p.path = path) IS NULL 
	THEN
		SIGNAL SQLSTATE '45000' 
           SET MESSAGE_TEXT = 'The picture does not exist!';
       ROLLBACK;	
	ELSE
		INSERT INTO posts(caption, user_id, picture_id)
        VALUES
			 (caption,
             (SELECT u.id
			 FROM users AS u
             WHERE u.username = username),
             (SELECT p.id
             FROM pictures AS p
             WHERE p.path = path AND p.caption = caption));
             COMMIT;
             END IF;
END $$