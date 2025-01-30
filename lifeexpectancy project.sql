SELECT * FROM worldlifexpectancy.worldlifexpectancy;
## Exploratory data analysis

## questions
##find the life expectancy increase  for over 15 years
##minimun and maximum life expectancy
# life expectancy for each year


select *
from worldlifexpectancy;

select  country, min(lifeexpectancy) , max(lifeexpectancy),
round (max(lifeexpectancy)- min(lifeexpectancy),1) as life_increase_15years
from worldlifexpectancy
group by country
having  min(lifeexpectancy) <>0
and  max(lifeexpectancy) <>0
order by  life_increase_15years desc;

select year, round(avg(lifeexpectancy),2)
from worldlifexpectancy
where lifeexpectancy <> 0
group by year
order by year;

select Country, round(avg(Lifeexpectancy),1) Avg_lifeexpectancy,round(avg(GDP),1) as GDP
from worldlifexpectancy
group by Country
having Avg_lifeexpectancy  > 0
and GDP > 0
ORDER BY GDP,country;


select 
SUM( CASE WHEN GDP >= 1500 THEN 1
ELSE 0
END) HIGH_GDP_COUNT, 
AVG( CASE WHEN GDP >= 1500 THEN lifeexpectancy
ELSE null
END) HIGH_Gdp_lifeexpectancy,
SUM( CASE WHEN GDP <= 1500 THEN 1
ELSE 0
END) HIGH_GDP_COUNT, 
AVG( CASE WHEN GDP <= 1500 THEN lifeexpectancy
ELSE null
END) low_Gdp_lifeexpectancy
from worldlifexpectancy;

 select status, round(avg(lifeexpectancy),1), count(distinct country)
 from worldlifexpectancy
 group by status;
 
 select country, round(avg(lifeexpectancy),1)as life_exp, round(avg(BMI),1) as avg_bmi
 FROM worldlifexpectancy
 group by country
 having life_exp >0
 and avg_BMI > 0
 order by avg_BMI  desc;
## death rate in nigeria with the life expectancy in the last 15 years
 select country, year , lifeexpectancy, adultmortality,
 sum(adultmortality) over(partition by country order by year) as rollingtotal
 from worldlifexpectancy
 where country like '%Nigeria%'
  
