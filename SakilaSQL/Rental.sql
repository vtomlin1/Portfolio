/*IDEA:
If someone wants to rent something,
1. Check rent history
2. Check any overdue payments
3. Check if it is in stock
*/

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

