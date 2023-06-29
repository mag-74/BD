USE `mag-db`;

SELECT * FROM mobile;

SELECT ProductName, Manufacturer, Price
FROM mobile
WHERE ProductCount > 2;

SELECT ProductName, Manufacturer, ProductCount, Price
FROM mobile
WHERE Manufacturer = "Samsung";

SELECT ProductName, Manufacturer, Price * ProductCount
FROM mobile
WHERE Price * ProductCount > 100000 AND Price * ProductCount < 145000;

SELECT ProductName, Manufacturer, ProductCount, Price
FROM mobile
WHERE ProductName LIKE "Iphone%";

SELECT ProductName, Manufacturer, ProductCount, Price
FROM mobile
WHERE ProductName LIKE "Galaxy%";

SELECT ProductName, Manufacturer, ProductCount, Price
FROM mobile
WHERE ProductName LIKE '%0%' OR ProductName LIKE '%1%' OR ProductName LIKE '%2%' OR ProductName LIKE '%3%' OR ProductName LIKE '%4%'
 OR ProductName LIKE '%5%' OR ProductName LIKE '%6%' OR ProductName LIKE '%7%' OR ProductName LIKE '%8%' OR ProductName LIKE '%9%';
 
SELECT ProductName, Manufacturer, ProductCount, Price
FROM mobile
WHERE ProductName LIKE '%8%';
