DELIMITER $$
CREATE FUNCTION ufn_calculate_future_value(initial_sum DECIMAL(19,4),
		interest_rate DECIMAL(19,4),
        years INT)
RETURNS DECIMAL(19, 4)
#RETURNS DOUBLE(19, 2) -- Judge
READS SQL DATA
DETERMINISTIC
BEGIN
	RETURN initial_sum * POW((1 + interest_rate), years);
END $$