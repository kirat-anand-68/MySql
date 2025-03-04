select * from [dbo].[Sales]
select paymentmethod,sum(totalamount) as [Sum of Sales] from dbo.Sales
group by PaymentMethod

select productID,PaymentMethod,sum(TotalAmount) [Sum of Sales] from dbo.Sales
group by ProductID,PaymentMethod
order by ProductID

--HAVING CLAUSE
select *from dbo.Sales
--Toatl sales ,average sales,totaol qty and average qty for each distinct product
select 
ProductID,
sum(TotalAmount)[Sum of Sales],
sum(Quantity)[Total Quantity],
avg(TotalAmount)[Avg Amount],
avg(Quantity)[Avg Quantity]
from dbo.Sales
group by 
ProductID
--having sum(TotalAmount)<700
having sum(TotalAmount)<700 and sum(Quantity)=21

--Different between the having and the where clause.
--where condition is used where we have to filter out the data.
--having is used to apply filter on the group clause after the where clause.
select * from dbo.Sales
where TotalAmount>=161

select ProductID,sum(TotalAmount) [Sum of Sales] from dbo.Sales 
group by ProductID

select productid,sum(totalamount) [sum of Sales] from dbo.Sales
where TotalAmount >=161
group by productid
having sum(TotalAmount)>=250
--order by ProductID desc
order by sum(TotalAmount) asc
--having sum(totalAmount)<700