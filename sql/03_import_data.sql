--Method 1.
/*Use Import Tool (GUI Method)

Right click your table
Example: olist_customers_dataset

Click → Import/Export Data

Choose:

Import

Filename → Browse your CSV file

Format → CSV

Header → YES

Delimiter → ,

Click OK

Done 
*/
--Method 2.

--1.olist_customers_dataset
COPY olist_customers_dataset
FROM 'H:/data_engineer_project1/data_analytic_project/data_Analytics_level2/ecommerce-data-warehouse-sql/dataset/olist_customers_dataset.csv'
DELIMITER ','
CSV HEADER;
 --Note repet for all table