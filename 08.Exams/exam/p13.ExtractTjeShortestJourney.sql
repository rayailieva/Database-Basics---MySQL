SELECT j.id,
	p.name AS 'planet_name',
    s.name AS 'spaceport_name', 
    j.purpose AS 'journey_purpose'
FROM journeys AS j
JOIN spaceports AS s
	ON j.destination_spaceport_id = s.id
JOIN planets AS p
	ON s.planet_id = p.id
ORDER BY DATEDIFF(j.journey_end, j.journey_start) LIMIT 1;
    