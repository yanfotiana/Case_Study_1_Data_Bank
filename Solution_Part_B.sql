-- 1. What is the unique count and total amount for each transaction type?
SELECT *
FROM customer_transactions
ORDER BY customer_id;

SELECT txn_type,
    COUNT(*) AS total_transactions,
    SUM(txn_amount) AS total_amount
FROM customer_transactions
GROUP BY 1;
-- 2. What is the average total historical deposit counts and amounts for all customers?
WITH historical_deposit AS (
SELECT customer_id,
    COUNT(*) AS total_transactions,
    AVG(txn_amount) AS total_amount
FROM customer_transactions
WHERE txn_type = 'deposit'
GROUP BY 1
)
SELECT ROUND(AVG(total_transactions),2),
    ROUND(AVG(total_amount),2)
FROM historical_deposit;

-- 3. For each month - how many Data Bank customers make more than 1 deposit and either 1 purchase or 1 withdrawal in a single month?
SELECT 
    MIN(txn_date),
    MAX(txn_date)
FROM customer_transactions;

WITH CTE AS (
SELECT 
    DATE_TRUNC('month', txn_date) AS month,
    customer_id,
    SUM(CASE WHEN txn_type = 'deposit' THEN 1 ELSE 0 END) AS deposits,
    SUM(CASE WHEN txn_type <> 'deposit' THEN 1 ELSE 0 END) AS purchase_or_withdrawal
FROM customer_transactions
GROUP BY 1,2
    HAVING SUM(CASE WHEN txn_type = 'deposit' THEN 1 ELSE 0 END) > 1
    AND SUM(CASE WHEN txn_type <> 'deposit' THEN 1 ELSE 0 END) = 1
)
SELECT
    month,
    COUNT(customer_id) AS total_customers
FROM CTE
GROUP BY 1;

-- 4. What is the closing balance for each customer at the end of the month?
WITH monthly_changes AS (
SELECT customer_id,
    DATE_TRUNC('month',txn_date) AS month_start,
    SUM(CASE WHEN txn_type = 'deposit' THEN txn_amount
    ELSE -txn_amount
    END) AS net_monthly_change
FROM customer_transactions
GROUP BY 1,DATE_TRUNC('month',txn_date)
ORDER BY customer_id,DATE_TRUNC('month',txn_date)
)
SELECT customer_id,
    DATEADD('day',-1,DATEADD('month',1,month_start)) AS end_of_month,
    net_monthly_change,
    SUM(net_monthly_change) OVER (PARTITION BY customer_id
        ORDER BY month_start
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
        AS closing_balance
FROM monthly_changes;
