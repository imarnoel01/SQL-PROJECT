 SELECT * FROM worldlifexpectancy.worldlifexpectancy;
 
 ## REAL LIFE EXPECTANCY PROJECT DATA CLEANING
 ## checking for duplicate using count and concatenate( used this because there is no unique identifier, have to concat the country with the year
 ## and remove the duplicate using row_number and partiiton by
 ## further populate the  status 
## and sort out the missing values on the ;ife expectancy using the join function ,finding the average  between the closest year and country
## next EDA( exploratory data analysis...
 
 
 
  SELECT Country, year , concat(country,year), count(concat(country,year))
  FROM worldlifexpectancy
  group by country, year ,concat(country,year)
  having count(concat(country,year)) >1;
  
 select *
 from 
 (
    select row_id ,concat(country,year),
     row_number() 
    over(partition  by concat(country,year) order by concat(country,year)) as row_num
    from worldlifexpectancy
 ) as row_table
 where row_num >1;
 
 delete from worldlifexpectancy
 where 
    row_id in(
     select row_id
 from 
 (
    select row_id ,concat(country,year),
     row_number() 
    over(partition  by concat(country,year) order by concat(country,year)) as row_num
    from worldlifexpectancy
 ) as row_table
 where row_num >1);
    
    
     select *
     from  worldlifexpectancy
     where status = '';
     
     select distinct(country)
     from worldlifexpectancy
     where status = 'developing';
     
     select distinct(country)
     from worldlifexpectancy
     where status = 'devel';
     
     update   worldlifexpectancy t1
     join worldlifexpectancy  t2
     on  t1.country= t2.country
     set t1.status = 'developing'
     where t1.status = ''
     and t2.status <> ''
     and t2.status = 'developing';
     
       update   worldlifexpectancy t1
     join worldlifexpectancy  t2
     on  t1.country= t2.country
     set t1.status = 'developed'
     where t1.status = ''
     and t2.status <> ''
     and t2.status = 'developed';
     
     select t1.country, t1.year, t1.lifeexpectancy, 
     t2.country, t2.year, t2.lifeexpectancy, 
     t3.country, t3.year, t3.lifeexpectancy,
    round((t2.lifeexpectancy + t3.lifeexpectancy)/2,1)
     from worldlifexpectancy t1
     join worldlifexpectancy t2
     on t1.country = t2.country
     and t1.year = t2.year -1 
      join worldlifexpectancy t3
     on t1.country = t3.country
     and t1.year = t3.year +1
     where t1.lifeexpectancy = '' ;
     
     
     update worldlifexpectancy t1
     join worldlifexpectancy t2
     on t1.country = t2.country
     and t1.year = t2.year -1 
      join worldlifexpectancy t3
     on t1.country = t3.country
     and t1.year = t3.year +1
     set t1.lifeexpectancy = round((t2.lifeexpectancy + t3.lifeexpectancy)/2,1)
     where t1.lifeexpectancy = '';
     
	select *
    from worldlifexpectancy;
    
    ## data cleaning
 