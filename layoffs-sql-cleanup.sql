USE data_cleaning;
select* from layoffs;

create table layouffs_staging
like layoffs;

select * from layouffs_staging;

insert layouffs_staging
select * from layoffs;

select * ,
row_number() over(partition by company,location,industry,total_laid_off, percentage_laid_off,`date`,stage,country, funds_raised_millions) as row_num
from layouffs_staging;

WITH duplicate_cte AS (
    SELECT *, 
    ROW_NUMBER() OVER (PARTITION BY company,location,industry,total_laid_off, percentage_laid_off,`date`,stage,country, funds_raised_millions) AS row_num
    FROM layouffs_staging
)
SELECT * 
FROM duplicate_cte  -- Fixed the spelling here
WHERE row_num > 1;  -- This will return all duplicate rows



select* from layouffs_staging
where company='Casper';

select * from layouffs_staging 
where company = 'Oda';

CREATE TABLE `layouffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select* from layouffs_staging2
where company='Casper';

insert into  layouffs_staging2
select * ,
row_number() over(partition by company,location,industry,total_laid_off, percentage_laid_off,`date`,stage,country, funds_raised_millions) as row_num
from layouffs_staging;

select * from layouffs_staging2
where row_num >1;

delete  from layouffs_staging2
where row_num >1;

select * from layouffs_staging2;

-- Standardizing data_cleaning

select distinct(company)
from layouffs_staging2;

select distinct(trim(company))    -- trim takes off white space at the end
from layouffs_staging2;

select company ,trim(company)
from layouffs_staging2;

update layouffs_staging2
set company = trim(company);

select * from layouffs_staging2;

select distinct(industry)
from layouffs_staging2
order by 1 ; -- sorting industry names in ascending order if there were multiple columns in selects then it would order by first column

select * 
from layouffs_staging2
where industry like 'Crypto%' ; -- The % wildcard means that any characters can follow "Crypto," including none.

update layouffs_staging2
set industry = 'Crypto'
where industry like 'Crypto%';

select distinct(industry)
from layouffs_staging2
order by 1;

select distinct(location)
from layouffs_staging2
order by 1;

select distinct(country)
from layouffs_staging2
order by 1; -- there are 2 united states one with period

select distinct country, trim(trailing '.' from country)
from layouffs_staging2
order by 1;

update layouffs_staging2
set country =  trim(trailing '.' from country)
where country like 'United States%';

-- date is in str we need to convert it into date format
select `date`,
str_to_date(`date`, '%m/%d/%Y')
from layouffs_staging2;

update layouffs_staging2
set `date`= str_to_date(`date`, '%m/%d/%Y');

select `date` from layouffs_staging2;  -- even after changing the data type it is not reflected in the date section on the schema

alter table layouffs_staging2
modify column `date` date;  -- altering should never be done on raw data

select * from layouffs_staging2 
where total_laid_off is null;    -- if we write = null it wont return anything 

select * from layouffs_staging2 
where total_laid_off is null
and percentage_laid_off is null;

select * 
from layouffs_staging2
where industry is null
or industry ='' ; -- lets check if we have any other airbnb data which is not null to find out the industry type and populate this null/'' with that 

select *
from layouffs_staging2
where company ='Airbnb';  -- from this we know that airbnb is a travel industry

-- how to populate the null or '' with the right type
select *
from layouffs_staging2 t1
join layouffs_staging2 t2
on t1.company = t2.company 
where (t1.industry is null or t1.industry ='')  -- setting it only to null will return no output
and t2.industry is not null;

select t1.industry, t2.industry
from layouffs_staging2 t1
join layouffs_staging2 t2
on t1.company = t2.company 
where (t1.industry is null or t1.industry ='')  -- setting it only to null will return no output
and t2.industry is not null;

update layouffs_staging2 t1
join layouffs_staging2 t2
on t1.company = t2.company 
set t1.industry = t2.industry
where t1.industry is null 
and t2.industry is not null;

-- this does not solve the issue and we need to convert '' to nulls first and then run 147 to see the results
update layouffs_staging2
set industry = null
where industry ='' ;

select *
from layouffs_staging2
where company ='Airbnb';


select *
from layouffs_staging2
where company like 'Bally%' ; -- we get no other entry of bally company to fill it therefore its still null we dont have a populated row of it.

-- deleting data where total laid off and percntage laid off both are  null
delete from layouffs_staging2 
where total_laid_off is null
and percentage_laid_off is null;


-- DATA CLEANED. 

alter table layouffs_staging2 
drop column row_num;