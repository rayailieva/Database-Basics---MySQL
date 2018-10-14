SELECT *
FROM(
SELECT c.id, c.name, COUNT(uc.user_id) AS 'contestants'
FROM contests AS c
JOIN users_contests AS uc
	ON c.id = uc.contest_id
GROUP BY c.id
ORDER BY `contestants` DESC, c.id LIMIT 5) AS b
ORDER BY b.contestants, b.id;