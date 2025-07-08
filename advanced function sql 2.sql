select * from Students
select * ,ROW_NUMBER() over(partition by subject order by marks desc) [ROW-NUM]
from Students
select * ,ROW_NUMBER() over(partition by subject order by marks ) [ROW-NUM]
from Students
select * ,ROW_NUMBER() over(partition by student_name order by marks desc) [ROW-NUM]
from Students

select *,rank() over(partition by student_name order by marks desc) [Rank_desc]
from Students
select *,rank() over(partition by subject order by marks desc) [Rank_desc]
from Students
select *,DENSE_RANK() over(partition by subject order by marks desc) [Dense Rank_desc]
from Students

select *,DENSE_RANK() over(partition by student_name order by marks desc) [Dense Rank_desc]
from Students