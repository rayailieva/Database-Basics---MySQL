INSERT INTO travel_cards(card_number, job_during_journey, colonist_id,journey_id)
SELECT
	IF(c.birth_date > '1980-01-01' , 
    CONCAT(YEAR(c.birth_date), MONTH(c.birth_date), LEFT(c.ucn, 4)),
    CONCAT(YEAR(c.birth_date), MONTH(c.birth_date), RIGHT(c.ucn, 4))) AS card_number,
	IF(MOD(c.id, 2), 'Pilot',
	  IF(MOD(c.id, 3), 'Cook', 'Engineer')) AS 'job_during_journey',
    c.id AS colonist_id,
    LEFT(c.ucn, 1) AS journey_id
FROM colonists AS c
WHERE c.id BETWEEN 96 AND 100;