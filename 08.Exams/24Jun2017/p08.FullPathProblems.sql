SELECT p.id,
		CONCAT_WS(' - ', cat.name, con.name, p.name) AS 'full_path'
FROM problems AS p
JOIN contests AS con
	ON p.contest_id = con.id
JOIN categories AS cat
	ON con.category_id = cat.id
ORDER BY p.id;