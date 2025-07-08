select * from ProfitData
select *,lag(profit) over(partition by product order by monthnumber)
from ProfitData

select MonthName,MonthNumber,sum(profit)[TotalProfit],
lag(sum(profit)) over(order by MonthNumber) [Previous Months Total Profit]
from ProfitData
group by MonthName,MonthNumber 
order by MonthNumber