# 🛒 Zepto SQL Data Analysis Project

## 📌 Project Overview

This project focuses on analyzing product-level data from a quick-commerce platform (Zepto) using **PostgreSQL**. The goal is to extract meaningful business insights related to pricing, discounts, inventory, and revenue.

---

## 📥 Dataset Source

The dataset used in this project was sourced from **Kaggle**, 


## 🗂️ Dataset Description

The dataset contains product-level information with the following fields:

| Column Name            | Description                     |
| ---------------------- | ------------------------------- |
| sku_id                 | Unique product identifier       |
| category               | Product category                |
| name                   | Product name                    |
| mrp                    | Maximum Retail Price            |
| discountPercent        | Discount percentage             |
| availableQuantity      | Units available in stock        |
| discountedSellingPrice | Final selling price             |
| weightInGms            | Product weight                  |
| outOfStock             | Stock availability (True/False) |
| quantity               | Pack size                       |

---

## ⚙️ Database Setup

```sql
DROP TABLE IF EXISTS zepto;

CREATE TABLE zepto (
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INTEGER,
    discountedSellingPrice NUMERIC(8,2),
    weightInGms INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER
);
```

---

## 🔍 Data Exploration

* Count total records
* View sample data
* Identify null values
* Explore unique product categories
* Analyze stock availability
* Detect duplicate products

---

## 🧹 Data Cleaning

* Removed products with invalid pricing (`MRP = 0`)
* Converted price from **paise to rupees**
* Ensured data consistency for analysis

---

## 📊 Business Questions & SQL Analysis

### 🔹 Q1: Top 10 Best Discounted Products

Identified products offering the highest discounts.

---

### 🔹 Q2: High MRP but Out of Stock

Highlighted expensive products currently unavailable.

---

### 🔹 Q3: Estimated Revenue by Category

```sql
SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category;
```

---

### 🔹 Q4: Premium Products with Low Discounts

Products priced above ₹500 with minimal discounts.

---

### 🔹 Q5: Categories with Highest Average Discounts

Top 5 categories based on average discount percentage.

---

### 🔹 Q6: Price Per Gram Analysis

Compared value for money across products.

---

### 🔹 Q7: Product Segmentation by Weight

Grouped products into:

* Low (< 1kg)
* Medium (1kg–5kg)
* Bulk (> 5kg)

---

### 🔹 Q8: Total Inventory Weight per Category

Measured stock volume across categories.

---

### 🔹 Q9: Top Revenue-Generating Products

```sql
SELECT name,
SUM(discountedSellingPrice * availableQuantity) AS revenue
FROM zepto
GROUP BY name
ORDER BY revenue DESC
LIMIT 10;
```

---

### 🔹 Q10: Discount Range vs Inventory

Grouped products into:

* Low Discount (<10%)
* Medium Discount (10–30%)
* High Discount (>30%)

Analyzed stock distribution across these groups.

---

### 🔹 Q11: Most Expensive Product in Each Category

Used subquery to identify premium items per category.

---

### 🔹 Q12: Low Stock Alert

Detected products with inventory less than 10 units.

---

### 🔹 Q13: Duplicate Product Detection

Identified duplicate entries based on name and category.

---

## 💡 Key Insights

* High-discount products tend to have larger inventory volumes
* Certain high-MRP products are frequently out of stock
* Revenue is concentrated in a few key categories
* Duplicate product entries highlight potential data quality issues

---

## 🚀 Skills Demonstrated

* SQL (PostgreSQL)
* Data Cleaning & Transformation
* Aggregations & Grouping
* Subqueries
* CASE Statements
* Business Insight Generation

---


## 📌 Conclusion

This project demonstrates how SQL can be used to transform raw e-commerce data into actionable business insights, helping in **inventory management, pricing strategy, and revenue optimization**.

---

