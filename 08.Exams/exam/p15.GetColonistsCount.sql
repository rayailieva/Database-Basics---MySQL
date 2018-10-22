DELIMITER $$
CREATE FUNCTION udf_count_colonists_by_destination_planet (planet_name VARCHAR (30))
RETURNS INT
BEGIN
	DECLARE result INT;
		SET result = (SELECT COUNT(tc.colonist_id)
        FROM planets AS p
        LEFT JOIN spaceports AS s
			ON p.id = s.planet_id
		LEFT JOIN journeys AS j
			ON s.id = j.destination_spaceport_id
		LEFT JOIN travel_cards AS tc
			ON j.id = tc.journey_id
		WHERE p.name = planet_name
        GROUP BY p.id);
        RETURN IF(result = 0, 0, result);
END $$

SELECT p.name, udf_count_colonists_by_destination_planet('Otroyphus') AS count
FROM planets AS p
WHERE p.name = 'Otroyphus';
