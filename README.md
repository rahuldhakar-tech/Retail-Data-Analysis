# Retail Sales Data Analysis Project

## 📌 Project Overview
This project focuses on analyzing retail sales data using SQL. The dataset contains transactional records, including sales details, customer demographics, and product categories. The objective is to derive insights such as revenue trends, customer behavior, and sales performance across various categories.

## 📂 Database Schema

**Database Name:** `Retail_Sales`

**Table Name:** `sales_data`

| Column Name     | Data Type  | Description |
|----------------|-----------|-------------|
| transactions_id | INT (PK) | Unique transaction ID |
| sale_date      | DATE      | Date of sale |
| sale_time      | TIME      | Time of sale |
| customer_id    | INT       | Unique customer ID |
| gender         | VARCHAR(15) | Customer gender |
| age           | INT       | Customer age |
| category       | VARCHAR(15) | Product category |
| quantity       | INT       | Quantity sold |
| price_per_unit | FLOAT     | Price per unit |
| cogs          | FLOAT     | Cost of goods sold |
| total_sales    | FLOAT     | Total sales value |

## 🚀 SQL Queries & Insights

### 📊 Data Validation
- Verify data import: `SELECT * FROM sales_data;`
- Count total transactions: `SELECT COUNT(*) FROM sales_data;`
- Check for NULL values:
  ```sql
  SELECT * FROM sales_data
  WHERE transactions_id IS NULL OR sale_date IS NULL OR sale_time IS NULL
  OR customer_id IS NULL OR gender IS NULL OR age IS NULL OR category IS NULL
  OR quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL OR total_sales IS NULL;
  ```

### 🔍 Business Insights
#### **1️⃣ Category Performance Analysis**
- Top revenue-generating categories:
  ```sql
  SELECT category, SUM(total_sales) AS Total_revenue
  FROM sales_data
  GROUP BY category
  ORDER BY Total_revenue DESC;
  ```
- Total quantity sold per category:
  ```sql
  SELECT category, SUM(quantity) AS total_quantity
  FROM sales_data
  GROUP BY category
  ORDER BY total_quantity DESC;
  ```

#### **2️⃣ Customer Behavior Analysis**
- Revenue contribution by gender:
  ```sql
  SELECT gender, COUNT(gender) AS Distribution_gender, SUM(total_sales) AS total_revenue_by_gender
  FROM sales_data
  GROUP BY gender
  ORDER BY total_revenue_by_gender DESC;
  ```
- Age groups contributing the most revenue:
  ```sql
  SELECT age, SUM(total_sales) AS total_revenue
  FROM sales_data
  GROUP BY age
  ORDER BY total_revenue DESC;
  ```

### 📈 Aggregations & KPIs
- **Total sales revenue for January 2022:**
  ```sql
  SELECT SUM(total_sales) AS total_sales_revenue_jan2022
  FROM sales_data
  WHERE YEAR(sale_date) = 2022 AND MONTH(sale_date) = 1;
  ```
- **Average price per unit:**
  ```sql
  SELECT AVG(price_per_unit) AS avg_price_per_unit FROM sales_data;
  ```
- **Max quantity sold in a single transaction:**
  ```sql
  SELECT MAX(quantity) AS max_quantity_per_transaction FROM sales_data;
  ```
- **Unique customers count:**
  ```sql
  SELECT COUNT(DISTINCT customer_id) AS unique_customers FROM sales_data;
  ```
- **Total cost of goods sold:**
  ```sql
  SELECT ROUND(SUM(cogs), 2) AS total_cogs FROM sales_data;
  ```

### 🕒 Date & Time Analysis
- **Total sales on weekends:**
  ```sql
  SELECT SUM(total_sales) AS total_weekend_sales
  FROM sales_data
  WHERE DAYOFWEEK(sale_date) IN (1, 7);
  ```
- **Transactions before 12:00 PM:**
  ```sql
  SELECT COUNT(transactions_id) AS transactions_before_noon
  FROM sales_data
  WHERE TIME(sale_time) < '12:00:00';
  ```
- **Most popular sales hour:**
  ```sql
  SELECT HOUR(sale_time) AS sale_hour, COUNT(*) AS total_sales
  FROM sales_data
  GROUP BY sale_hour
  ORDER BY total_sales DESC
  LIMIT 1;
  ```

## 🎯 Key Takeaways
✅ **Category trends:** Identifies high-revenue product categories.  
✅ **Customer segmentation:** Helps understand revenue contributions by gender and age groups.  
✅ **Sales trends:** Analyzes peak transaction times and weekend sales impact.  
✅ **Operational efficiency:** Ensures clean and validated data for accurate analysis.  


## 📌 Future Enhancements
- 🔹 Advanced customer segmentation using RFM analysis.
- 🔹 Incorporate Power BI for interactive dashboards.
- 🔹 Perform predictive analytics to forecast future sales.
