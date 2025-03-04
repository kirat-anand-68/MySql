--Union and Union ALL
select * from append1
select * from append2
--allow duplicate records to be in output.
select c1,c2,c3 from append1
union all
select c1,c2,c3 from append2
--not allow the duplicate record to be in output
select c1,c2,c3 from append1
union
select c1,c2,c3 from append2

--Numbers of columns present in the select list have to be same
--Data Types of the corrsponding columns have to be same
--Order in which columns are written has to be the same

select c1,c2,c3 from append1  --c1 is int data type ,c2 is nvachar, c3 is int
union
select c1,c3,c2 from append2 ]

--Aliase names which are specified in 1st select statement will be assigned to the columns

select c1[column1],c2[column2],c3[column3] from append1
union
select c1[col1],c2[col2],c3[col3] from append2
