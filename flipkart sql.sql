-- Create Database
CREATE DATABASE project;
-- Insert The Data Into The Database
-- Use Datbase
USE project;
-- Get The OverView Of The Data
SELECT*
FROM flipkart1;
-- Company And Their Average Price
SELECT company,AVG(Price) AS average_price
from flipkart1
GROUP BY 1
ORDER BY 2 DESC;
-- Company And Their Avg Capacity_Kg
SELECT Company,AVG(capacity_Kg) AS average_kg
FROM flipkart
GROUP BY 1
ORDER BY 2 DESC;
-- Most Selling Company
SELECT Company,COUNT(*) AS Count
FROM flipkart
GROUP BY 1
ORDER BY 2 DESC;
-- Capacity Geater Than 9 Kg
SELECT*
FROM flipkart1
WHERE Capacity_Kg>9;
-- Maximum Capacity Among All The Washing Machine
SELECT MAX(capacity_kg) AS max_capacity
FROM flipkart1;
-- Total Number Of Machines That Have A discount Greater Than 50%
SELECT*
FROM flipkart1 
WHERE Discount_percentage>50;
-- Retrive Washing Machine With Price Between 10,000 and 30,000 and a warranty of atleast 3 years
SELECT*
FROM flipkart1
WHERE (Price BETWEEN 10000 AND 30000 ) AND Warranty>=3;
-- TOP 5 Most Expensive Washing Machine
SELECT*
FROM flipkart1
ORDER BY price DESC
LIMIT 5;
SELECT Type,COUNT(*) AS count
FROM flipkart1
GROUP BY 1;
-- Rank Washing Machine Within Each Company By Capacity
SELECT company,Capacity_kg,DENSE_RANK() OVER(PARTITION BY company ORDER BY capacity_kg DESC) AS rank_
FROM flipkart1;
-- List Washing Machine With a price greater than the companies avg price
SELECT*
FROM flipkart1
WHERE price>(SELECT AVG(price) FROM flipkart1) ;
-- Least Selling Companies
SELECT Company,COUNT(*) AS count_
FROM flipkart1
GROUP BY 1
ORDER BY 2 ASC
limit 10;
-- Companies And Their Highest Price
SELECT Company,Price
FROM (
	SELECT Company,Price,DENSE_RANK() OVER(PARTITION BY Company ORDER BY Price DESC) AS rank_
    FROM flipkart1
    ) as h_
WHERE rank_=1
ORDER BY Price DESC;
-- Companies And Their Max Speed
SELECT Company,Max_Speed
FROM (
	SELECT Company,Max_Speed,DENSE_RANK() OVER(PARTITION BY Company ORDER BY Max_Speed DESC) AS rank_
    FROM flipkart1
    ) as h_
WHERE rank_=1
ORDER BY Max_Speed DESC;
-- Companies And Their Highest Warranty Period
SELECT Company,Warranty
FROM (
	SELECT Company,Warranty,DENSE_RANK() OVER(PARTITION BY Company ORDER BY Warranty DESC) AS rank_
    FROM flipkart1
    ) as h_
WHERE rank_=1
ORDER BY Warranty DESC;



