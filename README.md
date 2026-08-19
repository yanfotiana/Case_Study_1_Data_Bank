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
