DELIMITER $$
CREATE PROCEDURE usp_calculate_future_value_for_account(account_id INT,
		interest_rate DECIMAL(19,4))
BEGIN
	SELECT a.id, 
	ah.first_name,
    ah.last_name,
    a.balance,
	ufn_calculate_future_value(a.balance, interest_rate, 5) AS 'balance_in_5_years'
    FROM account_holders AS ah
    JOIN accounts AS a
		ON ah.id = a.account_holder_id
	WHERE a.id = account_id;
END $$

CALL usp_calculate_future_value_for_account(1, 0.1);