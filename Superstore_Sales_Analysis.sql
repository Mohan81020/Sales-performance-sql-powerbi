/*
===============================================================================
 Project:    Superstore Sales Performance Analysis
 Author:     Mohan Kumar
 Description:
   This SQL script provides an in-depth analysis of the Superstore sales 
   dataset. It includes sales, profit, quantity, shipping trends, customer 
   behavior, product performance, and profitability trends using SQL techniques 
   ranging from basic summaries to advanced window functions.
===============================================================================
*/

-- Create and use the database

CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;

-- View the raw data

SELECT * FROM sample_superstore;

-- Total Record Count --

SELECT COUNT(*) AS Total_Records
FROM sample_superstore;

-- Null Value Check --

SELECT COUNT(*) AS Total_Null_Records
FROM sample_superstore
WHERE row_id is null;

SELECT *
FROM sample_superstore
WHERE Sales is null or sales = '';

-- Duplicate Order ID Check --

SELECT Order_ID,COUNT(*) 
FROM sample_superstore
GROUP BY Order_ID
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

-- DISTINCT Category, Region, Ship Mode and Customer Segments -- 

SELECT DISTINCT Category
FROM sample_superstore;

SELECT DISTINCT Region
FROM sample_superstore;

SELECT DISTINCT Ship_Mode
FROM sample_superstore;

SELECT DISTINCT Segment AS customer_Segments
FROM sample_superstore;

-- Total Sales, Quantity, and Profit Summary

SELECT ROUND(SUM(sales),2) AS Total_Sales,
	   SUM(Quantity) AS Total_Quantity,
	   ROUND(SUM(Profit),2) AS Total_Profit
FROM sample_superstore;

-- Categories wise Total Sales, Total Quantity and Total Profit --

SELECT Category,
	   ROUND(SUM(Sales),2) AS Total_Sales,
	   SUM(Quantity) AS Total_Quantity,
	   ROUND(SUM(Profit),2) AS Total_Profit
FROM sample_superstore
GROUP BY Category
ORDER BY Total_Sales DESC,Total_Quantity DESC, Total_Profit DESC;

-- Region wise Total Sales, Total Quantity and Total Profit --

SELECT Region,
	   ROUND(SUM(Sales),2) AS Total_Sales,
	   SUM(quantity) AS Total_Quantity,
	   ROUND(SUM(Profit),2) AS Total_Profit
FROM sample_superstore
GROUP BY Region
ORDER BY Total_Sales DESC,Total_Quantity DESC, Total_Profit DESC;

-- Ship Mode wise Total Sales, Total Quantity and Total Profit --

SELECT Ship_Mode,
	   ROUND(SUM(Sales),2) AS Total_Sales,
	   SUM(Quantity) AS Total_Quantity,
	   ROUND(SUM(Profit),2) AS Total_Profit
FROM sample_superstore
GROUP BY Ship_Mode
ORDER BY Total_Sales DESC,Total_Quantity DESC, Total_Profit DESC;

-- Customer Segment wise Total Sales, Total Quantity and Total Profit --

SELECT Segment,
	   ROUND(SUM(Sales),2) AS Total_Sales,
	   SUM(Quantity) AS Total_Quantity,
	   ROUND(SUM(Profit),2) AS Total_Profit
FROM sample_superstore
GROUP BY Segment
ORDER BY Total_Sales DESC,Total_Quantity DESC, Total_Profit DESC;

-- Yearly Total Sales, Total Quantity and Total Profit --

SELECT Year(Order_Date) AS Order_Year,
	   ROUND(SUM(Sales),2) AS Total_Sales,
	   SUM(Quantity) AS Total_Quantity,
	   ROUND(SUM(Profit),2) AS Total_Profit		
FROM sample_superstore
GROUP BY Year(Order_Date)
ORDER BY Order_Year;

-- Monthly Total Sales, Total Quantity and Total Profit --

SELECT DATENAME(Month,Order_Date) AS Month,
	   ROUND(SUM(Sales),2) AS Total_Sales,
	   SUM(Quantity) AS Total_Quantity,
	   ROUND(SUM(Profit),2) AS Total_Profit		
FROM sample_superstore
GROUP BY MONTH(Order_Date),DATENAME(Month,Order_Date)
ORDER BY MONTH(Order_Date);

-- Product categories and Sub Categories wise Sales and Profit --

SELECT Category,
	   Sub_Category,
	   ROUND(SUM(Sales),2) AS Total_Sales,
	   ROUND(SUM(Profit),2) AS Total_Profit
FROM sample_superstore
GROUP BY Category,Sub_Category
ORDER BY Total_Sales DESC,Total_Profit DESC;

-- Top 10 Sales Product Name --

SELECT  Top 10 Product_Name,
		ROUND(SUM(Sales),2) AS Total_Sales
FROM sample_superstore
GROUP BY Product_Name
ORDER BY Total_Sales DESC;

-- Bottom 10 Sales Product Name --

SELECT  Top 10 Product_Name,
		ROUND(SUM(Sales),2) AS Total_Sales
FROM sample_superstore
GROUP BY Product_Name
ORDER BY Total_Sales;

-- Top 10 Profit Product Name --

SELECT  Top 10 Product_Name,
		ROUND(SUM(Profit),2) AS Total_Profit
FROM sample_superstore
GROUP BY Product_Name
ORDER BY Total_Profit DESC;

-- Bottom 10 Profit Product Name --

SELECT  Top 10 Product_Name,
		ROUND(SUM(Profit),2) AS Total_Profit
FROM sample_superstore
GROUP BY Product_Name
ORDER BY Total_Profit;

-- Profit Margin by Product Category --
SELECT Category,
	   ROUND(SUM(Sales),2) AS Total_Sales,
	   ROUND(SUM(Profit),2) AS Total_Profit,
	   ROUND(SUM(Profit)*100.0/SUM(Sales),2) AS Profit_Margin
FROM sample_superstore
GROUP BY Category
ORDER BY Profit_Margin DESC;

-- Sales Growth rate between current month and previous Month --

WITH Monthly_Sales AS (
SELECT FORMAT(Order_Date, 'yyyy-MM') AS Year_Month,
	  SUM(Sales) AS Total_Sales
FROM sample_superstore
GROUP BY FORMAT(Order_Date, 'yyyy-MM'))

SELECT Year_Month,
	  Total_Sales,
	  LAG(Total_Sales) OVER(ORDER BY Year_Month) AS Prev_Month_Sales,
	  ROUND((Total_Sales - LAG(Total_Sales) OVER(ORDER BY Year_Month))*100.0/LAG(Total_Sales) OVER(ORDER BY Year_Month),2) AS Growth_rate
FROM Monthly_Sales
ORDER BY Year_Month;

-- Product WITH negative Profit(Loss Making Product) --

SELECT Product_Name,
	   ROUND(SUM(Profit),2) AS Total_Profit
FROM sample_superstore
GROUP BY Product_Name
HAVING SUM(Profit) < 0
ORDER BY Total_Profit;

-- Top Sales Product by Region --

WITH Rank_Cte AS (
SELECT Region,
	  Product_Name,
	  SUM(Sales) AS Total_Sales,
	  RANK() OVER(PARTITION BY Region ORDER BY SUM(sales) DESC) AS Rnk
FROM sample_superstore
GROUP BY Region,Product_Name) 
SELECT *
FROM Rank_Cte
WHERE Rnk = 1;

-- Top Profit Product by Region --

WITH Rank_Cte AS (
SELECT Region,
	  Product_Name,
	  SUM(Profit) AS Total_Sales,
	  RANK() OVER(PARTITION BY Region ORDER BY SUM(profit) DESC) AS Rnk
FROM sample_superstore
GROUP BY Region,Product_Name) 
SELECT *
FROM Rank_Cte
WHERE Rnk = 1;

-- Customer WITH only one Purchase --

SELECT Customer_ID,
	  Customer_Name,
	  COUNT(DISTINCT Order_ID) AS Total_Order
FROM sample_superstore
GROUP BY Customer_ID,Customer_Name
HAVING COUNT(DISTINCT Order_ID) = 1
ORDER BY Customer_ID;

-- Average Discount Impact ON Profit --

SELECT 
    ROUND(Discount, 2) AS Discount_Level,
    ROUND(AVG(Profit), 2) AS Avg_Profit
FROM sample_superstore
GROUP BY ROUND(Discount, 2)
ORDER BY Discount_Level;

-- Shipping Mode Usage Trend --

SELECT Ship_Mode,
	   COUNT(*) AS Cnt,
	   ROUND(SUM(Sales),2) AS Total_Sales
FROM sample_superstore
GROUP BY Ship_Mode
ORDER BY Cnt DESC;

-------------------- End ---------------------
