order of the execution
select * from EmployeeSalaries

select distinct top 1 Department,Avg(Salary) [AVG Salary]
from EmployeeSalaries
where Salary> 50000
group by Department
having Avg(Salary)> 55000
order by department
-- from join
-- where 
-- group by 
--having clause
--select 
--distinct 
--order 
--top 
