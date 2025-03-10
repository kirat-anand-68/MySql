

select * from ProfitData
--to add a new column that shows pre month's profit for each product
select * ,
lag(profit) over(partition by product order by monthnumber)[Lag Function]
from ProfitData


--We don't want product column in the output but we want each month's total profit to be show by monthnumber & monthname, Also a 
--new column should be added to show previous month's total profit

select MonthNumber,MonthName,sum(profit) [total Profit for Month],
lag(sum(profit)) over(order by monthnumber) [Previous Month's Total Profit]
from ProfitData
group by MonthName,MonthNumber
order by MonthNumber