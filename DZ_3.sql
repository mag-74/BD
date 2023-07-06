CREATE TABLE staff (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	name1 VARCHAR(45),
	surname VARCHAR(45),
	specialty VARCHAR(100),
	seniority INT, 
	salary INT, 
	age INT
);
INSERT INTO staff (name1, surname, specialty, seniority, salary, age)
VALUES
('Вася', 'Васькин', 'Начальник', 40, 100000, 60),
('Петя', 'Петькин', 'Начальник', 8, 70000, 30),
('Катя', 'Каткина', 'Инженер', 2, 70000, 25),
('Саша', 'Сашкин', 'Инженер', 12, 50000, 35),
('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
('Сидор', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юра', 'Юркин', 'Рабочий', 5, 15000, 25),
('Максим', 'Воронин', 'Рабочий', 2, 11000, 22),
('Юра', 'Галкин', 'Рабочий', 3, 12000, 24),
('Люся', 'Люськина', 'Уборщик', 10, 10000, 49);

SELECT * FROM staff
ORDER BY salary;

SELECT * FROM staff
ORDER BY salary DESC;

SELECT * FROM staff
ORDER BY salary
LIMIT 7, 5;

SELECT specialty, SUM(salary) AS sum FROM staff
GROUP BY specialty
HAVING sum > 100000;

CREATE TABLE salespeople(
	snum INT PRIMARY KEY, 
	sname VARCHAR(45),
	city VARCHAR(45),
	comm VARCHAR(45)
);

INSERT INTO salespeople (snum, sname, city, comm)
VALUES
(1001, 'Peel', 'London', '.12'),
(1002, 'Serres', 'San Jose', '.13'),
(1004, 'Motica', 'London', '.11'),
(1007, 'Rifkin', 'Barcelona', '.15'),
(1003, 'Axelrod', 'New York', '.10');

SELECT * FROM salespeople;

CREATE TABLE customers(
	cnum INT PRIMARY KEY, 
	cname VARCHAR(45),
	city VARCHAR(45),
	rating INT,
    snum INT
);

INSERT INTO customers (cnum, cname, city, rating, snum)
VALUES
(2001, 'Hoffman', 'London', 100, 1001),
(2002, 'Giovanni', 'Rome', 200, 1003),
(2003, 'Liu', 'San Jose', 200, 1002),
(2004, 'Grass', 'Berlin', 300, 1002),
(2006, 'Clemens', 'London', 100, 1001),
(2008, 'Cisneros', 'San Jose', 300, 1007),
(2007, 'Pereira', 'Rome', 100, 1004);

SELECT * FROM customers;

CREATE TABLE orders1(
	onum INT PRIMARY KEY, 
	amt DECIMAL(8,2),
	odate DATE,
	cnum INT,
    snum INT
);

INSERT INTO orders1(onum, amt, odate, cnum, snum)
VALUES
(3001, 18.69, '1990-03-10', 2008, 1007),
(3003, 767.19, '1990-03-10', 2001, 1001),
(3002, 1900.10, '1990-03-10', 2007, 1004),
(3005, 5160.45, '1990-03-10', 2003, 1002),
(3006, 1098.16, '1990-03-10', 2008, 1007),
(3009, 1713.23, '1990-04-10', 2002, 1003),
(3007, 75.75, '1990-04-10', 2004, 1002),
(3008, 4723.00, '1990-05-10', 2006, 1001),
(3010, 1309.95, '1990-06-10', 2004, 1002),
(3011, 9891.88, '1990-06-10', 2006, 1001);

SELECT * FROM orders1;

SELECT city, sname, snum, comm FROM salespeople;

SELECT cname, rating FROM customers
WHERE city = 'San Jose';

SELECT DISTINCT snum FROM salespeople;

SELECT cnum, cname, city, rating FROM customers
WHERE cname LIKE 'G%';

SELECT * FROM orders1
WHERE amt > 1000;

SELECT * FROM orders1
WHERE amt in (SELECT MIN(amt) FROM orders1);

SELECT cnum, cname, city, rating FROM customers
WHERE rating >= 100 AND city NOT IN ('Rome');