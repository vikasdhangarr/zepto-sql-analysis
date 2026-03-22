/* =====================================================
   ZEPTO SQL DATA ANALYSIS PROJECT
   Business Queries (Q1–Q13)
===================================================== */

------------------------------------------------------
-- Q1: Top 10 best-value products based on discount %
------------------------------------------------------
SELECT DISTINCT 
    name, 
    mrp, 
    discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

------------------------------------------------------
-- Q2: Products with high MRP but out of stock
------------------------------------------------------
SELECT DISTINCT 
    name,
    mrp
FROM zepto
WHERE outOfStock = TRUE 
  AND mrp > 300
ORDER BY mrp DESC;

------------------------------------------------------
-- Q3: Estimated revenue for each category
------------------------------------------------------
SELECT 
    category,
    SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue DESC;

------------------------------------------------------
-- Q4: Products with MRP > ₹500 and discount < 10%
------------------------------------------------------
SELECT DISTINCT 
    name, 
    mrp, 
    discountPercent
FROM zepto
WHERE mrp > 500 
  AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

------------------------------------------------------
-- Q5: Top 5 categories with highest avg discount
------------------------------------------------------
SELECT 
    category,
    ROUND(AVG(discountPercent), 2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

------------------------------------------------------
-- Q6: Price per gram (value for money analysis)
------------------------------------------------------
SELECT DISTINCT 
    name, 
    weightInGms, 
    discountedSellingPrice,
    ROUND(discountedSellingPrice / weightInGms, 2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram ASC;

------------------------------------------------------
-- Q7: Product segmentation by weight
------------------------------------------------------
SELECT DISTINCT 
    name, 
    weightInGms,
    CASE 
        WHEN weightInGms < 1000 THEN 'Low'
        WHEN weightInGms < 5000 THEN 'Medium'
        ELSE 'Bulk'
    END AS weight_category
FROM zepto;

------------------------------------------------------
-- Q8: Total inventory weight per category
------------------------------------------------------
SELECT 
    category,
    SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight DESC;

------------------------------------------------------
-- Q9: Top 10 revenue-generating products
------------------------------------------------------
SELECT 
    name,
    SUM(discountedSellingPrice * availableQuantity) AS revenue
FROM zepto
GROUP BY name
ORDER BY revenue DESC
LIMIT 10;

------------------------------------------------------
-- Q10: Discount range vs total inventory
------------------------------------------------------
SELECT 
    CASE 
        WHEN discountPercent < 10 THEN 'Low Discount'
        WHEN discountPercent < 30 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_range,
    SUM(availableQuantity) AS total_units
FROM zepto
GROUP BY discount_range
ORDER BY total_units DESC;

------------------------------------------------------
-- Q11: Most expensive product in each category
------------------------------------------------------
SELECT 
    category, 
    name, 
    mrp
FROM zepto z1
WHERE mrp = (
    SELECT MAX(mrp)
    FROM zepto z2
    WHERE z1.category = z2.category
);

------------------------------------------------------
-- Q12: Low stock alert (inventory < 10)
------------------------------------------------------
SELECT 
    name, 
    availableQuantity
FROM zepto
WHERE availableQuantity < 10
ORDER BY availableQuantity ASC;

------------------------------------------------------
-- Q13: Duplicate products (data quality check)
------------------------------------------------------
SELECT 
    name, 
    category, 
    COUNT(*) AS duplicate_count
FROM zepto
GROUP BY name, category
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;
