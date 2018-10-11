DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above(num DOUBLE(19,4))
BEGIN
	SELECT e.first_name, e.last_name
    FROM employees AS e
    WHERE e.salary >= num
    ORDER BY e.first_name, e.last_name;
END $$

CALL usp_get_employees_salary_above(48100);

DROP PROCEDURE IF EXISTS usp_get_employees_salary_above;