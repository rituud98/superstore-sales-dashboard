DROP TABLE IF EXISTS superstore;

CREATE TABLE superstore (
    Row_ID INT,
    Order_ID VARCHAR(50),
    Order_Date VARCHAR(20),
    Ship_Date VARCHAR(20),
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code VARCHAR(20),
    Region VARCHAR(20),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(200),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2),
    Delivery_Days INT,
    Profit_Margin_Pct DECIMAL(10,2),
    Loss_Flag VARCHAR(10)
);
SELECT * FROM superstore

COPY superstore
FROM 'C:/superstore_clean.csv'
DELIMITER ','
CSV HEADER;
SELECT COUNT(*) FROM superstore;

-- 1.Total Sales, Profit and Orders
-- Count Total Rows
	SELECT COUNT(*) AS Total_Records
	FROM superstore;
-- Total Sales and Profit
	SELECT * FROM superstore
	SELECT 
	SUM(sales) AS Total_sales,
	SUM(profit) AS Total_profit
	FROM superstore;

--2. Sales by Category 
	SELECT category,
	SUM(sales) AS Total_sale
	FROM superstore
	GROUP BY category;
-- Sales by Region
	SELECT 
	region,
	SUM(sales) AS total_sale
	FROM superstore
	GROUP BY region;
-- Count Orders by Segment
	SELECT 
	segment,
	COUNT(*) AS Total_orders
	FROM superstore
	GROUP BY segment
	
 -- Find All Loss Making Orders	
 	SELECT
	 order_id,
	 product_name,
	 sales,
	 profit
	 FROM superstore
	 WHERE profit <0;
-- Top 5 Products by Sales
	SELECT
	product_name,
	SUM(sales) AS Top_sales
	FROM superstore
	GROUP BY product_name
	ORDER BY Top_sales DESC
	LIMIT 5;
 -- Sales by Ship Mode
 	SELECT
	ship_mode,
	SUM(sales) AS total_sales
	FROM superstore
	GROUP BY ship_mode
-- Average Order Value
	SELECT 
    ROUND(AVG(Sales)::NUMERIC, 2) AS Avg_Order_Value,
    ROUND(AVG(Profit)::NUMERIC, 2) AS Avg_Profit
FROM superstore; 
	SEL
	
	SELECT * FROM superstore
	

	

