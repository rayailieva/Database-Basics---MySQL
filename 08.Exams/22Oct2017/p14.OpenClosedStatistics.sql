SELECT
 CONCAT_WS(' ', e.first_name, e.last_name) AS 'name',
 CONCAT_WS('/', CAST(COUNT(IF(YEAR(r.close_date) = 2016, 1, NULL))
                AS CHAR),
            CAST(COUNT(IF(YEAR(r.open_date) = 2016, 1, NULL))
                AS CHAR)) AS 'closed_open_reports'
FROM employees AS e
JOIN reports AS r
	ON e.id = r.employee_id
WHERE r.close_date IS NOT NULL
	AND (YEAR(r.open_date) = 2016 OR YEAR(r.close_date) = 2016)
GROUP BY `name`
ORDER BY `name`;