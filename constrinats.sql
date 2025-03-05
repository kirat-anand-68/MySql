

select * from Orders

select * from Customers

select* from Customers
where customer_id in (
select distinct customer_id from Orders where order_date between '2024-08-01' and '2024-08-31'

)


select * from Customers
where customer_id in (
select distinct customer_id from Orders where order_date not between '2024-08-01' and '2024-08-31'
)

select * from Employees

--fetch the data from employees table where salary > average salary

select* from Employees where Salary>(
select avg(salary) from Employees)

select avg(salary) from Employees


create database constraints
use constraints
--Constraints

--Conditions that can be applied on the columns of the table and these conditions are to be followed by inserting the itno the table

--Not Null Constraints

--Case1: New Table
--Case2: table already exists

create table test_not_null(
EID int not null,
age tinyint,
firstname varchar(256)
)

select * from test_not_null
select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME like 'test_not_null'

insert into test_not_null values(1,23,'Mayank')
insert into test_not_null values(null,23,'Mayank')

insert into test_not_null values(1,null,'Mayank')
insert into test_not_null values(1,23,null)

alter table test_not_null
alter column firstname varchar(256) not null

insert into test_not_null values(21,34,null)

--we apply the null on to the columns.
alter table test_not_null
alter column age tinyint(256) not null


--Unique Constarints
--it ensures that a column consists of unique values

--Case1:when the table already exists
alter table test_unique
add unique(lastname)





--Case2: We need to create the table
create table test_unique(
SID int unique,
age tinyint not null,
firstname varchar (256) not null unique,
lastname varchar(256)
)


select * from test_unique
insert into test_unique values(1,22,'Mayank','Mehera')
insert into test_unique values(1,24,'Rohit','Singh')
insert into test_unique values(null,34,'Akhilesh','Singh')
truncate table test_unique 