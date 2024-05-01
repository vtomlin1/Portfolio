/*IDEA:
If someone wants to rent something,
1. Check rent history
2. Check any overdue payments
3. Check if it is in stock
*/

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


/*Gets the ID, Genre, Rating, and Inventory of films*/
SELECT 
f.film_id as "ID",
f.title as "Film",
c.name as "Genre",
f.rating as "Rating",
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
WHERE c.name = 'Comedy' AND Rating = "PG";



