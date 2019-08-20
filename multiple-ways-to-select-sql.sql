/* --All columns in the customer table
Select *
From Customers;

--Name, City, State from customer table
Select Name, City, State
From Customers;

--All customers in OH
Select *
From Customers
Where state = 'OH';

--All customers in OH and KY
Select *
From Customers
Where state = 'OH' or state='KY';

--All customers in OH and KY in order by state in descending order by state and city
Select *
From Customers
Where state = 'OH' or state='KY'
Order by state desc, city; 

--Name of company the exist in Jersey-city
Select Name, City
From Customers
Where city = 'Jersey City'; */

