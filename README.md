# Data Warehouse Project — CRM & ERP Integration (Medallion Architecture)

## Project Overview

This project demonstrates the design and implementation of a Data Warehouse using CRM and ERP CSV datasets as source systems.  
The ETL pipeline follows the Medallion Architecture (Bronze, Silver, Gold) and uses a Truncate and Load strategy for data ingestion and transformation.

The objective of this project is to demonstrate:
- End-to-end data warehouse development
- ETL design using layered architecture
- Dimensional data modeling
- Business-focused analytical tables
- Complete technical and business documentation

---

## Architecture — Medallion Layers

### Bronze Layer (Raw Data)
- Direct ingestion of CSV files from CRM and ERP systems
- Minimal or no transformations
- Full refresh using truncate and load

### Silver Layer (Cleansed and Conformed)
- Data cleansing and standardization
- Deduplication and data quality checks
- Business rules applied
- Conformed dimensions across CRM and ERP

### Gold Layer (Business Ready)
- Star schema implementation
- Fact and dimension tables
- Optimized for reporting and analytics

---

## ETL Strategy

- Load Type: Truncate and Load  
- Suitable for static or small-to-medium datasets  
- ETL Flow:
  1. Load raw CSV data into Bronze tables
  2. Transform and cleanse data into Silver tables
  3. Aggregate and model data into Gold fact and dimension tables


---

## Dataset

Source Systems:
- CRM System (customers, contacts, sales)
- ERP System (orders, products, invoices)

Format: CSV files  
Used as raw input to the Bronze layer.

---

## Data Modeling

The Gold layer follows dimensional modeling using star schema design.

### Dimension Tables
- Customer Dimension
- Product Dimension
- Date Dimension
- Employee or Salesperson Dimension (if applicable)

### Fact Tables
- Sales Fact
- Orders Fact (if applicable)

Dimensions are conformed across both CRM and ERP sources.

---

## Documentation

All project documentation is available in the `docs/` directory:

- Business Object Model
- Data Warehouse Architecture Diagram
- Data Flow Diagram
- Data Integration Design
- Source System Questions and Assumptions
- Logical and Physical Data Models

These documents explain source systems, transformations, and analytical design.

---

## Tools and Technologies

- SQL Server for ETL and transformations
- CSV files as source systems
- Relational database for the Data Warehouse
- GitHub for version control


---

## How to Run the Project

1. Clone the repository
2. Load CSV files from the `dataset/` directory into staging or Bronze tables
3. Execute ETL scripts in sequence:
   - Bronze load procedures
   - Silver transformation procedures
   - Gold aggregation and modeling procedures
4. Query Gold tables for reporting and analysis

---

## Learning Outcomes

This project demonstrates:
- Medallion architecture implementation
- Practical ETL pipeline development
- Dimensional data modeling
- Source-to-target data mapping
- Business-driven warehouse design

---

## Future Enhancements

- Incremental loading instead of full refresh
- Data validation and reconciliation checks
- Workflow orchestration using scheduling tools
- Integration with BI dashboards
- Slowly Changing Dimensions (SCD) implementation

---

## Contributions

This is a learning and portfolio project.  
Suggestions and improvements are welcome through issues or pull requests.
