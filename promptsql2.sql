create database Phone
use Phone
select * from [dbo].[Smartphones_cleaned_dataset]

select * from [dbo].[Smartphones_cleaned_dataset]
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Smartphones_cleaned_dataset'  -- no schema prefix here
  AND TABLE_SCHEMA = 'dbo';  

  select top 10 *from [dbo].[Smartphones_cleaned_dataset]
  select count(*) as total_rows from [dbo].[Smartphones_cleaned_dataset]
  select * from [dbo].[Smartphones_cleaned_dataset]
  SELECT
    COUNT(*) AS TotalRows,

    -- Example columns: change these to your real column names
    SUM(CASE WHEN brand_name IS NULL  THEN 1 ELSE 0 END) AS Null_brand,
    SUM(CASE WHEN model IS NULL  THEN 1 ELSE 0 END) AS Null_model,
    SUM(CASE WHEN extended_upto IS NULL  THEN 1 ELSE 0 END) AS Null_price,
    SUM(CASE WHEN ram_capacity   IS NULL  THEN 1 ELSE 0 END) AS Null_ram
FROM dbo.Smartphones_cleaned_dataset;

select distinct* from [dbo].[Smartphones_cleaned_dataset]

select top 5 * from [dbo].[Smartphones_cleaned_dataset]
where rating is null
select avg(rating) as average_rating from [dbo].[Smartphones_cleaned_dataset]

UPDATE dbo.Smartphones_cleaned_dataset
SET rating = 78
WHERE rating IS NULL;


-- for to make any updat ewe ahev to make a copy table so that all tge changes should done on that table

