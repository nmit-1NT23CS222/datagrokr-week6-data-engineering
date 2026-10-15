# DataGrokr PLP Week 6: Enterprise Data Engineering SQL Pipeline

## Project Overview

This project demonstrates enterprise-oriented data engineering concepts using MySQL 8.0+.

It implements a Star Schema, range-partitioned sales fact table, incremental data ingestion using UPSERT, transactional stored procedures, audit triggers, JSON data processing, indexes, and query execution-plan analysis.

## Technologies Used

* MySQL 8.0+
* SQL
* MySQL Workbench
* Git and GitHub

## Project Objectives

* Design a dimensional data model using a Star Schema.
* Create customer and product dimension tables.
* Implement a range-partitioned sales fact table.
* Insert and update records using UPSERT logic.
* Manage database operations using transactions.
* Automate audit logging with triggers.
* Query semi-structured JSON attributes.
* Analyze query execution using EXPLAIN ANALYZE.
* Use indexes to support common filtering and join operations.

## Database Architecture

The database contains the following tables:

### dim_customer

Stores customer information, customer segments, effective dates, end dates, and current-record flags.

### dim_product

Stores product information, categories, prices, and JSON attributes.

### fact_sales

Stores sales transactions, quantities, amounts, and transaction dates. The table uses range partitioning based on the year of sale_date.

### sales_audit_log

Records newly inserted sales transactions through an AFTER INSERT trigger.

## Partitioning Strategy

The fact_sales table uses four range partitions:

* p2023: Dates before 2024.
* p2024: Dates in 2024.
* p2025: Dates in 2025.
* p_future: Dates from 2026 onward.

## Advanced SQL Features

* Star Schema dimensional modeling
* Range partitioning
* INSERT ... ON DUPLICATE KEY UPDATE
* Stored procedures
* ACID transaction controls
* Exception handlers and rollback
* AFTER INSERT triggers
* Native JSON columns and JSON path expressions
* Single-column and composite indexes
* EXPLAIN ANALYZE
* Common Table Expressions
* Window functions
* Sales aggregation and ranking

## Project Structure

```text
datagrokr-week6-data-engineering/
├── schema.sql
├── data.sql
├── upsert_procedure.sql
├── triggers.sql
├── json_queries.sql
├── optimization.sql
├── dimensional_queries.sql
├── README.md
└── .gitignore
```

## How to Run

### Prerequisites

Install MySQL Server 8.0+ and MySQL Workbench.

### Execution Order

1. Run schema.sql to create the database and tables.
2. Run data.sql to insert the sample data.
3. Run upsert_procedure.sql to create and test the stored procedure.
4. Run triggers.sql to create the audit trigger.
5. Run json_queries.sql to execute JSON queries.
6. Run dimensional_queries.sql to generate business reports.
7. Run optimization.sql to inspect indexes, partitions, and execution plans.

Execute the files in MySQL Workbench and inspect the result grids.

The schema script drops and recreates the project database. Running it again will erase the existing project data.

## Expected Outcomes

The project demonstrates how SQL can be used to:

* Organize transactional data for analytics.
* Handle incremental data ingestion.
* Maintain transactional consistency.
* Track inserted sales records.
* Extract nested product attributes from JSON.
* Analyze customer and product performance.
* Inspect query execution and table partitions.

## Learning Outcomes

This project develops practical knowledge of relational database design, dimensional modeling, data ingestion, transaction management, stored procedures, triggers, JSON processing, partitioning, indexing, and SQL analytics.

## Repository Contents

The repository contains the SQL scripts required to recreate and explore the project in MySQL.

The database itself is created locally when the scripts are executed.
