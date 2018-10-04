
CREATE TABLE persons
(
	person_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    passport_id INT NOT NULL
);

INSERT INTO persons (person_id, first_name, salary, passport_id)
VALUES (2, 'Tom', 56100.00, 103),
	   (3, 'Yana', 60200.00, 101);
       
CREATE TABLE passports
(
	passport_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    passport_number VARCHAR(50) NOT NULL
);

INSERT INTO passports(passport_id, passport_number)
VALUES (101, 'N34FG21B'),
		(102, 'K65LO4R7'),
        (103, 'K65LO4R7');
        
ALTER TABLE persons
ADD CONSTRAINT fk_persons_passports
FOREIGN KEY(passport_id) 
REFERENCES passports(passport_id);

