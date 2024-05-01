/*USE sakila; */
/*SELECT UPPER(CONCAT(first_name, ' ', last_name)) as 'Actor Name' from actor LIMIT 20;

/* Date_format(<date column>, <format mask>) alters how dates are outputted in SQL */

/*SELECT
    CONCAT('$',amount) AS 'Payment Amount',
    DATE_FORMAT(payment_date, "%m/%d/%Y") AS 'Payment Date'
FROM payment LIMIT 20;*/

/*SELECT actor_id, concat(first_name, ' ', last_name) as 'Actor Name'
FROM actor
WHERE last_name LIKE '%GEN%'
LIMIT 50;*/


select 
f.title, 
f.rental_rate,
f.release_year

 from film f
    inner join inventory i
    on f.film_id = i.film_id 
    inner join rental r
    on i.inventory_id = r.inventory_id
    inner join payment p
    on p.rental_id = r.rental_id
order by f.rental_rate DESC
limit 50;


/*This block identifies the genre of each film*/
select 
f.title as "Film",
c.name as "Genre",
f.rating as "Rating"
from film f 
    left join film_category fc
    on f.film_id = fc.film_id
    left join category c
    on fc.category_id = c.category_id;


/*This block gets all the active customers*/
SELECT  RY.country, Y.city, CONCAT(first_name, ' ', last_name) as 'Customer', email, 
DATE_FORMAT(create_date, "%m/%d/%Y") as "Start Date"
FROM customer c
    INNER JOIN address a 
    ON a.address_id = c.address_id
    INNER JOIN city Y
    ON Y.city_id = a.city_id
    INNER JOIN country RY
    ON RY.country_id = Y.country_id

WHERE active = '1'
ORDER BY RY.country ASC

/*Gets the store location and ID*/
/*SELECT 
s.store_id as "ID",
y.country as "Country",
c.city as "City"
FROM store s
    inner join address a
    on s.address_id = a.address_id
    inner join city c
    on a.city_id = c.city_id
    inner join country y
    on c.country_id = y.country_id;*/