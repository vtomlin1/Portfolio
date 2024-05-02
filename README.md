# Hello! My name is Tori Tomlinson   
## Projects   
### [SQL Sakila](/SakilaSQL/)  
---   
The Sakila database (version 1.3) is an example database from the MySQL workbench app. 

[Link to EER Diagram](/SakilaSQL/Sakila_EER_Diagram.png)

[Link to Schema](/SakilaSQL/sakila-schema.sql)

```sql
/*This block gets all the active customers*/
SELECT CONCAT(first_name, ' ', last_name) as 'Customer', RY.country, Y.city, a.address,
DATE_FORMAT(create_date, "%m/%d/%Y") as "Start Date",
email,
get_customer_balance(c.customer_id,NOW()) as "Current Balance"
FROM customer c
    INNER JOIN address a 
    ON a.address_id = c.address_id
    INNER JOIN city Y
    ON Y.city_id = a.city_id
    INNER JOIN country RY
    ON RY.country_id = Y.country_id
/*Filter to get only active customers*/
WHERE active = '1' and RY.country = "Canada"
ORDER BY RY.country ASC
```
This sql code gives the following table. 
## Canada_Customers.csv

| Customer | country | city | address | Start Date | email | Current Balance |
| --- | --- | --- | --- | --- | --- | --- |
| DERRICK BOURQUE | Canada | Gatineau | 1153 Allende Way | 02/14/2006 | DERRICK.BOURQUE@saki | 0.00 |
| DARRELL POWER | Canada | Halifax | 1844 Usak Avenue | 02/14/2006 | DARRELL.POWER@sakila | 0.00 |
| LORETTA CARPENTER | Canada | Oshawa | 891 Novi Sad Manor | 02/14/2006 | LORETTA.CARPENTER@sa | 0.00 |
| CURTIS IRBY | Canada | Richmond Hill | 432 Garden Grove Str | 02/14/2006 | CURTIS.IRBY@sakilacu | 0.00 |
| TROY QUIGLEY | Canada | Vancouver | 983 Santa Fé Way | 02/14/2006 | TROY.QUIGLEY@sakilac | 0.00 |

We can view all of the active customers from Canada, their address, email, and current balance.

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
WHERE CONCAT(first_name, ' ',last_name) = "Darrell Power";
```
This code comes from this sql file [Rental](/SakilaSQL/Rental.sql). 