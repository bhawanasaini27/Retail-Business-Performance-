CREATE DATABASE IF NOT EXISTS RetailAnalysis;
USE RetailAnalysis;
CREATE TABLE IF NOT EXISTS retail_data_sample (
    `Order ID` VARCHAR(50),
    `Product Name` VARCHAR(255),
    `Category` VARCHAR(100),
    `Sub_Category` VARCHAR(100),
    `Sales` FLOAT,
    `Profit` FLOAT,
    `Region` VARCHAR(100),
    `Order Date` DATE
);
SELECT * FROM retail_data_sample LIMIT 10;
SELECT 
    Category,
    Sub_Category,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS Profit_Margin
FROM retail_data_sample
GROUP BY Category, Sub_Category
ORDER BY Profit_Margin ASC;
SELECT 
    MONTH(Order_Date) AS Month,
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM retail_data_sample
GROUP BY Month, Category
ORDER BY Month;
SELECT 
    `Product Name`,
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM retail_data_sample
GROUP BY `Product Name`, Category
HAVING Total_Sales < 100;  -- Threshold for slow-moving
