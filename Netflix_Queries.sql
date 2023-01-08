/* movies with null directors*/
SELECT title
FROM Netflix_database.dbo.Netflix_data
WHERE director is Null;

/* # movies with null directors and */
select COUNT(title) 
from Netflix_database.dbo.Netflix_data 
where director is null;/* 1969*/

/*#tv shows in each year in US only  */
select count(title) as #_tv_shows, release_year as Year
from Netflix_database.dbo.Netflix_data
where type='TV Show'and country='United States'
group by release_year;

/*#movies in each year in US and uk  */
select release_year as Year, country,count(title) as #_movies
from Netflix_database.dbo.Netflix_data
where type='Movie'and country in('United States','United Kingdom')
group by release_year,country
order by Year;

/*movies and ther duriation > 90 min and their discription*/
select title ,description,duration
from Netflix_database.dbo.Netflix_data 
where type='Movie' and duration >'90 min';

/* # movies directed by people whose name begins with Z or O */
select director,count(title)
from Netflix_database.dbo.Netflix_data
where director like 'Z%'or director like 'O%' 
group by director;

/* grouping movies and ther rating in each country*/
select  country,count(title) as #_movies , rating 
from Netflix_database.dbo.Netflix_data
where type='Movie' and rating is not null
group by country,rating
order by #_movies desc;

/* the most country that produced comedian movies */
select country,listed_in,count(title) as #_comedian_movies
from Netflix_database.dbo.Netflix_data
where listed_in='Comedies'
group by country,listed_in
order by count(title) desc;

/* the top 10 years that were full of tv shows */
select top(10) release_year, count(title) as #_tv_shows
from Netflix_database.dbo.Netflix_data
where type = 'TV Show'
group by release_year
order by #_tv_shows desc;

/*movies that listed in action & adventure*/
select title ,listed_in
from Netflix_database.dbo.Netflix_data
where listed_in='Action & Adventure, International Movies, Music & Musicals'
and type ='Movie'

