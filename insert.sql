select * from [dbo].[Employees]

insert into [dbo].[Employees] (EmployeeID,FirstName,LastName,Department,Salary,HireDate)
values(6,'Raj','Kumar','IT',230000,'2023-04-20')

insert into [dbo].[Employees]( EmployeeID,FirstName,LastName)
values(7,'Rohit','Mehra')

insert into [dbo].[Employees]
values(8,'Kirat','Anand','IT',1000000.00,'2029-08-09')

select * from INFORMATION_SCHEMA.COLUMNS
where table_name='Employees'