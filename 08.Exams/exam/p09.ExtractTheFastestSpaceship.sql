SELECT ssh.name AS 'spaceship_name',
		sp.name AS 'spaceport_name'
FROM spaceships AS ssh
JOIN journeys AS j
	ON ssh.id = j.spaceship_id
JOIN spaceports AS sp
	ON j.destination_spaceport_id = sp.id
ORDER BY ssh.light_speed_rate DESC LIMIT 1;