USE superstore_db;

-- 1. View All Records

SELECT *
FROM cleaned_superstore;

-- 2. Total Orders

SELECT COUNT(DISTINCT Order_ID) AS Total_Orders
FROM cleaned_superstore;

-- 3. Total Sales

SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM cleaned_superstore;

-- 4. Average Sales

SELECT ROUND(AVG(Sales),2) AS Average_Sales
FROM cleaned_superstore;

-- 5. Highest Sale

SELECT MAX(Sales) AS Highest_Sale
FROM cleaned_superstore;

-- 6. Lowest Sale

SELECT MIN(Sales) AS Lowest_Sale
FROM cleaned_superstore;

-- 7. Total Customers

SELECT COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM cleaned_superstore;

-- 8. Total Products

SELECT COUNT(DISTINCT Product_Name) AS Total_Products
FROM cleaned_superstore;

-- 9. Sales by Category

SELECT
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM cleaned_superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 10. Sales by Sub-Category

SELECT
    Sub_Category,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM cleaned_superstore
GROUP BY Sub_Category
ORDER BY Total_Sales DESC;

-- 11. Sales by Region

SELECT
    Region,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM cleaned_superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- 12. Sales by Segment

SELECT
    Segment,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM cleaned_superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- 13. Sales by Ship Mode

SELECT
    Ship_Mode,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM cleaned_superstore
GROUP BY Ship_Mode
ORDER BY Total_Sales DESC;

-- 14. Top 10 Customers

SELECT
    Customer_Name,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM cleaned_superstore
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- 15. Top 10 Products

SELECT
    Product_Name,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM cleaned_superstore
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- 16. Top 10 States

SELECT
    State,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM cleaned_superstore
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;

-- 17. Top 10 Cities

SELECT
    City,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM cleaned_superstore
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 10;