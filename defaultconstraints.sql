--checkcontraints
--it checks for certain condition that can be applied on the columns of a table, if this condition is bot 
--fullfilled , we will not be able to insert the records into the table

--Case 1:Table Doesn't exists
create table test_check(
EID int,
firstname varchar(256),
age tinyint check(age>=10)

)
select * from test_check
insert into test_check values (1,'Mayank','20')
insert into test_check values (7,'Raj','9')

update test_check set Eid = 11 where EID=1
--Case 2: Table exists
alter table test_check 
add check(eid>5)


--DEAFAULT CONSTRAINTS
--this constrints is used to provide the default value to constraints
--CASE 1: The table does not exits
create table test_default(
EID int default 5,
firstname varchar(256) default 'Kirat',
lastname varchar(256),
age tinyint
)

select * from test_default
insert into test_default values(1,'Nitin','Jain',23)
insert into test_default(lastname,age) values ('Singh',34)

insert into test_default(lastname) values('Grover')
--Case 2 : The table already exits
alter table test_default 
add default 25 for age

insert into test_default (lastname) values('Jain')
select * from test_default

