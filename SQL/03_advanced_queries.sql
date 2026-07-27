USE superstore_db;

-- 1. Rank Customers by Total Sales

SELECT
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS Customer_Rank
FROM cleaned_superstore
GROUP BY Customer_Name;

-- 2. Top Customer in Each Segment

WITH CustomerRank AS (
    SELECT
        Segment,
        Customer_Name,
        SUM(Sales) AS Total_Sales,
        ROW_NUMBER() OVER (
            PARTITION BY Segment
            ORDER BY SUM(Sales) DESC
        ) AS rn
    FROM cleaned_superstore
    GROUP BY Segment, Customer_Name
)
SELECT *
FROM CustomerRank
WHERE rn = 1;

-- 3. Running Total of Monthly Sales

SELECT
    Year,
    Month,
    SUM(Sales) AS Monthly_Sales,
    SUM(SUM(Sales)) OVER (
        ORDER BY Year, Month
    ) AS Running_Total
FROM cleaned_superstore
GROUP BY Year, Month;

-- 4. Percentage Contribution of Each Category

SELECT
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(
        SUM(Sales) * 100 /
        (SELECT SUM(Sales) FROM cleaned_superstore),
        2
    ) AS Sales_Percentage
FROM cleaned_superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 5. Best Selling Product in Each Category

WITH ProductRank AS (
    SELECT
        Category,
        Product_Name,
        SUM(Sales) AS Total_Sales,
        DENSE_RANK() OVER (
            PARTITION BY Category
            ORDER BY SUM(Sales) DESC
        ) AS Product_Rank
    FROM cleaned_superstore
    GROUP BY Category, Product_Name
)
SELECT *
FROM ProductRank
WHERE Product_Rank = 1;

-- 6. Customers Above Average Sales

SELECT
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM cleaned_superstore
GROUP BY Customer_Name
HAVING SUM(Sales) >
(
    SELECT AVG(Customer_Total)
    FROM (
        SELECT SUM(Sales) AS Customer_Total
        FROM cleaned_superstore
        GROUP BY Customer_Name
    ) AS AvgSales
);

-- 7. Top 3 Products in Every Category

WITH ProductSales AS (
    SELECT
        Category,
        Product_Name,
        SUM(Sales) AS Total_Sales,
        RANK() OVER (
            PARTITION BY Category
            ORDER BY SUM(Sales) DESC
        ) AS Product_Rank
    FROM cleaned_superstore
    GROUP BY Category, Product_Name
)
SELECT *
FROM ProductSales
WHERE Product_Rank <= 3;

-- 8. Year-over-Year Sales Growth

SELECT
    Year,
    SUM(Sales) AS Total_Sales,
    LAG(SUM(Sales)) OVER (
        ORDER BY Year
    ) AS Previous_Year_Sales
FROM cleaned_superstore
GROUP BY Year;

-- 9. Classify Customers by Sales

SELECT
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    CASE
        WHEN SUM(Sales) >= 10000 THEN 'High Value'
        WHEN SUM(Sales) >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Type
FROM cleaned_superstore
GROUP BY Customer_Name;

-- 10. Cumulative Sales Percentage by Region

SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    ROUND(
        SUM(Sales) * 100 /
        SUM(SUM(Sales)) OVER (),
        2
    ) AS Sales_Percentage
FROM cleaned_superstore
GROUP BY Region
ORDER BY Total_Sales DESC;