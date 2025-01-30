## exploratory data analysis

SELECT * FROM `us project`.ushouseholdincome_statistics;


SELECT * FROM `us project`.USHouseholdIncome;

## what i am mainly intrested is the Aland and Awater ,but we will also need to explore other sections
 
 
 select state_name, sum(Awater),sum(Aland)
 from USHouseholdIncome
 group by state_name
 order by sum(Aland) desc;
 ## identify the top 10 state by land mass
 
  select state_name,sum(Aland), sum(Awater)
 from USHouseholdIncome
 group by state_name
 order by sum(Aland)  desc
 limit 10;
 
 
   select state_name,sum(Aland), sum(Awater)
 from USHouseholdIncome
 group by state_name
 order by sum(awater)  desc
 limit 10;
 
 ## joining tables to explore data
 
 select u.state_name, round(avg(mean),1), round(avg(median),1)
 from USHouseholdIncome u
 join ushouseholdincome_statistics us
 on u.id =  us.id
 group by u.state_name
 order by 2
 limit 5;
 
 
 select u.state_name, round(avg(mean),1), round(avg(median),1)
 from USHouseholdIncome u
 join ushouseholdincome_statistics us
 on u.id =  us.id
 group by u.state_name
 order by 2 desc
 limit 10;
 
 
 select u.state_name, round(avg(mean),1), round(avg(median),1)
 from USHouseholdIncome u
 join ushouseholdincome_statistics us
 on u.id =  us.id
 group by u.state_name
 order by 2;

 
 
 select type, count(type), round(avg(mean),1), round(avg(median),1)
 from USHouseholdIncome u
 join ushouseholdincome_statistics us
 on u.id =  us.id
 group by type
 order by 4 desc ;
 
 select *
 from USHouseholdIncome
 where type = 'community';
 
 select type, count(type), round(avg(mean),1), round(avg(median),1)
 from USHouseholdIncome u
 join ushouseholdincome_statistics us
 on u.id =  us.id
 group by type
 having count(type) > 100
 order by 4 desc ;
 





