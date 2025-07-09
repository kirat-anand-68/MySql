select * from Employees

create procedure sp_test
as 
begin 
	select * from Employees
end

sp_test  -- call the procedure.

exec sp_test
execute sp_test

--example 2
create procedure sp_test_1
as
begin
	select firstname,lastname from Employees
end

sp_test_1

------------------------------------
Alter proc sp_test_1
as
begin
	select EmployeeId,FirstName,LastName from Employees
end
