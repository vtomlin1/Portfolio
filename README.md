# Hello! My name is Tori Tomlinson   
## Projects   
### [SQL Sakila](/SakilaSQL/)  
---   
The Sakila database (version 1.3) is an example database from the MySQL workbench app. 

[Link to EER Diagram](/SakilaSQL/Sakila_EER_Diagram.png)

[Link to Schema](/SakilaSQL/sakila-schema.sql)
```sql
/*Check the current balance of the customer*/
SELECT 
customer_id, 
CONCAT(first_name, ' ',last_name) as "Name",
email,
/*Use a stored function to retrieve the current balance*/
get_customer_balance(customer_id,NOW())
FROM customer
/*Find the specific customer*/
WHERE CONCAT(first_name, ' ',last_name) = "VICTORIA GIBSON";
```
This code comes from this sql file [Rental](/SakilaSQL/Rental.sql).
