use db;
select * from used_car_Sales;
--  1 Get all sold cars
SELECT * 
FROM used_car_sales
WHERE `Car Sale Status` = 'Sold';

-- 2 Count total cars sold by each Sales Agent
SELECT `Sales Agent Name`, COUNT(*) AS Total_Cars_Sold
FROM used_car_sales
WHERE `Car Sale Status` = 'Sold'
GROUP BY `Sales Agent Name`;

-- 3 Find the average margin percentage for each car type
SELECT `Car Type`, AVG(`Margin-%`) AS Avg_Margin
FROM used_car_sales
WHERE `Car Sale Status` = 'Sold'
GROUP BY `Car Type`;

-- 4 List cars sold in 2025 with profit greater than $2000
SELECT `Car Name`, `Manufacturer Name`, `Sold Price-$` - `Purchased Price-$` AS Profit
FROM used_car_sales
WHERE YEAR(`Sold Date`) = 2025
  AND (`Sold Price-$` - `Purchased Price-$`) > 2000;

-- 5 Get top 5 highest-rated sales agents
SELECT `Sales Agent Name`, AVG(`Sales Rating`) AS Avg_Rating
FROM used_car_sales
GROUP BY `Sales Agent Name`
ORDER BY Avg_Rating DESC
LIMIT 5;

-- 6 Calculate total revenue and total commission by distributor
SELECT `Distributor Name`,
       SUM(`Sold Price-$`) AS Total_Revenue,
       SUM(`Sales Commission-$`) AS Total_Commission
FROM used_car_sales
WHERE `Car Sale Status` = 'Sold'
GROUP BY `Distributor Name`;

-- 7 Find unsold cars older than 5 years
SELECT `Car Name`, `Manufactured Year`, `Price-$`
FROM used_car_sales
WHERE `Car Sale Status` != 'Sold'
  AND YEAR(CURDATE()) - `Manufactured Year` > 5;

-- 8 Determine which location has the highest total sales amount
SELECT Location, SUM(`Sold Price-$`) AS Total_Sales
FROM used_car_sales
WHERE `Car Sale Status`  = 'Sold'
GROUP BY Location
ORDER BY Total_Sales DESC
LIMIT 1;

-- 9 Show all cars that are currently available for sale
SELECT `Car Name`, `Manufacturer Name`, `Price-$`, Location
FROM used_car_sales
WHERE `Car Sale Status` = 'Available';

--  10 Count total number of cars in the dataset
SELECT COUNT(*) AS Total_Cars
FROM used_car_sales;

-- 11 List all unique manufacturers
SELECT DISTINCT `Manufacturer Name`
FROM used_car_sales;

--  12 Get cars manufactured after 2020
SELECT `Car Name`, `Manufacturer Name`, `Manufactured Year`
FROM used_car_sales
WHERE `Manufactured Year` > 2020;

--  13 Find all automatic gearbox cars
SELECT `Car Name`, `Manufacturer Name`, Gearbox
FROM used_car_sales
WHERE Gearbox = 'Automatic';

-- 13 Show all electric cars with price less than $20,000
SELECT `Car Name`, `Manufacturer Name`, `Price-$`
FROM used_car_sales
WHERE Energy = 'Electric' 
  AND `Price-$` < 20000;

--  14 Count cars by fuel type
SELECT Energy, COUNT(*) AS Total_Cars
FROM used_car_sales
GROUP BY Energy;

-- 15 Find average price of cars by manufacturer
SELECT `Manufacturer Name`, AVG(`Price-$`) AS Avg_Price
FROM used_car_sales
GROUP BY `Manufacturer Name`;

--  16 Show total sold cars and total revenue by each sales agent
SELECT `Sales Agent Name`,
       COUNT(*) AS Cars_Sold,
       SUM(`Sold Price-$`) AS Total_Revenue
FROM used_car_sales
WHERE `Car Sale Status` = 'Sold'
GROUP BY `Sales Agent Name`;

--  17 Find all sales with margin greater than 15%
SELECT `Car Name`, `Manufacturer Name`, ` Margin-%`, `Sales Agent Name`
FROM used_car_sales
WHERE `Margin-%` > 15;

-- 18  List top 5 most expensive cars sold
SELECT distinct( `Car Name`), `Manufacturer Name`, `Sold Price-$`
FROM used_car_sales
WHERE `Car Sale Status` = 'Sold'
ORDER BY `Sold Price-$` DESC
LIMIT 5;

-- 19 Get average mileage for each car type
SELECT `Car Type`, AVG(`Mileage-KM`) AS Avg_Mileage
FROM used_car_sales
GROUP BY `Car Type`;

-- 20  Find cars that have customer feedback containing “excellent”
SELECT `Car Name`, Feedback
FROM used_car_sales
WHERE Feedback LIKE '%excellent%';


-- 21 Calculate profit in dollars for each sold car
SELECT ID,
       `Car Name`,
       `Sold Price-$` - `Purchased Price-$` AS Profit
FROM used_car_sales
WHERE `Car Sale Status` = 'Sold';

-- 22 Find the most profitable car type (highest average margin)
SELECT `Car Type`,
       AVG(`Margin-%`) AS Avg_Margin
FROM used_car_sales
WHERE `Car Sale Status` = 'Sold'
GROUP BY `Car Type`
ORDER BY Avg_Margin DESC
LIMIT 1;

--  23 Find sales agents with average rating above 4.5
SELECT `Sales Agent Name`, AVG(`Sales Rating`) AS Avg_Rating
FROM used_car_sales
GROUP BY `Sales Agent Name`
HAVING AVG(`Sales Rating`) > 4.5;

-- 24 Calculate total profit per distributor
SELECT `Distributor Name`,
       SUM(`Sold Price-$` - `Purchased Price-$`) AS Total_Profit
FROM used_car_sales
WHERE `Car Sale Status` = 'Sold'
GROUP BY `Distributor Name`
ORDER BY Total_Profit DESC;

-- 25 Show yearly sales summary (number of cars sold and total revenue)
SELECT YEAR(`Sold Date`) AS Sale_Year,
       COUNT(*) AS Cars_Sold,
       SUM(`Sold Price-$`) AS Total_Revenue
FROM used_car_sales
WHERE `Car Sale Status` = 'Sold'
GROUP BY YEAR(`Sold Date`)
ORDER BY Sale_Year;

--  26 Get the top 3 locations with the highest average sales commission
SELECT Location,
       AVG(`Sales Commission-$`) AS Avg_Commission
FROM used_car_sales
WHERE `Car Sale Status` = 'Sold'
GROUP BY Location
ORDER BY `Avg Commission` DESC
LIMIT 3;