# Hello! My name is Tori Tomlinson   

These are some of the projects that I have worked on.  

## Projects   
### SQL Sakila  
---   
The Sakila database (version 1.3) is a free database that I have worked with to practice MySQL.  
Below is the EER diagram for the Sakila Database.  

![Sakila_EER_Diagram](SakilaSQL/Sakila_EER_Diagram.png)  

```sql
SELECT
    CONCAT('$',amount) AS 'Payment Amount',
    DATE_FORMAT(payment_date, "%d/%m/%Y") AS 'Payment Date'
FROM payment LIMIT 20;
```

