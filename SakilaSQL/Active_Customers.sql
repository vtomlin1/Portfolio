/*This block gets all the active customers*/
SELECT CONCAT(first_name, ' ', last_name) as 'Customer', RY.country, Y.city, a.address,
DATE_FORMAT(create_date, "%m/%d/%Y") as "Start Date",
email,
/*Used the stored procedure to get the customers' balance*/
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