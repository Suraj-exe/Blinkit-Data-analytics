# Blinkit-Data-analytics
This project presents a comprehensive SQL-based analysis of BlinkIT's grocery sales data. It explores product-level trends, outlet performance, customer behavior, and operational insights across various retail locations.

# BlinkIT Grocery Data Analysis using SQL 🛒📊

This project presents a comprehensive SQL-based analysis of BlinkIT's grocery sales data. It explores product-level trends, outlet performance, customer behavior, and operational insights across various retail locations.

## 📁 Dataset Summary

- **Total Records**: 8,523
- **Attributes**: Item types, fat content, outlet details, ratings, sales, etc.
- **Database Used**: `blinkitdb`
- **Table**: `blinkit_data`

## 🎯 Objectives

- Standardize inconsistent entries (e.g., `Item_Fat_Content`)
- Analyze total and average sales metrics across multiple dimensions
- Use aggregation, filtering, grouping, and pivoting techniques
- Derive insights on outlet performance based on size, location, and establishment year

## 💻 Key SQL Tasks

- Data Cleaning (`Item_Fat_Content` normalization)
- Total & Average Sales by:
  - Fat Content
  - Item Type
  - Outlet Size, Type, and Establishment Year
- Sales % Contribution using `OVER()` and Window Functions
- Pivot Analysis for Outlet Location vs Fat Content
- Top Performing Items and Store Types

## 📈 Sample Insights

- **Low Fat items** contributed the highest to total sales.
- **Supermarket Type1** stores dominated sales across all outlet types.
- **Tier 1 cities** outperformed other tiers in sales volume and average rating.
- Most outlets established post-2010 had higher average customer ratings.

## 🧠 Skills & Concepts Demonstrated

- SQL Aggregates & Grouping
- Case-When Conditions for Cleaning
- Window Functions for % Contribution
- Pivoting & Multi-dimensional Metrics
- Business-oriented Data Analysis
