

create database [SQL Questions]

use [SQL Questions]

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Country VARCHAR(50)
);

-- Insert data into Customers table
INSERT INTO Customers (CustomerID, CustomerName, Country)
VALUES 
(1, 'Alice', 'USA'),
(2, 'Bob', 'UK'),
(3, 'Charlie', 'Canada'),
(4, 'David', 'USA'),
(5, 'Eve', 'Australia');

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ProductID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ProductID)
VALUES 
(101, 1, '2024-08-01', 1001),
(102, 1, '2024-08-03', 1002),
(103, 2, '2024-08-04', 1001),
(104, 3, '2024-08-05', 1003),
(105, 5, '2024-08-06', 1004);

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Insert data into Products table
INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
(1001, 'Laptop', 1000),
(1002, 'Smartphone', 700),
(1003, 'Tablet', 500),
(1004, 'Headphones', 200),
(1005, 'Smartwatch', 300);


select * from Customers
select * from Orders
select * from Products

select CustomerName from Customers c inner join Orders o 
on o.CustomerID = c. CustomerID

select CustomerName from Customers c left join Orders o 
on O.CustomerID = C.CustomerID where o.OrderID is null

select ProductName,Price from Orders o inner join Products P
on o.ProductID= P.ProductID

select distinct CustomerName,OrderID from Customers c left join Orders o
on  o.CustomerID = c.CustomerID
--Retriev the list of products that have never been ordered
select distinct p.ProductID,ProductName  from Products  P left join Orders o 
on P.ProductID = o.ProductID 
Where o.OrderDate is null

--Find the total number of orders placed by each customer.
select Customername,count(orderid) [number_of_orders]from Customers c inner join Orders o on c.CustomerID = o.CustomerID
group by customername
--OR
select Customername,count(orderid) [number_of_orders]from Customers c left join Orders o on c.CustomerID = o.CustomerID
group by customername

--Display the customers , the products thay've ordered , and the order date, Include customers who have'nt placed any Orders.
select distinct CustomerName,P.ProductID,ProductName,OrderDate 
from Customers c left join Orders o on c.CustomerID = o.CustomerID left join Products p 
on o.ProductID = p.ProductID

select x.CustomerName,y.CustomerName from Customers  x inner join Customers y on 
x.Country = y.Country and x.CustomerID <> y.CustomerID and x.CustomerID > y.CustomerID

select CustomerName from
(select CustomerName,sum(price)[Amount_spent] ,
DENSE_RANK () over (order by sum(price) desc) [DR]
from Customers c inner join Orders o on c.CustomerID=o.CustomerID inner join Products p on o.ProductID = p.ProductID
group by CustomerName) m where DR=1

select CustomerName from Customers c join Orders o on c.CustomerID = o.CustomerID
group by CustomerName
having count(ProductId)>1

select OrderID,p.ProductID ,ProductName from Orders o right join Products p on o.ProductID=p.ProductID

select OrderID  from Customers c inner join Orders o on c.CustomerID = o.CustomerID where Country
in ('USA')

select distinct CustomerName from Customers c inner join Orders o on o.CustomerID=c.CustomerID inner join Products p on p.ProductID = o. ProductID 
where Price > 500
select distinct m.CustomerName from
(select Customername,ProductID,count(OrderID) from Customers c inner join Orders o on c.CustomerID=o.CustomerID
group by CustomerName,ProductID
having count(OrderID) >1) m