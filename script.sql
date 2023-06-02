CREATE TABLE employee (
                          id BIGSERIAL NOT NULL PRIMARY KEY,
                          first_name VARCHAR(50) NOT NULL,
                          last_name VARCHAR(50) NOT NULL,
                          gender VARCHAR(6) NOT NULL,
                          age INT NOT NULL
);
INSERT INTO employee(first_name,last_name, gender, age) VALUES ('Иван', 'Иванов', 'м', 25);
INSERT INTO employee(first_name,last_name, gender, age) VALUES ('Пётр', 'Петров', 'м', 48);
INSERT INTO employee(first_name,last_name, gender, age) VALUES ('Елена', 'Андреева', 'ж', 47);
INSERT INTO employee(first_name,last_name, gender, age) VALUES ('Сергей', 'Сергеев', 'м', 55);
INSERT INTO employee(first_name,last_name, gender, age) VALUES ('Мария', 'Сидорова', 'ж', 28);

SELECT*FROM employee;

UPDATE employee SET first_name = 'Василий', last_name = 'Васильев', gender = 'м', age = 41 WHERE id = 2;
DELETE FROM employee WHERE id = 3;
SELECT*FROM employee;
SELECT*FROM employee;