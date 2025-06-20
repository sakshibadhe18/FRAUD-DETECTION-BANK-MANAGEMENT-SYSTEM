# FRAUD-DETECTION-BANK-MANAGEMENT-SYSTEM
# 💳 Fraud Detection Bank Management System

A comprehensive SQL-based system designed to manage customer accounts, transactions, and identify potential fraudulent activity within a banking environment.

## Project Overview

This project simulates a real-world banking system with added intelligence for detecting suspicious transactions. It includes:

- Customer & Account Management
- Transaction History
- Fraud Alert Generation
- Fraud Investigation Workflow
- Analytical SQL Queries for Business Insights

---

##  Objective

To build a **Bank Management System** enhanced with **Fraud Detection Logic**, using:
- Relational Database Design
- Advanced SQL Queries
- Realistic Sample Data
- Performance-focused Schema

---

## Database Design

###  ER Diagram
The system uses a well-structured ER diagram involving key entities:

- `Customer`
- `Account`
- `Transaction`
- `Fraud_Alert`
- `Fraud_Investigation`

###  Schema Summary

| Table               | Description                                   |
|--------------------|-----------------------------------------------|
| `Customer`          | Stores customer personal details              |
| `Account`           | Stores customer bank accounts and balance     |
| `Transaction`       | Records deposits, withdrawals, transfers      |
| `Fraud_Alert`       | Auto-generated alerts based on transaction rules |
| `Fraud_Investigation` | Investigates alerts for actual fraud        |

---

##  Sample Queries

Here are a few powerful queries used in this project:

- List customers with high-risk accounts
- Detect abnormal transaction spikes
- Join customer & transaction data
- Identify unresolved fraud cases
- Calculate account status and activity

---

##  Fraud Detection Logic

Fraud detection rules include:

- Transactions above a certain threshold
- Multiple rapid transactions
- Unusual account behavior
- Flagged countries or locations (optional extension)

These trigger alerts that are later reviewed in the investigation table.

---

##  Sample Data

The database comes with sample insert data for:

- 10+ Customers  
- 15+ Accounts  
- 50+ Transactions  
- 5+ Fraud Alerts  
- Investigations (manual review outcomes)

---

---

##  Getting Started

### Requirements
- MySQL Workbench / Any SQL IDE
- MySQL Server 8.x+

### Setup
1. Clone the repository
2. Import `schema.sql` to create tables
3. Import `sample_data.sql` for data
4. Run `fraud_queries.sql` to explore detection logic

---

## 📈 Future Enhancements

- Power BI dashboard integration
- Trigger-based real-time fraud detection
- Role-based access (Admin, Investigator)
- Integration with a front-end banking interface

---

##  Author ##

**Sakshi Badhe**  
B.Sc. Computer Science | SQL Developer  
📧 Email: sakshibadhe18@gmail.com  
📍 Location: India  
🔗 LinkedIn:https://www.linkedin.com/in/sakshi-badhe-2a4359333

---


