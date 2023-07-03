USE `mag-db`;

CREATE TABLE sales(
	id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    bucket INT
);

INSERT INTO sales (order_date, bucket)
VALUES 
('2021-01-01', 152),
('2021-01-02', 270),
('2021-01-03', 31),
('2021-01-04', 102),
('2021-01-05', 750);

SELECT * FROM sales;

SELECT id, order_date, bucket,
CASE
	WHEN bucket < 100 THEN 'Маленький заказ'
    WHEN bucket BETWEEN 101 AND 300 THEN 'Средний заказ'
    WHEN bucket >= 301 THEN 'Большой заказ'
    ELSE 'FAIL'
END AS bucket1
FROM sales;

CREATE TABLE orders(
	orderid SERIAL PRIMARY KEY,
    employeeid VARCHAR(50) NOT NULL,
    amount DECIMAL(8,2) NOT NULL,
    orderstatus VARCHAR(50) NOT NULL
);

INSERT INTO orders (employeeid, amount, orderstatus)
VALUES 
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED'),
('e04', 99.99, 'OPEN');

SELECT * FROM orders;

SELECT orderid, orderstatus,
CASE
	WHEN orderstatus = 'OPEN' THEN 'Order is in open state.'
    WHEN orderstatus = 'CLOSED' THEN 'Order is closed'
    WHEN orderstatus = 'CANCELLED' THEN 'Order is cancelled'
    ELSE 'FAIL'
END AS order_summary
FROM orders;