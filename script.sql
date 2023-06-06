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

INSERT INTO employee(first_name,last_name, gender, age) VALUES ('Иван', 'Иванов', 'м', 31);
SELECT first_name AS Имя,last_name AS Фамилия FROM employee;
SELECT*FROM employee WHERE age <30 OR age> 50;
SELECT*FROM employee WHERE age BETWEEN 30 AND 50;
SELECT*FROM employee ORDER BY last_name DESC;
SELECT*FROM employee WHERE first_name LIKE '_ _ _ _ _%';

UPDATE employee SET first_name = 'Иван' WHERE id = 4;
UPDATE employee SET first_name = 'Иван' WHERE id = 2;
SELECT first_name AS Имя, SUM(age) AS суммарный_возраст FROM employee GROUP BY Имя;
SELECT first_name, age FROM employee WHERE age=(SELECT MIN(age) FROM employee);
SELECT first_name, age FROM employee WHERE age IN (SELECT MAX(age) FROM employee GROUP BY first_name HAVING COUNT (first_name)>1) ORDER BY 2;
SELECT*FROM employee;

CREATE TABLE city (
                      city_id BIGSERIAL NOT NULL PRIMARY KEY,
                      city_name VARCHAR(30) NOT NULL);

ALTER TABLE employee ADD city_id INT;
ALTER TABLE employee ADD CONSTRAINT city_id FOREIGN KEY(city_id) REFERENCES city(city_id);

INSERT INTO city (city_name) VALUES ('Омск');
INSERT INTO city (city_name) VALUES ('Томск');
INSERT INTO city (city_name) VALUES ('Новосибирск');
INSERT INTO city (city_name) VALUES ('Красноярск');
INSERT INTO city (city_name) VALUES ('Екатеринбург');

UPDATE employee SET city_id=1 WHERE id = 1;
UPDATE employee SET city_id=1 WHERE id = 1;
UPDATE employee SET city_id=3 WHERE id = 5;
UPDATE employee SET city_id=4 WHERE id = 4;
UPDATE employee SET city_id=5 WHERE id = 8;
UPDATE employee SET city_id=5 WHERE id = 9;

--1
SELECT first_name, last_name, city_name FROM employee
                                                 INNER JOIN city ON employee.city_id=city.city_id;

--2
SELECT first_name, last_name, city_name FROM city
                                                 LEFT JOIN employee ON city.city_id=employee.city_id;

--3
SELECT first_name, city_name FROM employee FULL JOIN city ON employee.city_id=city.city_id;

--4
SELECT first_name, city_name FROM employee CROSS JOIN city;

--5
SELECT city_name FROM city LEFT JOIN employee ON city.city_id=employee.city_id WHERE employee.first_name IS NULL;

SELECT*FROM employee;
SELECT*FROM city;