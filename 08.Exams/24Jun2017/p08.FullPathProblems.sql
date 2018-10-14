SELECT p.id,
	   CONCAT_WS(' - ', ca.name, co.name, p.name) AS 'full_path'
FROM problems AS p
JOIN contests AS co
	ON p.contest_id = co.id
JOIN categories AS ca
	ON co.category_id = ca.id
ORDER BY p.id;