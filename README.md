# wnba-market-segmentation
Certain WNBA markets show high demographic potential and digital interest but underperform in live attendance—indicating missed revenue opportunities that also contribute to a temporary undervaluation of league media rights.

Future improvements:
1. Use a Modular Folder Structure
   /src
     /ingest
     /cleaning
     /transform
     /metrics
     /visualization
   /sql
     interest_queries.sql
     attendance_queries.sql
     demographics_queries.sql
   /data
   /notebooks

3. Parameterize SQL rather than hardcode
   Current SQL queries are static, might look to improve by using jinja templtes, environment variables, config file. Purpose 
5. Normalize Data Model
6. Centralize Metric Definitions
7. Add Data Validation
8. Add Documentation
   
