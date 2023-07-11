USE `mag-db`;

CREATE TABLE cars(
	id SERIAL PRIMARY KEY,
    carname VARCHAR(40),
    cost INT
);

INSERT INTO cars (carname, cost)
VALUES 
('Audi', 52642),
('Mercedes', 51127),
('Skoda', 9000),
('Volvo', 29000),
('Bentley', 350000),
('Citroen', 21000),
('Hummer', 41400),
('Volkswagen', 21600);

SELECT * FROM cars;

CREATE VIEW cars1 AS
SELECT * FROM cars
WHERE cost < 25000;

SELECT * FROM cars1;

ALTER VIEW cars1 AS
SELECT * FROM cars
WHERE cost < 30000;

SELECT * FROM cars1;

CREATE VIEW cars2 AS
SELECT * FROM cars
WHERE carname in ('Audi', 'Skoda');

SELECT * FROM cars2;

CREATE TABLE analysis(
an_id SERIAL PRIMARY KEY,
an_name VARCHAR(50) NOT NULL,
an_cost DECIMAL(8,2) NOT NULL,
an_price DECIMAL(8,2) NOT NULL,
an_group INT NOT NULL
);

INSERT INTO analysis (an_name, an_cost, an_price, an_group)
VALUES 
('Анализ крови', 200.00, 350.00, 1),
('Общий анализ мочи', 250.00, 300.00, 1),
('Исследование липидов крови', 1280.00, 1550.00, 2),
('Исследование уровня глюкозы', 750.00, 1200.00, 2),
('Флюорография', 50.00, 800.00, 3);

SELECT * FROM analysis;

CREATE TABLE groups1(
gr_id SERIAL PRIMARY KEY,
gr_name VARCHAR(50) NOT NULL,
gr_temp VARCHAR(50) NOT NULL
);

INSERT INTO groups1 (gr_name, gr_temp)
VALUES
('Первая группа', '20-40'),
('Вторая группа', '20-25'),
('Третья группа', '10-15');

SELECT * FROM groups1;

CREATE TABLE orders2(
ord_id SERIAL PRIMARY KEY,
ord_datetime DATE NOT NULL,
ord_an INT
);

INSERT INTO orders2 (ord_datetime, ord_an)
VALUES
(date'2020-02-05', 1),
(date'2020-02-05', 2),
(date'2020-02-06', 3),
(date'2020-02-06', 3),
(date'2020-02-06', 2),
(date'2020-02-07', 1),
(date'2020-02-09', 1),
(date'2020-02-09', 5),
(date'2020-02-09', 4),
(date'2020-02-09', 4),
(date'2020-02-10', 5),
(date'2020-02-11', 2),
(date'2020-02-12', 3);

SELECT * FROM orders2;

SELECT an_name, an_price, ord_datetime
FROM analysis
JOIN orders2
ON analysis.an_id = orders2.ord_id
AND orders2.ord_datetime >= '2020-02-05'
AND orders2.ord_datetime <= '2020-02-12';

CREATE TABLE trains(
	train_id INT NOT NUll,
    station VARCHAR(40) NOT NUll,
    station_time TIME NOT NUll
);

INSERT INTO trains
VALUES
(110, "San Francisco", '10:00:00'),
(110, "Redwood City", '10:54:00'),
(110, "Palo Alto", '11:02:00'),
(110, "San Jose", '12:35:00'),
(120, "San Francisco", '11:00:00'),
(120, "Palo Alto", '12:49:00'),
(120, "San Jose", '13:30:00');

SELECT 
	trains.*,
	TIMEDIFF (LEAD(station_time) OVER (PARTITION BY train_id), station_time) AS time_to_next_station
FROM trains;