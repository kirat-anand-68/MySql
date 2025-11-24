create database test11
create database test12

select * from [dbo].[Lec+50+SQL+Task]

update [dbo].[Lec+50+SQL+Task]
set name = '    Tanya Singh' where employeeid=1
update [dbo].[Lec+50+SQL+Task]
set name = '  Tarun Verma' where employeeid=2

SELECT *
INTO test12.dbo.TargetTable
FROM test11.[dbo].[Lec+50+SQL+Task];

select * from TargetTable