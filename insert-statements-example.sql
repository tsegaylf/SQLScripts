--More Practice
Select * 
From Orders;

Select * 
From OrderLines;

--Learning about data minipulation using Insert, Update, Delete 
-- Insert EXAMPLE [Insert into Customers (Name, City, State, Sales, Active) values ('Kroger', 'Cincinnati', 'OH', 97230, 1);]

--Insert a new customer
Insert into Customers (Name, City, State, Sales, Active) 
				Values ('MAX Technical Training', 'Mason', 'OH', 75000, 1);

Select *
From Customers
Where name = 'MAX Technical Training';

--Insert a new owner
Insert into Orders (CustomerId, Date, Description) Values (0, '2019-08-21', 'My first manual insert into orders');

-- Find customer ID for verizon
Select Id 
From Customers 
Where name = 'Verizon';

Insert into Orders (CustomerId, Date, Description) 
Values ((Select Id From Customers Where name = 'Verizon'), '2019-08-21', 'My first manual insert into orders');

--Create join view to check if row was correctly inputed
Select Max(ID)
From Orders;

Select * 
From Orders o
join Customers c
on o.customerid = c.id
Where o.id = 27;

--OR
Select * 
From Orders o
join Customers c
on o.customerid = c.id
Where o.id = (Select Max(ID)
From Orders);

--Update the description for order just added
Select *
From Orders
Where ID = 27;

Update Orders SET
Description = 'My First Updated Order'
Where id = 27;

--Update an order for Kroger
Update Orders SET
Description = 'My First Updated Order For Kroger',
Customerid = (Select ID From Customers Where name = 'Kroger')
Where id = 27; 

Select * 
From Orders o 
Join Customers c
on c.id = o.customerid
Where o.id = 27;

--Delete by Primary Key -best way to do it in order to be sure you are deleting only one row.
Delete from Orders
Where ID = 27;





