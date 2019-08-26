--Creating a view

CREATE VIEW FullRequests as 
SELECT r.id as 'Request ID', r.status, r.total, u.Lastname as 'User',
	v.name as 'Vendor', p.name as 'Product', p.price, l.Quantity, (P.price * l.Quantity) as 'Subtotal'
FROM Requests r
join RequestLines l
on r.ID = l.RequestID
join Products p
on p.id = l.ProductID
join vendors v
on p.VendorID = v.ID
join Users u
on u.id = r.UserID;

--We can then use the view as a table
SELECT * 
FROM Fullrequests;