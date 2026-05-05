-- Views 
-- views are the virtual table that represent the result of a query they can simplify compex queries and enhance security by restricting access to specific data

-- query ka view bnatae haa or viewko baar baar use krte haa bar bar na recreate kre sirf view a hi use kre
-- execution spped also increase

-- view for product details
create view vw_ProductDetails as
select ProductID,ProductName,Price,Stocks,CategoryName
from Products p inner join Categories c
on p.CategoryID=c.CategoryID

-- display product details with category names using view
select * from vw_ProductDetails
-- A view to get a summary of orders placed by each customers
create view vw_customersOrders as
select c.CustomerID,c.FirstName,c.LastName,count(o.OrderID) as TotalOrders,
sum(oi.Quantity*p.Price) as TotalAmount
from Customers c
inner join
Orders o
on c.CustomerID=o.CustomerID
inner join
OrderItems oi
on o.OrderID=oi.OrderID
inner join
Products p 
on oi.ProductID=p.ProductID
group by c.CustomerID,c.FirstName,c.LastName

select * from vw_customersOrders

-- view for recent Orders placed in last 30 days
create view vw_RecentOrders as
select o.OrderId,o.orderDate,c.CustomerID,c.FirstName,c.LastName,
sum(oi.Quantity*oi.Price) as OrderAmount
from Customers c
inner join
Orders o
on c.CustomerID=o.CustomerID
inner join
OrderItems oi
on o.OrderId=oi.OrderID
group by o.OrderId,o.orderDate,c.CustomerID,c.FirstName,c.LastName

select * from vw_RecentOrders

create view vw_ProductDetails2 as
select p.ProductName,p.Price,c.CategoryName
from Products p inner join Categories c on 
p.CategoryID=c.CategoryID
group by c.CategoryName,p.ProductName,p.Price
--order by c.CategoryName
select * from vw_ProductDetails2
-- retrieve the products within a Spcific Price Range
-- between the $100 and $500
select * from vw_ProductDetails2 where price between 10 and 500
select * from vw_ProductDetails2
-- count the number ofproducts in each category
select CategoryName,count(ProductID) as ProductCount
from vw_ProductDetails2




