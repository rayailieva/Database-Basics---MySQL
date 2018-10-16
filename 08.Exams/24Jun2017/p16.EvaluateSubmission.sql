DELIMITER $$
CREATE PROCEDURE udp_evaluate(id INT)
BEGIN
	START TRANSACTION;
    IF(SELECT s.id
	   FROM submissions AS s
       WHERE s.id = id) IS NULL THEN
       SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Submission does not exist!';
        ROLLBACK;
	ELSE 
		INSERT INTO evaluated_submissions
        SELECT 
                s.id,
                p.name,
                u.username,
                CEIL(p.points / p.tests * s.passed_tests)
            FROM
                (SELECT *
                FROM submissions AS s1
                WHERE s1.id = id) AS s
				 JOIN problems AS p 
					ON s.problem_id = p.id
				JOIN users AS u 
					ON s.user_id = u.id;
    END IF;
END $$

CALL udp_evaluate(1);