DELIMITER $$
CREATE TRIGGER tr_report_closed
BEFORE UPDATE 
ON reports
FOR EACH ROW
BEGIN
	IF (ISNULL(OLD.close_date) <> ISNULL(NEW.close_date)) THEN
        SET NEW.status_id = 3;
    END IF;
END $$