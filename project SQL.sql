create database OnlineRetailDB;

use OnlineRetailDB;

create table Customers
(
CustomerID int primary Key identity(1,1),
FirstName Nvarchar(50),
LastName Nvarchar(50),
Email nvarchar(50),
Phone nvarchar(50),
Address nvarchar(255),
City nvarchar(50),
State nvarchar(50),
ZipCode nvarchar(50),
Country nvarchar(50),
CreatedAt datetime default getdate()
);

-- select * from Customers

create table Products(
ProductID int primary key identity(1,1),
ProductName nvarchar(100),
CategoryID int,
Price Decimal(10,2),
Stocks int,
CreatedAt datetime default getdate(),
);

create table Categories(
CategoryID int primary key identity(1,1),
CategoryName nvarchar(100),
Description nvarchar(255),
);

create table Orders(
OrderId int primary key identity(1,1),
CustomerId int,
orderDate datetime default getdate(),
TotalAmount decimal(10,2),
foreign key (CustomerID) references Customers(CustomerID)
);

create table OrderItems(
OrderItemID int primary key identity(1,1),
OrderID int,
ProductID int,
Quantity int,
Price Decimal(10,2),
Foreign key(ProductID) references Products(ProductID),
foreign key(OrderId) references Orders(OrderId)
);

insert into Categories(CategoryName,Description) values 
('Electronics','Devices and Gadgets'),
('Clothing','Apparel and Accessories'),
('Books','Printed and Electronics Books');

insert into Products(ProductName,CategoryID,Price,Stocks)
values 
('Smartphones',1,699.99,50),
('Laptop',1,999.99,30),
('T-shirt',2,19.99,100),
('Jeans',2,49.99,60),
('Science Journal',3,29.99,150);


insert into Customers(FirstName,LastName,Email,Phone,Address,City,State,ZipCode,Country)
values
('Sameer','Khanna','sameer.khanna@gmail.com','123-456-7890','1234 Elm St.','SpringField','IL','62701','USA'),
('Jane','Smith','jane.smith@gmail.com','234-567-8901','486 Oak St.','Madison','WI','53703','USA'),
('Alice','Johnson','alice.Johnson@gmail.com','345-678-9012','789 Dalal St.','Mumbai','Maharashtra','41520','INDIA');

insert into Orders(CustomerId,orderDate,TotalAmount)
values
(1,getdate(),719.98),
(2,getdate(),49.99),
(3,getdate(),44.98);

insert into OrderItems(OrderID,ProductID,Quantity,Price)
values
(1,1,1,699.99),
(1,3,1,19.99),
(2,4,1,49.99),
(3,5,1,14.99);
--- Retrieve all order for a specific customer
select o.OrderId,o.orderDate,o.TotalAmount,
oi.ProductID,oi.Quantity,oi.Price,p.ProductName
from Orders o
join
OrderItems oi on o.OrderId = oi.OrderID
join
Products p on oi.ProductID=p.ProductID
where o.CustomerId=1;

-- find the total sales for each product
select p.ProductID,p.ProductName,sum(oi.Quantity*oi.Price) as Total_Sales
from OrderItems oi
join Products p on 
oi.ProductID=p.ProductID
group by p.ProductID,p.ProductName
order by Total_Sales desc;

--Calculate the average order value
select avg(TotalAmount)as average_order_value from Orders

-- top 5 customers by total_spending
select CustomerID,FirstName,LastName,Total_Spend from
(select c.CustomerID,c.FirstName,c.LastName,sum(o.TotalAmount) as Total_Spend,
ROW_NUMBER() over (Order by sum(o.TotalAmount)desc) as rn
from Customers c
join Orders o on
c.CustomerID=o.CustomerID
group by c.CustomerID,c.FirstName,c.LastName)
sub where rn <=5;

-- retrieve the most popular product category
select CategoryID,CategoryName,total_quantity_sold,rn
from(
select c.CategoryID,c.CategoryName,sum(oi.Quantity)as total_quantity_sold,
ROW_NUMBER() over(order by sum(oi.Quantity)desc)as rn
from OrderItems oi
join products p
on oi.ProductID=p.ProductID
join Categories c
on p.CategoryID=c.CategoryID
group by c.CategoryID,c.CategoryName)sub
where rn=1;
-- list ll proudcts that are out all stock
insert into Products(ProductName,CategoryID,Price,Stocks)
values('Keyboard',1,39.99,0)

select * from Products where Stocks=0

select ProductID,ProductName,Stocks from Products 
where Stocks=0;
-- with category name
select p.ProductID,p.ProductName,p.Stocks,c.CategoryName
from Products p
join Categories c on 
p.CategoryID=c.CategoryID
where Stocks=0;
--find cutsomers who pace orders in last 30 days
select c.CustomerID,c.FirstName,c.LastName,c.Phone,c.Email
from Customers c join Orders o
on c.CustomerID=o.CustomerID
where o.OrderDate >= Dateadd(day,-30,getdate());

-- calculate the total number of orders placed each month
select count(OrderID)as Total_orders, year(orderDate)as Order_Year,
month(orderDate) as Order_Month
from Orders
group by year(orderDate),month(orderDate)
order by Order_Month,Order_Year;

-- retrieve the details of the most recent order
select top 1 o.OrderID,o.OrderDate,o.TotalAmount,c.FirstName,c.LastName
from Orders o join Customers c on 
o.CustomerID=c.CustomerID
order by o.orderDate desc

-- findthe average price of teh prodict for the each category
select p.ProductID,p.ProductName,p.Stocks,c.CategoryName
from Products p
join Categories c on 
p.CategoryID=c.CategoryID
where Stocks=0;

select c.CategoryID,c.CategoryName,round(avg(p.Price),2) as AveragePrice
from Categories c join Products p
on c.CategoryID=p.ProductID
group by c.CategoryID,c.CategoryName

--list of all the customers who have never places he order
select c.CustomerId,c.FirstName,c.LastName,c.Phone from 
Orders o join Customers c on 
o.CustomerID=c.CustomerID
where o.OrderId is null
-- retrieve the total quantity sold for each product
select p.ProductID, p.ProductName ,sum(oi.Quantity) as TotalQuantitySold
from OrderItems oi join Products p
on oi.ProductID=p.ProductID
group by p.ProductID,p.ProductName
order by p.ProductName

-- total revenue generated by each category
select c.CategoryID,c.CategoryName,sum(oi.Quantity*oi.Price) as TotalRevenue
from OrderItems oi join Products p
on oi.ProductID=p.ProductID
join Categories c
on c.CategoryID=p.CategoryID
group by c.CategoryID,c.CategoryName
order by TotalRevenue desc;

-- highest price product in each category
select c.CategoryID,c.CategoryName,p1.ProductID,p1.ProductName,p1.Price
from Categories c join Products p1
on c.CategoryID = p1.CategoryID
where p1.Price=(select max(Price) from products p2 where p2.CategoryID=p1.CategoryID)
order by p1.Price desc;

-- amount greater than 500
select o.OrderID,c.CustomerID,c.FirstName,c.LastName,o.TotalAmount
from Orders o join Customers c
on o.CustomerID = c.CustomerID
where o.TotalAmount > 500
order by o.TotalAmount desc;

-- 3 most frequent ordered products
select top 3 p.ProductID,p.ProductName, count(oi.OrderID) as OrderCount
from OrderItems oi join Products p
on oi.ProductID = p.ProductID
group by p.ProductID,p.ProductName
order by OrderCount




