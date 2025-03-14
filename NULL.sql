select * from [dbo].[Employees]

insert into [dbo].[Employees]
values(9,'Jay','','IT',34000,'2022-08-22')

insert into[dbo].[Employees]
values(10,'Nitin','Sharma','0',54000,'2029-09-6')

select * from [dbo].[Employees]
where Department = Null

select * from [dbo].[Employees]
where Department is null

select * from [dbo].[Employees]
where Department is not null