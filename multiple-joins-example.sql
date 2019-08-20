Select *
From Orders;

Select *
From OrderLines;

Select *
From Products;

Select *
From Orders o
join OrderLines ol
on o.Id = ol.OrderId
join Products p
on ol.ProductId = p.Id
Where o.Id = 2002;

-- minimize to columns you need 
Select format(date, 'MMM dd,yyyy') as 'Order Date', customerid as 'Customer ID', name as 'Product', quantity, Price
From Orders o
join OrderLines ol
on o.Id = ol.OrderId
join Products p
on ol.ProductId = p.Id
Where o.Id = 2002
Order by Price;

--Create another column with the result of (quantity * price) then order by 
Select format(date, 'MMM dd,yyyy') as 'Order Date', customerid as 'Customer ID', name as 'Product', quantity, Price, (Quantity * Price) as 'Line SubTotal'
From Orders o
join OrderLines ol
on o.Id = ol.OrderId
join Products p
on ol.ProductId = p.Id
Where o.Id = 2002
Order by [Line SubTotal];

--Add the customers name to table
Select format(date, 'MMM dd,yyyy') as 'Order Date', c.Name as 'Customer ID', p.Name as 'Product', 
quantity, Price, (Quantity * Price) as 'Line SubTotal'
From Customers c
join Orders o
on c.id = o.CustomerId
join OrderLines ol
on o.Id = ol.OrderId
join Products p
on ol.ProductId = p.Id
Where o.Id = 2002
Order by [Line SubTotal];

--You can add the join in the begining or the end of the current joins. It makes no difference. 
--If you create an alias for the tables you have to use the alias throughout the querey.
Select format(date, 'MMM dd,yyyy') as 'Order Date', c.name as 'Customer', p.name as 'Product', 
quantity, Price, (Quantity * Price) as 'Line SubTotal'
From Orders o
join OrderLines ol
on o.Id = ol.OrderId
join Products p
on ol.ProductId = p.Id
join Customers c
on c.id = o.CustomerId
Where o.Id = 2002
Order by [Line SubTotal];



