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

Now suppose that Darrell Power wants to rent a film. We can query his rental history with the following code:
```sql
/*Get customer rental history*/
SELECT 
DATE_FORMAT(rental_date, "%m/%d/%Y") as "Rental Date",
title as "Title",
ca.name as "Genre",
rating as "Rating"
FROM customer c
    INNER JOIN rental r
    ON c.customer_id = r.customer_id
    INNER JOIN inventory i
    ON r.inventory_id = i.inventory_id
    INNER JOIN film f
    ON f.film_id = i.film_id
    INNER JOIN film_category fc
    ON f.film_id = fc.film_id
    INNER JOIN category ca
    ON ca.category_id = fc.category_id


/*Find the specific customer*/
WHERE CONCAT(first_name, ' ',last_name) = "Darrell Power"
order by rental_date DESC;
```


## Rental_History.csv

| Rental Date | Title | Genre | Rating |
| --- | --- | --- | --- |
| 08/22/2005 | THIEF PELICAN | Animation | PG-13 |
| 08/22/2005 | INTENTIONS EMPIRE | Animation | PG-13 |
| 08/21/2005 | DRACULA CRYSTAL | Classics | G |
| 08/20/2005 | SOMETHING DUCK | Drama | NC-17 |
| 08/19/2005 | DIVINE RESURRECTION | Games | R |
| 08/18/2005 | FRENCH HOLIDAY | Documentary | PG |
| 08/17/2005 | ALABAMA DEVIL | Horror | PG-13 |
| 08/02/2005 | POLLOCK DELIVERANCE | Foreign | PG |
| 08/01/2005 | SIEGE MADRE | Family | R |
| 08/01/2005 | CHITTY LOCK | Drama | G |
