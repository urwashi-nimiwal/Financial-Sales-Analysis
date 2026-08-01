-- Create Database
create database fin;
--  select database 
use fin;

-- Check Total Number of Records
select count(*) from financial_sample_cleaned;
-- View Table Structure (Columns and Data Types)
DESCRIBE financial_sample_cleaned;
-- Preview the First 10 Records
SELECT *
FROM fin.financial_sample_cleaned
LIMIT 10;

-- Total Sales 
 SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM financial_sample_cleaned;
-- Total profit
SELECT ROUND(SUM(Profit),2) AS Total_Profit
FROM financial_sample_cleaned;
-- Average Profit
SELECT ROUND(AVG(Profit),2) AS Average_Profit
FROM financial_sample_cleaned;
-- Total Units Sold
SELECT SUM(`Units Sold`) AS Total_Units
FROM financial_sample_cleaned;
-- Country-wise Analysis
SELECT Country,
       ROUND(SUM(Sales),2) AS Sales,
       ROUND(SUM(Profit),2) AS Profit
FROM financial_sample_cleaned
GROUP BY Country
ORDER BY Sales DESC;
-- Product-wise Analysis
SELECT Product,
       ROUND(SUM(Sales),2) AS Total_Sales,
       ROUND(SUM(Profit),2) AS Total_Profit
FROM financial_sample_cleaned
GROUP BY Product
ORDER BY Total_Profit DESC;
-- Segment-wise Analysis
SELECT Segment,
       ROUND(SUM(Sales),2) AS Sales,
       ROUND(SUM(Profit),2) AS Profit
FROM financial_sample_cleaned
GROUP BY Segment;
-- Monthly Sales Trend
SELECT `Month Name`,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM financial_sample_cleaned
GROUP BY `Month Number`, `Month Name`
ORDER BY `Month Number`;
-- Top 5 Products
SELECT Product,
       ROUND(SUM(Profit),2) AS Total_Profit
FROM financial_sample_cleaned
GROUP BY Product
ORDER BY Total_Profit DESC
LIMIT 5;
-- Loss-making Transactions
SELECT *
FROM financial_sample_cleaned
WHERE Profit < 0;
