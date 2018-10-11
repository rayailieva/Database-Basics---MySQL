DELIMITER $$
CREATE PROCEDURE usp_get_holders_with_balance_higher_than(balance_number DECIMAL(19,4))
BEGIN
	SELECT ah.first_name, ah.last_name
    FROM account_holders AS ah
    JOIN accounts AS a
		ON ah.id = a.account_holder_id
	WHERE a.balance > balance_number
    ORDER BY ah.first_name, ah.last_name;
END $$

CALL usp_get_holders_with_balance_higher_than(7000);