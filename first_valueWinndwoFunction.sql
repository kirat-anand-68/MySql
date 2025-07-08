select * from [dbo].[EmployeeSalaries]
select * 
,FIRST_VALUE(salary) over(order by salary)[Minimum Salary]
from EmployeeSalaries

select * 
,FIRST_VALUE(EmployeeName) over(  order by salary)[Minimum Salary]
,FIRST_VALUE(salary) over(order by salary)[Minimum Salary]
from EmployeeSalaries

select * 
,FIRST_VALUE(EmployeeID) over(  partition by Department order by salary)[Minimum Salary]
from EmployeeSalaries

select * 
,FIRST_VALUE(EmployeeID) over(  partition by Department order by salary desc)[Minimum Salary]
from EmployeeSalaries

select * 
,FIRST_VALUE(EmployeeName) over(  partition by Department order by salary)[Minimum Salary]
from EmployeeSalaries
