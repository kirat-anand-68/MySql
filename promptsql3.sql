create database lecture1
use lecture1
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES 
    (1, 'John', 'Doe', 'IT', 60000.00, '2020-01-15'),
    (2, 'Jane', 'Smith', 'HR', 55000.00, '2019-03-22'),
    (3, 'Mike', 'Johnson', 'Finance', 70000.00, '2021-07-10'),
    (4, 'Emily', 'Davis', 'IT', 62000.00, '2022-02-05'),
    (5, 'Chris', 'Brown', 'Finance', 68000.00, '2020-11-30');

select * from Employees

SELECT * FROM Employees ORDER BY Salary DESC;
	INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES (6, 'Sarah', 'Wilson', 'HR', 58000.00, '2023-01-10');
UPDATE Employees SET Salary = 65000.00 WHERE EmployeeID = 1;

-- Count the number of employees
SELECT COUNT(*) AS TotalEmployees FROM Employees;

-- Sum of all salaries
SELECT SUM(Salary) AS TotalSalary FROM Employees;

-- Average salary
SELECT AVG(Salary) AS AverageSalary FROM Employees;

-- Maximum salary
SELECT MAX(Salary) AS MaxSalary FROM Employees;

-- Minimum salary
SELECT MIN(Salary) AS MinSalary FROM Employees;
DELETE FROM Employees WHERE EmployeeID = 6;

SELECT
    EmployeeId,
    SaleDate,
    Amount,
    SUM(Amount) OVER (
        PARTITION BY EmployeeId
        ORDER BY SaleDate
    ) AS RunningTotal
FROM Sales;
