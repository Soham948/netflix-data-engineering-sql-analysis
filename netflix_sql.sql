select* from netflix



---15 Buisness problems
---1]Count the number of movies and TV shows

select*from netflix


select type,count(*) as total_content from netflix
group by type


--2] Find the most common ratoing for movies and TV shows
SELECT 
  type,
  rating
from

(select 
  type,
  rating,
  count(*),
  RANK() OVER(PARTITION BY type ORDER BY COUNT(*)) as ranking
 
from netflix
group by 1,2
order by 1,3 Desc
 ) as t1
 where 
  ranking=1




---#*3]List all movies release in the specific year(eg:2020)
select*from netflix


select * from netflix
where 
  type='Movie'
  AND
  release_year=2020


--#* 4]Find the top 5 countries with most content on the netflix

select country,
unnest(string_to_array(country,',')) as new_country, 
count(show_id) as total_content
from netflix
group by 1
order by 2 desc
limit 5


select string_to_array(country,',') as new_country from netflix

select unnest(string_to_array(country,',')) as new_country from netflix
  
---#*5]Identify the longest movie
select*from netflix

select * from netflix
where type='Movie'
AND
duration = (select max(duration) from netflix)


---#*6] Find the contenet that is added in the last 5 years

select*from netflix


select release_year from 
netflix
where release_year>2017


select 
  *
from netflix
where TO_DATE(date_added,'Month DD,YYYY')>= CURRENT_DATE-INTERVAL '5 years'


select CURRENT_DATE-INTERVAL '5 years'



---#*7] Find the movies and tv shows directed by 'Rajiv chilaka'
select * from netflix
where director ILIKE '%Rajiv Chilaka%'


----*# 8]List all the tv shows with more than 5 seasom
select
*
from netflix
where 
   type='TV Shows'
   AND
   SPLIT_PART(duration,' ',1)::numeric>5 


select
*
from netflix



---9]#* Count the number of the content items in each genre

select*from netflix

select listed_in,count(show_id),unnest(string_to_array(listed_in,',')) as genre
from netflix
group by 1


----10]#*Find each year and the average number of content release by india on netflix
---return top 5 with the most hifgesta vag contenet
total content 333/972

select 
EXTRACT(YEAR FROM TO_DATE(date_added,'Month DD, YYYY')) as year,
count(*),count(*)::numeric/(select count(*) from netflix where country='India')*100 as avg_content_per_year
from netflix
where country='India'
group by 1


---#*11]List all the movies that are documentaries
select*from netflix


select*from netflix
where listed_in ILIKE '%documentaries%'


---#*12] Find all  the content without the director

select*from netflix



select*from netflix
where director is null


---#*13]find the all the content where salman khan appeared in last 10 years


select*from netflix
WHERE cast ILIKE '%Salman Khan%'
AND
release_year > Extract(year from current_date)-10


---#*14]find the top 10 actors who appeared in the highest number of movies produced in INDIA
select 
---show_id,
---cast
UNNEST(string_to_array(cast,',')) as actors,
count(*) as total_content
from netflix
group by 1
order by 2
limit 10


----#*15]Categorize the content based on the presence of the keywords 'KIll' and 
----Violence in the description field Label content containing theses keyword bafd and 
----all the other content as 'good'.count how fallsn  onto each category



WITH new_table
AS
(

select*,
CASE
WHEN
description ILIKE '%kills%'or
description ILIKE '%violence%' then 'Bad_content'
else 'Good_content'
end category
from netflix





)

select category,
count(*) as total_content
from new_table
group by 1



