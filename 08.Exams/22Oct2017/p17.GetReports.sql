CREATE FUNCTION udf_get_reports_count(employee_id INT, status_id INT)
RETURNS INT
RETURN (
	SELECT COUNT(r.employee_id)
    FROM reports AS r
    WHERE r.employee_id = employee_id
		AND r.status_id = status_id);
    