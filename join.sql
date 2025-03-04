

select * from table1
select * from table2
select * from table1 inner join table2 on table1.C1  =table2.C1

select table1.C1, table1.C2,table2.C3 from table1 inner join table2 on table1.C1  =table2.C1

select * from table1 a inner join table2 b on 
a.C1  = b.C1

select * from table1
select * from table2

select * from table1 left join table2
on table1.C1 = table2.C1

select * from table1 a left join table2 b 
on a.C1= b.C1

select a.C1,a.C2,b.C3 from table1 a left join table2 b
on a.C1 = b.C1

select * from table1 a right join table2 b
on a.C1 = b.C1
--NUll in table not match with the any value in the table so only the null is writtena sit in the table.

select a.C2,b.C1,b.C3 from table1 a right outer join table2 b
on a.C1 = b.C1
--left anti join
select * from table1 a left join table2 b
on a.C1 = b.C1
where b.C3 is null

--Right anti join
select * from table1 a right join table2 b
on a.C1 = b.C1
where a.C2 is null

--FULL OUTER JOIN
select * from table1 a  full outer join table2 b
on a.C1 = b.C1

--self join join table  to itself
select * from table1 as a inner join table1  as b
on a.C1 = b.C1

select * from table2 as a inner join table2 as b
on b.C1 = b.C1