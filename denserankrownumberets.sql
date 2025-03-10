--rank dense rank and row numner function


CREATE TABLE Students (
    student_name VARCHAR(100),
    subject VARCHAR(100),
    marks INT
);


INSERT INTO Students (student_name, subject, marks)
VALUES 
-- Marks for Alice
('Alice', 'Math', 85),
('Alice', 'Science', 88),
('Alice', 'English', 92),

-- Marks for Bob
('Bob', 'Math', 90),
('Bob', 'Science', 78),
('Bob', 'English', 85),

-- Marks for Charlie
('Charlie', 'Math', 85),
('Charlie', 'Science', 82),
('Charlie', 'English', 80),

-- Marks for David
('David', 'Math', 92),
('David', 'Science', 91),
('David', 'English', 89),

-- Marks for Eve
('Eve', 'Math', 90),
('Eve', 'Science', 85),
('Eve', 'English', 87),

-- Marks for Frank
('Frank', 'Math', 75),
('Frank', 'Science', 72),
('Frank', 'English', 78),

-- Marks for Grace
('Grace', 'Math', 85),
('Grace', 'Science', 89),
('Grace', 'English', 90);

select * from Students

--assign row number to each of the row based on the row number
--marks same but the row number id different
--Row Number-> In case of a toe row number are assigned randomly.
select * ,row_number() over(order by marks desc) as[Row Number]
--Rank-> if there's a tie next rank/ranks wuill be skipped
from Students
select * ,rank() over ( order by marks desc) as [Row Function]
from Students
--Rank-> now with dense_rank then ranks will not be skipped.
select * ,dense_rank() over(order by marks desc) as [Dense Rank]
from Students
-----------------------------
--Write marks only aor write the asc they will produce the same output for us.
select * ,row_number() over(order by marks) as[Row Number]
--Rank-> if there's a tie next rank/ranks wuill be skipped
from Students
select * ,rank() over ( order by marks asc) as [Row Function]
from Students
--Rank-> now with dense_rank then ranks will not be skipped.
select * ,dense_rank() over(order by marks ) as [Dense Rank]
from Students
----------------------------------------------------------------------------------------
select * from Students

--Row number has to be assigned according to the marks
select *,row_number() over(partition by subject order by marks desc) [Row Number]
from Students

select * ,row_number() over(partition by subject order by marks)[Row Bumber Asc]
from Students

select * ,row_number() over(partition by subject order by marks)[Row Bumber desc]
from Students

select * ,row_number() over(partition by student_name order by marks asc)[Row_Number desc]
from Students

select * ,rank() over(partition by student_name order by marks desc)[Rank Desc]
from Students

select * ,row_number() over(partition by subject order by marks)[Row Bumber Asc]
from Students
--In dense rank rank will noot be skipped
select *,dense_rank() over(partition by subject order by marks desc)[Dense Rank]
from students

select *,dense_rank() over(partition by student_name order by marks desc)[Dense Rank]
from students
select *,dense_rank() over(partition by student_name order by marks asc)[Dense Rank]
from students