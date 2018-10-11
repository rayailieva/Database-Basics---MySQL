DELIMITER $$
CREATE FUNCTION ufn_get_salary_level(employee_salary DECIMAL(19,4))
RETURNS VARCHAR(10)
BEGIN
	DECLARE salary_level VARCHAR(10);
    IF(employee_salary < 30000) THEN
		SET salary_level = 'Low';
	ELSEIF(employee_salary <= 50000) THEN
		SET salary_level = 'Average';
	ELSE 
		SET salary_level = 'High';
	END IF;
    RETURN salary_level;
END;