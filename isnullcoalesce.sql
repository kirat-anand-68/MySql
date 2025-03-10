
--isnull,coalesce function
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255)
);


INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber, Address)
VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-1234', '123 Elm St'),
(2, 'Bob', 'Smith', NULL, '555-5678', NULL),
(3, 'Charlie', 'Williams', 'charlie.williams@example.com', NULL, '456 Oak St'),
(4, 'Diana', 'Brown', NULL, NULL, '789 Pine St'),
(5, 'Eve', 'Davis', 'eve.davis@example.com', '555-8765', NULL);

select * from Customers
--ISNULL
--to check wheteher the value is null or not
select isnull(null,'1 st value null')
select isnull('abx',null)
select isnull(null,null)

--coalesce 
select coalesce('A','B','C')
--it return the A because the A is the first not null value that is found.
-- as it return the first not null value that is provided
select coalesce(null,'B','C')
select coalesce (null,null,'c')

select * from Customers
select Customerid,email,phonenumber from Customers
select  Customerid,isnull(email,'Email NA'), isnull(phonenumber,'ph No NA') from Customers

select Customerid,coalesce(email,phonenumber,'Contact Na') [Calesce Function]from Customers