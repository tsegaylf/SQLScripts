Select *
From Orders;

-- match up customer to the customerid 
Select *
From Orders
join Customers
on orders.CustomerId = Customers.Id; 

-- only include columns name, city, state, date then order by name. 
Select name, city, state, date 
From Orders
join Customers
on orders.CustomerId = Customers.Id
order by name; 

-- only include columns name, city, state, date then order by name. Include ID from orders table.
Select name, city, state, orders.Id, date 
From Orders
join Customers
on orders.CustomerId = Customers.Id
order by name;


-- add alias for order id, name, date. 
Select name as 'Customer', city, state, orders.Id as 'Order ID', date as 'Order Date'
From Orders
join Customers
on orders.CustomerId = Customers.Id
order by name;


--Use function to combine city and state. Then rename column.
Select name as 'Customer', CONCAT(City, ', ', state) as 'City/State', orders.Id as 'Order ID', date as 'Order Date'
From Orders
join Customers
on orders.CustomerId = Customers.Id
order by name;

--change the way date looks
Select name as 'Customer', CONCAT(City, ', ', state) as 'City/State', orders.Id as 'Order ID', format(date, 'MMM dd,yyy') as 'Order Date'
From Orders
join Customers
on orders.CustomerId = Customers.Id
order by name;


--just want orders for the company KFC
Select name as 'Customer', CONCAT(City, ', ', state) as 'City/State', orders.Id as 'Order ID', format(date, 'MMM dd,yyy') as 'Order Date'
From Orders
join Customers
on orders.CustomerId = Customers.Id
Where name = 'KFC';

--- order and customers with order number 2020 to 2040
Select name as 'Customer', CONCAT(City, ', ', state) as 'City/State', orders.Id as 'Order ID', format(date, 'MMM dd,yyy') as 'Order Date'
From Orders
join Customers
on orders.CustomerId = Customers.Id
Where orders.Id >= 2020 and orders.Id <= 2040
order by orders.id;

