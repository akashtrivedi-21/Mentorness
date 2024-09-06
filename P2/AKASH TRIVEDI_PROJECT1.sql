use Akash_project;

/* 1.Retrieve all columns for sales made in a specific branch (e.g., Branch 'A'). */

SELECT *
FROM WalmartData
WHERE Branch = 'A';

/* 2.Find the total sales for each product line. */

SELECT Product_Line, SUM(Total) AS TotalSales
FROM WalmartData
GROUP BY Product_Line;


/* 3.List all sales transactions where the payment method was 'Cash'. */

SELECT *
FROM WalmartData
WHERE Payment = 'Cash';


/* 4.Calculate the total gross income generated in each city. */

SELECT City, SUM(gross_income) AS TotalGrossIncome
FROM WalmartData
GROUP BY City;



/* 5.Find the average rating given by customers in each branch. */

SELECT Branch, AVG(Rating) AS AverageRating
FROM WalmartData
GROUP BY Branch;


/* 6.Determine the total quantity of each product line sold. */

SELECT Product_Line, SUM(Quantity) AS TotalQuantitySold
FROM WalmartData
GROUP BY Product_line;



/* 7.List the top 5 products by unit price. */

SELECT TOP 5 Product_line, Unit_price
FROM WalmartData
ORDER BY Unit_price DESC;


/* 8.Find sales transactions with a gross income greater than 30. */

SELECT *
FROM WalmartData
WHERE gross_income > 30;


/* 9.Retrieve sales transactions that occurred on weekends. */

SELECT * 
FROM WalmartData 
WHERE DATENAME(WEEKDAY, date) IN ('Saturday', 'Sunday');


/* 10.Calculate the total sales and gross income for each month. */

SELECT CONVERT(VARCHAR(7), date, 120) AS month, 
       SUM(total) AS total_sales, 
       SUM(gross_income) AS total_gross_income
FROM WalmartData 
GROUP BY CONVERT(VARCHAR(7), date, 120);

/*120 style corresponds to the ODBC canonical format, which is yyyy-mm-dd. 
When you use CONVERT(VARCHAR(7), date, 120), 
it converts the date to yyyy-mm format by truncating the day part.*/



/* 11.Find the number of sales transactions that occurred after 6 PM. */

SELECT COUNT(*) AS Transactions_after_6pm
FROM WalmartData 
WHERE Time > '18:00:00';


/* 12.List the sales transactions that have a higher total than the average total of all transactions. */

SELECT * FROM WalmartData
WHERE total > (SELECT AVG(total) FROM WalmartData);




/* 13.Calculate the cumulative gross income for each branch by date. */

SELECT branch, date, SUM(gross_income) OVER (PARTITION BY branch ORDER BY date) AS cumulative_gross_income
FROM WalmartData;




/* 15.Find the total cogs for each customer type in each city. */

SELECT city, customer_type, SUM(cogs) AS total_cogs FROM WalmartData
GROUP BY city, customer_type;

