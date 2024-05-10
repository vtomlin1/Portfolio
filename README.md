# Hello! My name is Victoria Tomlinson   
Here are some of the projects that I have worked on. I am always updating as I learn!  
## Projects  

### [Forecasting Housing Prices with Python](/Python)
---     
I attended some virtual workshops from Major League Hacking that taught machine learning in python. In these workshops, we were able to clean the data, manipulate the data to give more accurate results, and build different machine learning algorithms to predict the costs of houses.  

[This](/Python/Data_Cleaning.ipynb) jupyter notebook goes over data exploration and data cleaning. After some data analysis, I have created a [python script](/Python/Preprocessing.py) to preprocess the [testing](/Python/test.csv) and [training](/Python/train.csv) data sets. 

### [SQL Sakila](/SakilaSQL/)  
---   
In this project, I have practiced queries in MySQL from a large example database from the MySQL workbench app. The database is called Sakila (version 1.3) and it consists of sample data that a rental store would have, including customer data, rental history, payment history, information on the films, inventory, and more. The [EER Diagram](/SakilaSQL/Sakila_EER_Diagram.png) shows a visual of what the database looks like. For a more detailed look into the database, [here](/SakilaSQL/sakila-schema.sql) is the schema.  

I wanted to create a rental process where I can see the customer's history, find a film in stock, and add their rental into the database.

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
#### Active Customers

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


## Rental History 
[Table](/SakilaSQL/Rental_History.csv)

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

Supposed Darrell wants another animation film rated PG-13. [This](/SakilaSQL/Films.sql) sql query will grab all of the films from the store in Canada that matches those criteria as well as how many are in stock. 

```sql
/*Gets the ID, Genre, Rating, and Inventory of films*/
SELECT DISTINCT
f.film_id as "ID",
f.title as "Film",
c.name as "Genre",
f.rating as "Rating",
f.description as "Summary",
f.rental_rate as "Price",
f.rental_duration as "Days",
/*Checks the stock of the store in Lethbridge, Canada*/
(SELECT COUNT(*) FROM inventory WHERE film_id = f.film_id AND store_id = 1) AS "Stock"
FROM film f 
    inner join film_category fc
    on f.film_id = fc.film_id
    INNER join category c
    on fc.category_id = c.category_id
    INNER JOIN inventory i 
    ON f.film_id = i.film_id
    INNER JOIN store s
    ON s.store_id = i.store_id

/*Filter by Genre and Rating*/
WHERE c.name = 'Animation' AND Rating = "PG-13";
```

## Recommended Films
[Table](/SakilaSQL/Rental_Films.csv)

| ID | Film | Genre | Rating | Summary | Price | Days | Stock |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 953 | WAIT CIDER | Animation | PG-13 | A Intrepid Epistle o | 0.99 | 3 | 4 |
| 887 | THIEF PELICAN | Animation | PG-13 | A Touching Documenta | 4.99 | 5 | 4 |
| 886 | THEORY MERMAID | Animation | PG-13 | A Fateful Yarn of a  | 0.99 | 5 | 4 |
| 880 | TELEMARK HEARTBREAKE | Animation | PG-13 | A Action-Packed Pano | 2.99 | 6 | 4 |
| 865 | SUNRISE LEAGUE | Animation | PG-13 | A Beautiful Epistle  | 4.99 | 3 | 4 |
| 690 | POND SEATTLE | Animation | PG-13 | A Stunning Drama of  | 2.99 | 7 | 4 |
| 651 | PACKER MADIGAN | Animation | PG-13 | A Epic Display of a  | 0.99 | 3 | 2 |
| 583 | MISSION ZOOLANDER | Animation | PG-13 | A Intrepid Story of  | 4.99 | 3 | 3 |
| 489 | JUGGLER HARDLY | Animation | PG-13 | A Epic Story of a Ma | 0.99 | 4 | 4 |
| 464 | INTENTIONS EMPIRE | Animation | PG-13 | A Astounding Epistle | 2.99 | 3 | 4 |
