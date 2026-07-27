USE superstore_db;

-- 1. Monthly Sales

SELECT
    Year,
    Month,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM cleaned_superstore
GROUP BY Year, Month
ORDER BY Year, Month;

-- 2. Yearly Sales

SELECT
    Year,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM cleaned_superstore
GROUP BY Year
ORDER BY Year;

-- 3. Sales by Year and Category

SELECT
    Year,
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM cleaned_superstore
GROUP BY Year, Category
ORDER BY Year, Total_Sales DESC;

-- 4. Sales by Region and Category

SELECT
    Region,
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM cleaned_superstore
GROUP BY Region, Category
ORDER BY Region, Total_Sales DESC;

-- 5. Average Sales by Category

SELECT
    Category,
    ROUND(AVG(Sales),2) AS Average_Sales
FROM cleaned_superstore
GROUP BY Category
ORDER BY Average_Sales DESC;

-- 6. Average Sales by Region

SELECT
    Region,
    ROUND(AVG(Sales),2) AS Average_Sales
FROM cleaned_superstore
GROUP BY Region
ORDER BY Average_Sales DESC;

-- 7. Top 5 Customers in Each Segment

SELECT
    Segment,
    Customer_Name,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM cleaned_superstore
GROUP BY Segment, Customer_Name
ORDER BY Segment, Total_Sales DESC;

-- 8. Sales by State

SELECT
    State,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM cleaned_superstore
GROUP BY State
ORDER BY Total_Sales DESC;

-- 9. Orders by Ship Mode

SELECT
    Ship_Mode,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM cleaned_superstore
GROUP BY Ship_Mode
ORDER BY Total_Orders DESC;

-- 10. Customer Count by Segment

SELECT
    Segment,
    COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM cleaned_superstore
GROUP BY Segment
ORDER BY Total_Customers DESC;

-- 11. Product Count by Category

SELECT
    Category,
    COUNT(DISTINCT Product_Name) AS Total_Products
FROM cleaned_superstore
GROUP BY Category
ORDER BY Total_Products DESC;

-- 12. Monthly Order Count

SELECT
    Year,
    Month,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM cleaned_superstore
GROUP BY Year, Month
ORDER BY Year, Month;

-- 13. Top 10 Cities by Number of Orders

SELECT
    City,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM cleaned_superstore
GROUP BY City
ORDER BY Total_Orders DESC
LIMIT 10;

-- 14. Sales by Quarter

SELECT
    Quarter,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM cleaned_superstore
GROUP BY Quarter
ORDER BY Quarter;

-- 15. Top 10 Customer Segments by Sales

SELECT
    Segment,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM cleaned_superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;