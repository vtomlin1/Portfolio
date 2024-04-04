/*USE sakila; */
/*SELECT UPPER(CONCAT(first_name, ' ', last_name)) as 'Actor Name' from actor LIMIT 20;

/* Date_format(<date column>, <format mask>) alters how dates are outputted in SQL */
/*
SELECT
    CONCAT('$',amount) AS 'Payment Amount',
    DATE_FORMAT(payment_date, "%d/%m/%Y") AS 'Payment Date'
FROM payment LIMIT 20;

SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name != 'Joe' and last_name LIKE '%GEN%'
LIMIT 20;
*/

select 
f.title, 
f.rental_rate,
f.release_year

 from film f
   /* inner join inventory i
    on f.film_id = i.film_id 
    inner join rental r
    on i.inventory_id = r.inventory_id
    inner join payment p
    on p.rental_id = r.rental_id*/
order by f.rental_rate DESC
limit 50;