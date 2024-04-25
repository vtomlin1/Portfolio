/*IDEA:
If someone wants to rent something,
1. Check rent history
2. Check any overdue payments
3. Check if it is in stock

/*Gets the unique ID, Genre, and Rating for each film*/
SELECT 
f.film_id as "ID",
f.title as "Film",
c.name as "Genre",
f.rating as "Rating"
FROM film f 
    inner join film_category fc
    on f.film_id = fc.film_id
    INNER join category c
    on fc.category_id = c.category_id
/*Filter for Comedies with a specific rating*/
WHERE c.name = 'Comedy' AND Rating = "PG";

/*Gets the store location and ID*/
SELECT 
s.store_id as "ID",
y.country as "Country",
c.city as "City"
FROM store s
    inner join address a
    on s.address_id = a.address_id
    inner join city c
    on a.city_id = c.city_id
    inner join country y
    on c.country_id = y.country_id;

