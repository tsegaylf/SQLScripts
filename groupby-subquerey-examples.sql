Select *
From Customers;

Select *
From Orderlines;

Select *
From Orders;

--What is the total sales for all customers
Select Sum(Sales)
From Customers;

--What are the total sales by city
Select City, Count(*) as 'Number of Customers', Sum(Sales) as 'Total Sale'
From Customers
Group by City
Order by [Total Sale];

--List only those with 'Total Sale' > 600000 
--Can't use the Where clause here because that only goes through individual records not aggregated functions.
Select City, Count(*) as 'Number of Customers', Sum(Sales) as 'Total Sale'
From Customers
Group by City
Having sum(Sales) > 600000
Order by [Total Sale] desc;

--Which customers whos sales are greater than the AVG of all customers AVG sales = 56951.857142
Select *
From Customers
Where sales > 50000;

Select name as 'Customer Name', Avg(Sales) as 'Total Sales'
From Customers
Group by name
Having Avg(Sales) > 56951.857142
Order by [Total Sales];

--EX
--If there was another sale from Kroger to make that change:
--{Update customers set sales = sales + 100000 where name ='Kroger'} 
--You will have to rewrite your querey for every change, so instead use a Sub Querey/Sub Select
--The below querey produces the same result as the one above
Select *
From Customers
Where Sales > (Select avg(sales) From Customers);

--Find top 3 companies by sales
Select Top 3 *
From Customers
Order By Sales desc;

--Using Where with IN
Select *
From Customers
Where Id=1 or Id=27 or Id=34;

Select *
From Customers
Where Id in (1,27,34);

Select ID
From Customers
Where Name in ('Kroger', 'Nationwide', 'Abercrombie Fitch')

--Using Inner Select
Select * 
From Customers
Where ID in (Select ID
From Customers
Where Name in ('Kroger', 'Nationwide', 'Abercrombie Fitch'));
