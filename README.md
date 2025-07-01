# Online Sales SQL Analysis

## Project Overview

This project showcases a comprehensive SQL-based analysis of online sales data. The task was completed as part of an internship assignment using **MariaDB** hosted on **XAMPP**. The goal was to explore sales performance across various dimensions and generate actionable insights using SQL queries.

## Tools and Environment

- **Database**: MariaDB  
- **Server**: XAMPP (Apache, MariaDB, PHP, Perl)  
- **Query Interface**: phpMyAdmin / MySQL Workbench  
- **Data Format**: Excel (.xlsx)

## Dataset Description

The data was imported from an Excel file into a relational database with a single table named `orders`. The structure of the `orders` table is as follows:

- `Order_ID`: Unique identifier for each order  
- `Amount`: Total amount of the order  
- `Profit`: Profit earned from the order  
- `Quantity`: Number of units ordered  
- `Category`: Main product category  
- `Sub_Category`: Sub-category of the product  
- `Order_Date`: Date when the order was placed  
- `Payment_Mode`: Payment method used  
- `State`: State of the shipping address  
- `City`: City of the shipping address

## Analysis Objectives

The SQL analysis focuses on the following key business questions:

### 1. Revenue Analysis

- Calculate total sales revenue  
- Display monthly and daily revenue trends  

### 2. Profitability Insights

- Compute average profit  
- Measure overall profit margins  

### 3. Sales Volume

- Analyze overall and segmented order volumes  

### 4. Top Performers

- Identify top-performing states and cities  
- Rank high-selling categories and sub-categories  

### 5. Payment Trends

- Summarize popular payment modes used by customers

## Deliverables

The repository includes the following:

- `Online_Sales.xlsx`: Original Excel dataset used for importing  
- `online_sales_analysis.sql`: SQL script file containing all analysis queries  
- `Tables_with_queries.zip`: A compressed file that contains all SQL queries, screenshots, and result tables, organized for easy access and review

## Execution Notes

All queries were successfully executed in MariaDB. The data import was done through XAMPP, and the queries were tested using both phpMyAdmin and MySQL Workbench.

## Feedback and Contributions

Suggestions for improvements in query structure or performance optimization are welcome. Feel free to fork the repository or submit issues if you have recommendations.
