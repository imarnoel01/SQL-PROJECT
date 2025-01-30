## us household cleaning


SELECT * FROM `us project`.USHouseholdIncome;



SELECT * FROM `us project`.ushouseholdincome_statistics;


## removing duplicate begijn with the count , follow by  windows function to identify the numbers, then subquery to single out the numbers followed by the delete action

select id, count(id)
from USHouseholdIncome
group by id
having count(id) >1;



select *
from 
(select row_id, id,
row_number () over(partition by id order by id) as row_num
from USHouseholdIncome) as row_table
where row_num >1;

delete from USHouseholdIncome
where row_id in
    (select row_id
    from 
(select row_id, id,
    row_number () over(partition by id order by id) as row_num
      from USHouseholdIncome) as row_table
      where row_num >1);
      
	select *
from 
(select  id,
row_number () over(partition by id order by id) as row_num
from ushouseholdincome_statistics) as row_table
where row_num >1;

## no duplicates for the other tabble

select state_name, count(state_name)
from ushouseholdincome
group by state_name;

 update USHouseholdIncome
 set  state_name = 'Georgia'
 where state_name = 'georia';
 
 select distinct(state_ab)
 from USHouseholdIncome;
 
 select *
 from USHouseholdIncome
 where place =  ''
 order by 1;
 
 update USHouseholdIncome
 set place = 'Autaugaville'
 where county = 'autauga county'
 and city = 'vinemont';
      
       select type, count(type)
       from USHouseholdIncome
       group by type;
         
         update USHouseholdIncome
         set type =  'borough'
         where type = 'boroughs';
         
         select  awater,aland
         from USHouseholdIncome
         where aland = 0 or aland = '' or aland = null;
         
         
          select distinct(awater)
          from USHouseholdIncome;
          
		## cleaned up the necessary data and up next is data exploration
         
         
         
