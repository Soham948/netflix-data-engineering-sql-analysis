select * from netflix


---1] 1. Count the number of Movies and TV Shows

Select 
  type,count(*) 
from netflix
group by type


---2] Find the most common rating for Movies and TV Shows

SELECT 
    type,
    rating
FROM
(
    SELECT 
        type,
        rating,
        COUNT(*) AS rating_count,
        RANK() OVER(
            PARTITION BY type
            ORDER BY COUNT(*) DESC
        ) AS ranking
    FROM netflix
    GROUP BY type, rating
) AS t1
WHERE ranking = 1


--3 List all Movies released in 2020
SELECT *
FROM netflix
WHERE type = 'Movie'
AND release_year = 2020



--- 4. Find the top 5 countries with the most Netflix content

select trim(country),
count(*) as  total_content
from netflix,
lateral unnest (

   STRING_TO_ARRAY (country,',')
)
group by trim(country)
order by total_content DESC
LIMIT 5



---5. Find content added in the last 5 year

select * from netflix
SELECT *
FROM netflix
WHERE TO_DATE(date_added,'Month DD,YYYY')
>= CURRENT_DATE - INTERVAL '5 years';

---6] Find movies and TV shows directed by Rajiv Chilaka

SELECT *
FROM netflix
WHERE director ILIKE '%Rajiv Chilaka%'



--7 Count content items in each genre
SELECT
    TRIM(genre) AS genre,
    COUNT(*) AS total_content
FROM netflix,
LATERAL UNNEST(
    STRING_TO_ARRAY(listed_in, ',')
) AS genre
GROUP BY TRIM(genre)
ORDER BY total_content DESC




---8] TV Shows with more than 5 seasons

SELECT *
FROM netflix
WHERE type = 'TV Shows'
AND SPLIT_PART(duration,' ',1)::numeric > 5;


---9] Top 10 Actors Appearing in the India produced in the India






SELECT
    TRIM(actor) AS actor,
    COUNT(*) AS total_movies
FROM netflix,
LATERAL UNNEST(
    STRING_TO_ARRAY("cast", ',')
) AS actor
WHERE type = 'Movie'
AND "country" ILIKE '%India%'
GROUP BY TRIM(actor)
ORDER BY total_movies DESC
LIMIT 10;


---10 List all The movies that are documentaries
SELECT *
FROM netflix
WHERE type = 'Movie'
AND listed_in ILIKE '%Documentaries%'

---11]Find all content without a direct


select * from netflix
where director is null


--12]Content where Salman Khan appeared in the last 10 years

SELECT *
FROM netflix
WHERE "cast" ILIKE '%Salman Khan%'
AND release_year >= EXTRACT(YEAR FROM CURRENT_DATE)::INT - 10;



---13]Categorize content based on "kill" and "violence"

WITH new_table AS
(
SELECT *,
CASE
            WHEN description ILIKE '%kills%'
              OR description ILIKE '%violence%'
            THEN 'Bad_content'
            ELSE 'Good_content'
        END category
    FROM netflix
)
SELECT
    category,
    COUNT(*) AS total_content
FROM new_table
GROUP BY 1;





---14]Categorize content based on "fun" and "romance"
WITH new_table AS
(
SELECT *,
CASE
            WHEN description ILIKE '%fun%'
              OR description ILIKE '%romance%'
            THEN 'Good_content'
            ELSE 'Bad_content'
        END category
    FROM netflix
)
SELECT
    category,
    COUNT(*) AS total_content
FROM new_table
GROUP BY 1;

















