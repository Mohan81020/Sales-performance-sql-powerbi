# 📊 Superstore Sales Performance Analysis

This project presents a comprehensive sales analysis for a fictional Superstore using **SQL** and **Power BI**. It showcases how to clean, process, analyze, and visualize sales data to derive meaningful business insights and inform strategic decision-making.

---

## 🧾 Project Overview

The objective of this project is to analyze the Superstore sales data to understand customer behavior, product performance, profit trends, and regional variations. SQL is used for data cleaning, aggregation, and deriving KPIs. Power BI is used to build an interactive dashboard to visualize trends and insights.

---

## 🛠️ Tools Used

- **SQL Server** — For querying, aggregation, and KPI extraction  
  👉 [SQL Code](./Superstore_Sales_Analysis.sql)
- **Power BI** — For data visualization and dashboarding  
  👉 [Dashboard Screenshot](./Superstore_Sales_Data_Analysis.png)
- **Excel** — Raw dataset in spreadsheet format  
  👉 [Dataset File](./DataSet/Superstore_Orders_Data.xlsx)

---

## 📂 Dataset Description

The dataset contains transactional sales data for a retail store, including the following columns:

| Column Name       | Description |
|-------------------|-------------|
| `Order ID`        | Unique identifier for each order |
| `Order Date`      | Date the order was placed |
| `Ship Date`       | Date the order was shipped |
| `Ship Mode`       | Shipping category (Standard, Second Class, etc.) |
| `Customer ID`     | Unique ID for customers |
| `Customer Name`   | Name of the customer |
| `Segment`         | Customer type (Consumer, Corporate, Home Office) |
| `Country/Region/City/State` | Location data |
| `Product ID`      | Unique identifier for products |
| `Category`        | Product category |
| `Sub-Category`    | Product sub-category |
| `Product Name`    | Name of the product |
| `Sales`           | Total sales amount |
| `Quantity`        | Quantity sold |
| `Discount`        | Discount applied |
| `Profit`          | Profit gained/lost |

---

## ❓ Questions Answered Using SQL

### ✅ Basic Queries:
1. Total sales, profit, and quantity
2. Unique values in categories, segments, ship modes
3. Monthly & yearly sales summary
4. Top-selling products by quantity and sales
5. Customers who ordered only once

### 🔁 Intermediate Queries:
1. Sales and profit by region, category, and segment
2. Discount impact on profitability
3. Sales by sub-category and product
4. Profit margin % by category
5. Shipping mode usage frequency

### 🔍 Advanced Queries:
1. Monthly growth rate using `LAG()` window function
2. Top profitable product by region using `RANK()`
3. Bottom 10 loss-making products
4. Trend of customer orders over time
5. Advanced customer segmentation by order count

---

## 📈 Key Insights

- 📦 **Technology** category generated the highest sales overall.
- 💰 Profit margins are highest in the **Office Supplies** segment.
- 🌎 The **West** region outperformed other regions in both sales and profit.
- 📉 Some products consistently lead to losses and need review.
- 🚚 **Standard Class** is the most used ship mode, covering nearly 59% of total orders.
- 📅 Sales peak during **November and December**, suggesting holiday season surges.
- 📉 Discounts above 30% often result in negative profits.

---

## ✅ Power BI Dashboard Highlights

- Sales & profit breakdown by **Category**, **Region**, and **Quarter**
- Monthly sales trend with comparative quantity movement
- Interactive filters for **Region**, **Year**, and **Segment**
- Top and bottom products by sales/profit
- Relationship visualization between **Sales** and **Profit**
- Donut charts and treemaps for quick glances

> 📍 *See Power BI dashboard screenshots [here](./Superstore_Sales_Data_Analysis.png).*

---

## 🏁 Conclusion

This project successfully demonstrates the power of combining SQL and Power BI for business analytics. It reveals vital insights on sales performance, customer behavior, discount efficiency, and regional trends. These insights can be leveraged for better inventory management, targeted marketing, and profit optimization.

---


---

## 📬 Contact

**Author**: Mohan Kumar  
**Mail**: mohan122000kumar@gmail.com

---

⭐ *Feel free to fork or star this repo if you found it useful!*

