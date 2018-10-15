CREATE TABLE logged_in_users (
	id INT,
    username VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(30) NOT NULL,
    email VARCHAR(50),
    CONSTRAINT pk_logged_in_users PRIMARY KEY (id)
);

CREATE TABLE evaluated_submissions (
	id INT AUTO_INCREMENT,
    problem VARCHAR(100) NOT NULL,
    user VARCHAR(30) NOT NULL,
    result INT NOT NULL,
    CONSTRAINT pk_evaluated_submissions PRIMARY KEY (id)
);


DELIMITER $$
CREATE PROCEDURE udp_login(username VARCHAR(30), password VARCHAR(30))
BEGIN
	START TRANSACTION;
    IF(SELECT COUNT(u.id)
		FROM users AS u
        WHERE u.username = username) = 0 THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Username does not exist!';
        ROLLBACK;
    ELSEIF(SELECT u.password
		   FROM users AS u
           WHERE u.username = username) <> password THEN
           SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Password is incorrect!';
        ROLLBACK;
    ELSEIF(SELECT COUNT(lu.id)
		FROM logged_in_users AS lu
        WHERE lu.username = username) > 0 THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'User is already logged in!';
        ROLLBACK;
	ELSE
		INSERT INTO logged_in_users
					(id, username, password,email)
		VALUES(
				(SELECT u.id
				FROM users AS u
                WHERE u.username = username),
                username,
                password,
                (SELECT u.email
				FROM users AS u
                WHERE u.username = username));
                COMMIT;
                END IF;
    END $$
    
    CALL udp_login('doge', 'doge');
