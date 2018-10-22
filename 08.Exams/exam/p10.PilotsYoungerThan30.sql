SELECT DISTINCT(s.name), s.manufacturer
FROM spaceships AS s
JOIN journeys AS j
	ON s.id = j.spaceship_id
JOIN travel_cards AS tc
	ON j.id = tc.journey_id
JOIN colonists AS c
	ON tc.colonist_id = c.id
WHERE (DATEDIFF('2019-01-01', STR_TO_DATE(c.birth_date, '%Y-%m-%d'))/365) < 30
AND tc.job_during_journey = 'Pilot'
ORDER BY s.name;