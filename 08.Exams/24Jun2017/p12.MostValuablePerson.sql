SELECT s.id, u.username, p.name,
	CONCAT_WS(' / ', s.passed_tests, p.tests) AS 'result'
FROM submissions AS s
JOIN users AS u
	ON s.user_id = u.id
JOIN problems AS p
	ON s.problem_id = p.id
WHERE u.id = 
	(SELECT uc.user_id
    FROM users_contests AS uc
    GROUP BY uc.user_id
    ORDER BY COUNT(uc.contest_id) DESC LIMIT 1)
ORDER BY s.id DESC;