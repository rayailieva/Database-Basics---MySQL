UPDATE journeys AS j
SET j.purpose = IF(MOD(j.id, 2), 'Medical', 	
				IF(MOD(j.id, 3), 'Technical',
                IF(MOD(j.id, 5), 'Educational',
                IF(MOD(j.id, 7), 'Military',
                j.purpose))));
	
    
