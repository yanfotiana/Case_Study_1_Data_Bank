-- 1. How many unique nodes are there on the Data Bank system?
SELECT COUNT(DISTINCT node_id) AS unique_nodes
FROM customer_nodes;

-- 2. What is the number of nodes per region?
SELECT r.region_name,
    COUNT(DISTINCT node_id) AS total_nodes_region
FROM regions r
JOIN customer_nodes c
ON r.region_id = c.region_id
GROUP BY 1;

-- 3. How many customers are allocated to each region?
SELECT region_name,
    COUNT(DISTINCT customer_id) AS total_customers
FROM regions r
JOIN customer_nodes c
ON r.region_id = c.region_id
GROUP BY 1
ORDER BY 2 DESC;

-- 4. How many days on average are customers reallocated to a different node?
WITH days_in_node AS (
SELECT customer_id,
    node_id,
    SUM(datediff('days',start_date,end_date)) AS days_in_node
FROM customer_nodes
WHERE end_date <> '9999-12-31'
GROUP BY 1,2
ORDER BY 1,2
)
SELECT 
    ROUND((AVG(days_in_node)),0) AS avg_days_in_node
FROM days_in_node;

-- 5. What is the median, 80th and 95th percentile for this same reallocation days metric for each region?
WITH days_in_node AS (
SELECT region_name,
    customer_id,
    node_id,
    SUM(datediff('days',start_date,end_date)) AS days_in_node
FROM customer_nodes c
JOIN regions r
ON c.region_id = r.region_id
WHERE end_date <> '9999-12-31'
GROUP BY 1,2,3
ORDER BY 1,2,3
)
SELECT region_name,
    ROUND((MEDIAN(days_in_node)),0) AS median_days_in_node,
    ROUND(PERCENTILE_CONT(0.80) WITHIN GROUP (ORDER BY days_in_node),0) AS pc_80_days_in_node,
    ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY days_in_node),0) AS pc_95_days_in_node
FROM days_in_node
GROUP BY 1;
