# Data Warehouse and Intelligent Decision Support System  
## CRM and ERP Integration using Medallion Architecture

## Project Overview

This project demonstrates the design and implementation of an end-to-end Enterprise Data Warehouse integrating CRM and ERP systems. The solution follows the Medallion Architecture (Bronze, Silver, Gold) and implements dimensional modeling using a star schema.

The project was further extended into an Intelligent Decision Support System (DSS) by integrating predictive analytics, rule-based decision logic, what-if scenario simulation, and an interactive Power BI dashboard.

The system transforms raw operational data into predictive insights and actionable business recommendations.

---

## Architecture Overview

### Phase 1: Data Warehouse Implementation

#### Bronze Layer
- Raw ingestion of CRM and ERP CSV datasets  
- Truncate and load strategy  
- Minimal transformations  

#### Silver Layer
- Data cleansing and validation  
- Standardization and deduplication  
- Conformed dimensions across CRM and ERP  

#### Gold Layer
- Star schema design  
- Fact and dimension tables  
- Optimized for analytical queries  

### Core Gold Tables

#### Dimension Tables
- Customer Dimension  
- Product Dimension  
- Date Dimension  
- Salesperson Dimension (if applicable)  

#### Fact Tables
- Sales Fact  
- Orders Fact  

---

## Intelligent Decision Support System Extension

The warehouse was extended into an Intelligent DSS by adding predictive modeling and decision logic on top of the Gold layer.

### Predictive Analytics Layer

A global country-aware forecasting model was developed using:

- Python (pyodbc, pandas, scikit-learn)  
- Monthly aggregated sales data from SQL Server  
- One-hot encoding for country feature  
- Time-aware train/test split  

**Target Variable:** Monthly Sales  

**Evaluation Metrics:**  
- MAE ≈ 196K  
- RMSE ≈ 216K  

The model captures temporal trends and regional differences while remaining interpretable for business stakeholders.

---

## Decision Rules Engine

Predictions are processed through a rule-based decision layer to generate business recommendations.

### Example Decision Rules

- If predicted sales > historical average × 1.10 → Increase inventory allocation  
- If predicted sales < historical average × 0.90 → Reduce inventory exposure  
- If country = United States → Mark as high priority market  
- If predicted sales below global average → Trigger marketing intervention  

This converts forecasts into operational actions.

---

## What-If Scenario Simulation

A scenario analysis layer enables demand variation testing. Users can simulate:

- Demand increase or decrease percentages  
- Regional shifts  
- Seasonal changes  

This supports proactive inventory planning, revenue forecasting, and risk mitigation.

---

## Power BI Presentation Layer

An interactive Power BI dashboard was built as the presentation and interaction layer of the DSS.

Features include:

- Country-wise forecast visualization  
- Monthly sales trend analysis  
- KPI indicators  
- What-if demand slider  
- Dynamic decision output updates  

The dashboard allows business users to simulate scenarios and instantly observe their impact.

---

## End-to-End System Flow

## End-to-End System Flow

CRM & ERP Source Data  
        ↓  
Bronze Layer (Raw Ingestion)  
        ↓  
Silver Layer (Cleansed & Conformed)  
        ↓  
Gold Layer (Star Schema)  
        ↓  
Country-wise Aggregation  
        ↓  
Global ML Forecast Model  
        ↓  
Decision Rules Engine  
        ↓  
What-If Simulation  
        ↓  
Power BI Dashboard  
        ↓  
Actionable Business Decisions


---

## Technologies Used

- SQL Server  
- Python (pyodbc, pandas, scikit-learn, numpy)  
- Power BI  
- CSV source systems  
- GitHub  

---

## Key Achievements

- Implementation of Medallion architecture  
- Dimensional modeling using star schema  
- End-to-end ETL pipeline development  
- Integration of machine learning with SQL Server  
- Explainable forecasting model  
- Rule-based intelligent decision system  
- Scenario-driven business simulation  
- Interactive executive-level dashboard  

---

## Conclusion

This project demonstrates how structured enterprise data can evolve from a traditional data warehouse into a fully functional Intelligent Decision Support System.

It integrates data engineering, predictive analytics, and business intelligence into a cohesive architecture capable of delivering data-driven strategic decisions.
