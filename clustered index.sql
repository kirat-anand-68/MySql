
drop database Test_Index
create database Test_Index

use test_index

drop table if exists students
create table Students ( id int, name nvarchar(50), age int, gender varchar(20))

insert into Students values
(1,'Raj',23,'M'),
(4,'Nitin',25,'M'),
(3,'Priya',21,'F'),
(2,'Nikita',20,'F'),
(5,'Monica',20,'F')

select * from Students

create clustered index ix_1 on students (id)
-- only one clustered index on table
create clustered index ix_2 on students (id desc)

drop index ix_1 on students

create clustered index ix_3 on students (gender desc, age asc)

drop index ix_2 on students
drop index ix_3 on students

create nonclustered index ix_2 on students (id)
create nonclustered index ix_1 on students (gender desc, age asc)

-- we can have the more than 1 non clustered index as the non clustered index stored seperately on the data structure.



--More than one non clustered index can exist while that is not the case with clustered index

--Clustered Index determines the physical order in which data is stored in a table while that is
--not the case with non clustered index

--Clustered index is faster than non clustered index because non clustered index needs to refer back to
--table if selected column is not present in it

--Non clustered index requires separate disc space for storage


create nonclustered index ix_1 on students (gender desc, age asc)
drop index ix_1 on students

drop index ix_3 on students