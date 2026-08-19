# 🏦 Case Study #4 - Data Bank

My solution for **Case Study #4 (Data Bank)** from Danny Ma's **[8 Week SQL Challenge](https://8weeksqlchallenge.com/case-study-4/)**.

![SQL](https://img.shields.io/badge/Language-SQL-blue.svg)
![Database](https://img.shields.io/badge/Database-PostgreSQL-336791.svg)

---

## 📌 Overview

**Data Bank** is a digital neo-bank where customer cloud storage limits are tied directly to their account balances. The objective is to analyze transaction patterns, customer node movement, and model storage capacity requirements under different balance-tracking algorithms.

---

## 🗄️ Database Architecture

* **`regions`**: Regional distribution mapping (`region_id`, `region_name`).
* **`customer_nodes`**: Customer node assignments and movement history (`start_date`, `end_date`).
* **`customer_transactions`**: All deposits, withdrawals, and purchases (`txn_type`, `txn_amount`).

---

## 🎯 Case Study Breakdown 

| Section | Focus Area | Key Metrics Analyzed |
| :--- | :--- | :--- |
| **A. Node Exploration** | Infrastructure | Node distribution, relocation frequency, regional customer counts |
| **B. Transactions** | Behavior | Deposit vs. churn, monthly active users, closing balances |
| **C. Data Allocation** | Capacity Planning | End-of-month, 30-day average, and real-time running balance limits |
| **D. Extra Challenge** | Growth Modeling | Impact of 6% annual compounding/non-compounding interest on storage |


---

## 🔑 Key Takeaways

* **Relocation Speed:** Customers rotate nodes every **~14 days** on average for security load balancing.
* **Storage Allocation:** **Real-time balance tracking** prevents infrastructure over-provisioning compared to static monthly balance caps.

