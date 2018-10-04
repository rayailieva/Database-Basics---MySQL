CREATE TABLE teachers
(
	teacher_id INT NOT NULL UNIQUE AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    manager_id INT DEFAULT NULL
)AUTO_INCREMENT=101;

INSERT 
	INTO `teachers`
		(`name`, `manager_id`)
    VALUES
		('John', NULL),
        ('Maya', 106),
        ('Silvia', 106),
        ('Ted', 105),
        ('Mark', 101),
        ('Greta', 101);

ALTER TABLE teachers
ADD CONSTRAINT pk_teachers
	PRIMARY KEY (teacher_id),
ADD CONSTRAINT fk_teachers_manager_id
	FOREIGN KEY (manager_id)
    REFERENCES teachers(teacher_id);