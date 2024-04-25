# Hello! My name is Tori Tomlinson   
## Projects   
### SQL Sakila  
---   
The Sakila database (version 1.3) is an example database from the MySQL workbench app. 

![Sakila_EER_Diagram](SakilaSQL/Sakila_EER_Diagram.png)  

```sql
SELECT
    CONCAT('$',amount) AS 'Payment Amount',
    DATE_FORMAT(payment_date, "%d/%m/%Y") AS 'Payment Date'
FROM payment LIMIT 20;
```

