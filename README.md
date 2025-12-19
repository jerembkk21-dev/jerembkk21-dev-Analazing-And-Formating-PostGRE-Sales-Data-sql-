# jerembkk21-dev-Analazing-And-Formating-PostGRE-Sales-Data-sql-

Super Store SQL Data Cleaning & Analysis

**Description**
In this project, I worked with transactional data from a hypothetical Super Store to practice SQL data cleaning, aggregation, and analytical queries. The dataset contained inconsistent data types and missing values, requiring careful preprocessing before analysis.

**Key Tasks & Solutions**
**1) Top Products Analysis**
- Joined orders and products tables to analyze product performance.
- Aggregated sales and profit at the product level.
- Used ROW_NUMBER() window function to rank products within each category.
- Identified the top 5 products per category based on total sales, ensuring correct partitioning and ordering.
  
**2) Missing Data Imputation**
- Detected orders with missing quantity values.
- Calculated unit prices per product using historical sales and quantity data.
- Estimated missing quantities using calculated unit prices.
- Ensured results returned only affected records, matching the expected number of missing values.

**3) Skills Demonstrated**
- SQL joins and aggregations
- Window functions (ROW_NUMBER)
- Data type handling and rounding
- Missing data detection and imputation
- Writing clean, production-ready SQL queries
