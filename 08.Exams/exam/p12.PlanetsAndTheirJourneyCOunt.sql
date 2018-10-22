SELECT p.name, COUNT(j.id) AS 'journeys_count'
FROM planets AS p
JOIN spaceports AS s
	ON p.id = s.planet_id
JOIN journeys AS j
	ON  s.id = j.destination_spaceport_id
GROUP BY p.id
ORDER BY `journeys_count` DESC, p.name;