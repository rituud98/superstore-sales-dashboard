# Superstore Sales Analytics Dashboard
##Project Overview

An end-to-end data analytics project analyzing 4 years of retail sales data from a US-based superstore. The project covers data cleaning in Excel, business insights using SQL (PostgreSQL), and an interactive dashboard built in Power BI — simulating a real-world BI analyst workflow.

---

##Business Problem

The superstore management wants to understand:
- Which regions, categories, and products are driving the most revenue?
- Which products are making a loss and why?
- How does discounting affect profitability?
- What are the monthly sales trends throughout the year?

---

##Tools Used

| Tool | Purpose |
|---|---|
| Microsoft Excel | Data cleaning, calculated columns |
| PostgreSQL (pgAdmin) | Business queries and insight generation |
| Power BI Desktop | Interactive dashboard and visualization |

---

##Dataset

- **Source:** [Superstore Dataset — Kaggle](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
- **Rows:** 9,994 orders
- **Columns:** 21 fields including Order Date, Category, Region, Sales, Profit, Discount

---

##Step 1 — Data Cleaning (Excel)

- Formatted `Order Date` and `Ship Date` columns to proper Date format
- Added **Delivery Days** column: `=DATEDIF(Order Date, Ship Date, "D")`
- Added **Profit Margin %** column: `=IFERROR((Profit/Sales)*100, 0)`
- Added **Loss Flag** column: `=IF(Profit<0, "Loss", "Profit")`
- Removed currency formatting from Sales and Profit columns for clean CSV export
- Converted dataset to Excel Table for easier filtering

---

##Step 2 — SQL Analysis (PostgreSQL)

Key business questions answered using SQL:

```sql
-- Total Sales and Profit Overview
SELECT 
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore;

-- Sales and Profit by Category
SELECT Category, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Top 10 Loss Making Products
SELECT Product_Name, SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Product_Name
ORDER BY Total_Profit ASC
LIMIT 10;

-- Impact of Discount on Profit
SELECT 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.2 THEN 'Low Discount'
        WHEN Discount <= 0.4 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS Discount_Level,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Discount_Level
ORDER BY Total_Profit DESC;
```

---

##Step 3 — Power BI Dashboard

### KPI Cards
| Metric | Value |
|---|---|
| Total Sales | 633K |
| Total Profit | 86K |
| Total Orders | 1K |
| Profit Margin % | 13.56% |
| Total Quantity | 10K |

### Visuals Built
- **Bar Chart** — Total Sales by Category
- **Donut Chart** — Total Sales by Region
- **Pie Chart** — Total Sales by Customer Segment
- **Line Chart** — Monthly Sales Trend
- **Horizontal Bar Chart** — Top 10 Products by Sales

### Slicers (Interactive Filters)
- Region (Central, East, South, West)
- Sub-Category
- Year

---

##Key Insights

- **Technology** is the top-selling category at **₹256K** in total sales
- **West region** leads with **29%** of total sales (₹187K), while South is lowest at 18%
- **Consumer segment** drives nearly **47%** of total revenue
- Sales **peak in January–February** and decline steadily toward year-end — suggesting seasonal demand
- Products with **high discounts (>40%)** consistently generate **negative profit** — indicating over-discounting is hurting the business
- Several **Furniture sub-category** products are top loss-makers despite high sales volume

---

##Project Structure

```
Superstore-Sales-Dashboard/
│
├── data/
│   └── superstore.csv
│
├── sql/
│   └── superstore_queries.sql
│
├── dashboard/
│   └── Superstore_Sales_Dashboard.pbix
│
├── screenshots/
│   └── dashboard_preview.png
│
└── README.md
```

---

## 📸 Dashboard Preview

![Dashboard Preview](<img width="1366" height="768" alt="Screenshot (38)" src="https://github.com/user-attachments/assets/fb601732-9a0f-413b-a5a8-f4b582d6f56d" />
)

---


##How to Run This Project

1. Download the `superstore_clean.csv` from the `data/` folder
2. Import into PostgreSQL using the SQL script in `sql/` folder
3. Open `Superstore_Sales_Dashboard.pbix` in Power BI Desktop
4. Refresh the data source to point to your local CSV file
5. Explore the interactive dashboard!
