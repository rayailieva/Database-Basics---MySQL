DELIMITER $$
CREATE PROCEDURE udp_findbyextension(extension VARCHAR(20))
BEGIN
	SELECT f.id, 
    f.name AS 'caption', 
    CONCAT(f.size, 'KB') AS 'user'
    FROM files AS f
    WHERE f.name LIKE (CONCAT('%',extension))
    ORDER BY f.id;
END $$

CALL udp_findbyextension('html');