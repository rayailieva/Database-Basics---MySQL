DELIMITER $$
CREATE PROCEDURE udp_modify_spaceship_light_speed_rate
	(spaceship_name VARCHAR(50), light_speed_rate_increse INT(11)) 
BEGIN
	START TRANSACTION;
    IF(SELECT COUNT(s.id)
		FROM spaceships AS s
        WHERE s.name = spaceship_name) = 0 THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Spaceship you are trying to modify does not exists.';
        ROLLBACK;
	ELSE
		UPDATE spaceships AS s
        SET s.light_speed_rate = s.light_speed_rate + light_speed_rate_increse
        WHERE s.name = spaceship_name;
    END IF;
END $$


CALL udp_modify_spaceship_light_speed_rate ('USS Templar', 5);
SELECT name, light_speed_rate FROM spaceships WHERE name = 'USS Templar'
