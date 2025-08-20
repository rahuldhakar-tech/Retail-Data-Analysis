-- Database Creation
CREATE DATABASE Retail_Sales;

-- Table Creation
CREATE TABLE sales_data (
    transactions_id INT NOT NULL PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sales FLOAT
);

-- Data Import (Use MySQL Import Option)

-- Verify Data Import
SELECT * FROM sales_data;
SELECT COUNT(*) AS total_records FROM sales_data;

-- Check for NULL values
SELECT * FROM sales_data WHERE transactions_id IS NULL OR sale_date IS NULL OR sale_time IS NULL OR 
customer_id IS NULL OR gender IS NULL OR age IS NULL OR category IS NULL OR quantiy IS NULL OR 
price_per_unit IS NULL OR cogs IS NULL OR total_sales IS NULL;

-- Category Performance Analysis
-- 1. Which product categories generate the most revenue?
SELECT category, SUM(total_sales) AS total_revenue FROM sales_data GROUP BY category ORDER BY total_revenue DESC;

-- 2. What is the total quantity sold for each category?
SELECT category, SUM(quantity) AS total_quantity FROM sales_data GROUP BY category ORDER BY total_quantity DESC;

-- Customer Behavior Analysis
-- 3. What is the revenue contribution by gender?
SELECT gender, COUNT(gender) AS gender_count, SUM(total_sales) AS total_revenue_by_gender FROM sales_data GROUP BY gender ORDER BY total_revenue_by_gender DESC;

-- Basic Queries
-- 4. Retrieve all columns for the first 10 transactions.
SELECT * FROM sales_data LIMIT 10;

-- 5. Get unique product categories.
SELECT DISTINCT(category) FROM sales_data;

-- 6. Find the total number of transactions recorded.
SELECT COUNT(DISTINCT transactions_id) AS total_transactions FROM sales_data;

-- Filtering with WHERE Clause
-- 7. List all transactions where the category is 'Electronics'.
SELECT transactions_id, category FROM sales_data WHERE category = 'Electronics';

-- 8. Retrieve sales made on '2022-01-01'.
SELECT * FROM sales_data WHERE sale_date = '2022-01-01';

-- 9. Get transactions where the price per unit is greater than 500.
SELECT * FROM sales_data WHERE price_per_unit >= 500;

-- 10. Find transactions where the customer's age is between 25 and 40.
SELECT transactions_id, customer_id FROM sales_data WHERE age BETWEEN 25 AND 40;

-- Aggregations
-- 11. Find the total sales revenue for January 2022.
SELECT SUM(total_sales) AS total_sales_revenue_jan2022 FROM sales_data WHERE YEAR(sale_date) = 2022 AND MONTH(sale_date) = 1;

-- 12. Calculate the average price per unit for all transactions.
SELECT AVG(price_per_unit) AS avg_price_per_unit FROM sales_data;

-- 13. Get the maximum quantity sold in a single transaction.
SELECT MAX(quantity) AS max_quantity_per_transaction FROM sales_data;

-- 14. Find the total number of unique customers.
SELECT COUNT(DISTINCT customer_id) AS unique_customers FROM sales_data;

-- 15. Calculate the total cost of goods sold.
SELECT ROUND(SUM(cogs), 2) AS total_cogs FROM sales_data;

-- Grouping and Aggregations
-- 16. Find the total sales revenue per category.
SELECT category, SUM(total_sales) AS total_sales_revenue FROM sales_data GROUP BY category;

-- 17. Show the total number of transactions per gender.
SELECT gender, COUNT(transactions_id) AS transactions_per_gender FROM sales_data GROUP BY gender;

-- 18. Find the top 3 highest-selling categories by revenue.
SELECT category, SUM(total_sales) AS revenue_by_category FROM sales_data GROUP BY category ORDER BY revenue_by_category DESC LIMIT 3;

-- 19. Retrieve categories with total sales above 1000.
SELECT category, total_sales FROM sales_data WHERE total_sales > 1000;

-- Date & Time Functions
-- 20. Find the total sales on weekends.
SELECT SUM(total_sales) AS total_weekend_sales FROM sales_data WHERE DAYOFWEEK(sale_date) IN (1, 7);

-- 21. Get the number of transactions made before 12:00 PM.
SELECT COUNT(transactions_id) AS transactions_before_noon FROM sales_data WHERE TIME(sale_time) < '12:00:00';

-- 22. Find the most popular hour of the day for sales.
SELECT HOUR(sale_time) AS sale_hour, COUNT(*) AS total_sales FROM sales_data GROUP BY sale_hour ORDER BY total_sales DESC LIMIT 1;
