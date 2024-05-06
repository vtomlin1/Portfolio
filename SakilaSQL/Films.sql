
/*Gets the ID, Genre, Rating, and Inventory of films*/
SELECT DISTINCT
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
WHERE c.name = 'Animation' AND Rating = "PG-13";