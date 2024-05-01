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

## Canada_Customers.csv

| Customer | country | city | address | Start Date | email | Current Balance |
| DERRICK BOURQUE | Canada | Gatineau | 1153 Allende Way | 02/14/2006 | DERRICK.BOURQUE@sakilacustomer.org | 0.00 |
| DARRELL POWER | Canada | Halifax | 1844 Usak Avenue | 02/14/2006 | DARRELL.POWER@sakilacustomer.org | 0.00 |
| LORETTA CARPENTER | Canada | Oshawa | 891 Novi Sad Manor | 02/14/2006 | LORETTA.CARPENTER@sakilacustomer.org | 0.00 |
| CURTIS IRBY | Canada | Richmond Hill | 432 Garden Grove Street | 02/14/2006 | CURTIS.IRBY@sakilacustomer.org | 0.00 |
| TROY QUIGLEY | Canada | Vancouver | 983 Santa Fé Way | 02/14/2006 | TROY.QUIGLEY@sakilacustomer.org | 0.00 |
