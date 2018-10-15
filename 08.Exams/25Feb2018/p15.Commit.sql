DELIMITER $$
CREATE PROCEDURE udp_commit
	(username VARCHAR(30), password VARCHAR(30), message VARCHAR(255), issue_id INT)
BEGIN
	START TRANSACTION;
    IF(SELECT COUNT(u.id)
		FROM users AS u
        WHERE u.username = username) = 0 THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'No such user!';
        ROLLBACK;
    ELSEIF(SELECT u.password
		   FROM users AS u
           WHERE u.username = username) <> password THEN
           SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Password is incorrect!';
        ROLLBACK;
	ELSEIF(SELECT COUNT(i.id)
		   FROM issues AS i
           WHERE i.id = id) = 0 THEN
           SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'The issue does not exist!';
        ROLLBACK;
	ELSE
       INSERT INTO commits 
        (message, issue_id, repository_id, contributor_id)
       VALUES (
                message,
                issue_id,
                (SELECT i.repository_id FROM issues AS i WHERE i.id = issue_id),
				(SELECT u.id FROM users AS u WHERE u.username = username));
		UPDATE issues AS i 
        SET 
            i.issue_status = 'closed'
        WHERE
            i.id = issue_id;
        COMMIT;
    END IF;
END $$

CALL udp_commit('WhoDenoteBel', 'ajmISQi*', 'Fixed issue: blah', 2);