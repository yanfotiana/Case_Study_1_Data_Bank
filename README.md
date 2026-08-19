# 🏦 Case Study #4 - Data Bank

My solution for **Case Study #4 (Data Bank)** from Danny Ma's **[8 Week SQL Challenge](https://8weeksqlchallenge.com/case-study-4/)**.

![SQL](https://img.shields.io/badge/Language-SQL-blue.svg)
![Database](https://img.shields.io/badge/Database-PostgreSQL-336791.svg)

---

## 📌 Overview

**Data Bank** is a digital neo-bank that links customer cloud storage limits directly to their account balances. This project models transaction behavior, customer node movement across distributed security infrastructure, and forecasts cloud storage provisioning requirements under dynamic financial scenarios.

---

## 🎯 What the Challenge Requires

The challenge requires solving business problems across four key areas:

* **Infrastructure Tracking:** Analyze distributed storage nodes, calculate regional distributions, and quantify node relocation speeds (security reallocations).
* **Customer Transaction Behavior:** Aggregate deposit, withdrawal, and purchase trends to measure user retention, active monthly users, and account growth rates.
* **Capacity Planning & Scenario Modeling:** Estimate total data storage provisioning under three distinct algorithms: previous month-end balance, 30-day moving average, and real-time running balances.
* **Financial Forecasting:** Simulate daily storage limit growth by modeling non-compounding and 6% annual compounding interest over time.

---

## 🧠 Skills & Techniques Gained

* **Advanced Window Functions:** Calculating running totals over complex partitions, applying `LAG()` for period-over-period balance tracking, and using frame clauses (`ROWS BETWEEN`).
* **Complex Data Aggregation:** Generating multi-level conditional summaries (`CASE WHEN`), rolling monthly customer metrics, and tracking balances across custom date ranges.
* **Statistical Distribution & Percentiles:** Computing median, 80th, and 95th percentiles using `PERCENTILE_CONT()` / `PERCENTILE_DISC()` to evaluate infrastructure duration thresholds.
* **Common Table Expressions (CTEs):** Structuring multi-stage modular SQL pipelines to process raw transactional data into business-ready storage metrics.
* **Financial Data Modeling:** Implementing mathematical interest growth logic (daily simple vs. daily compounding compounding interest) directly in SQL queries.

---

## 🎯 Case Study Breakdown & Solutions

| Section | Focus Area | Solution File | Key Objectives |
| :--- | :--- | :--- | :--- |
| **A. Node Exploration** | Infrastructure | [`Solution_Part_A.sql`](./Solution_Part_A.sql) | Calculate node movement frequency, regional distribution, and relocation percentiles. |
| **B. Transactions** | Behavior | [`Solution_Part_B.sql`](./Solution_Part_B.sql) | Measure transaction totals, monthly active depositors, and closing balance growth. |
| **C. Data Allocation** | Capacity Planning | [`Solution_Part_B.sql`](./Solution_Part_C.sql) | Provision storage using end-of-month, 30-day average, and real-time models. |
| **D. Extra Challenge** | Growth Modeling | [`Solution_Part_B.sql`](./Solution_Part_D.sql) | Calculate daily non-compounding vs. 6% compounding interest data limits. |

---

## 🔑 Key Takeaways

* **Relocation Speed:** Customers rotate nodes every **~14 days** on average for security load balancing.
* **Storage Allocation:** **Real-time balance tracking** prevents infrastructure over-provisioning compared to static monthly balance caps.


