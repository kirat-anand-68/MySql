select * from Students
-- Row_number in case of a tie row number are assigned randomly.
select * ,ROW_NUMBER()over(order by marks desc) as [Row Number]
from Students

-- Rank -> if there's a tie next rank/ranks will be skipped.
select *,rank()over(order by marks desc) as [Rank Function]
from students
-- in the dense rank the ranks are not being skipped.
select *,dense_rank()over(order by marks desc) as [Rank Function]
from students

-----------------------------------------------------------------------------------------------------------------------------------------------------
select * ,ROW_NUMBER()over(order by marks ) as [Row Number]
from Students

-- Rank -> if there's a tie next rank/ranks will be skipped.
select *,rank()over(order by marks ) as [Rank Function]
from students
-- in the dense rank the ranks are not being skipped.
select *,dense_rank()over(order by marks ) as [Rank Function]
from students