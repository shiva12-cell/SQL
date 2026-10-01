/*
Question: Busy years for John Travolta
URL: https://sqlzoo.net/wiki/More_JOIN_operations

Description:
Which were the busiest years for 'John Travolta'? Show the year and the number of movies he made each year for any year in which he made more than 2 movies.

Tables: movie (id, title, yr, director, budget, gross), actor (id, name), casting (movieid, actorid, ord)
*/

SELECT yr,COUNT(title) 
FROM movie 
JOIN casting 
	ON movie.id=movieid
JOIN actor 
	ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=
(SELECT MAX(c) 
 FROM
	(SELECT yr,COUNT(title) AS c 
	 FROM movie 
	 JOIN casting 
	 ON movie.id=movieid
	 JOIN actor
	 ON actorid=actor.id
 WHERE name='John Travolta'
 GROUP BY yr) AS t
)

/*
Explanation:
1. Joins movie m, casting c on m.id = c.movieid, and ctor a on c.actorid = a.id.
2. Filters for .name = 'John Travolta'.
3. Groups by m.yr.
4. Filters groups using HAVING COUNT(m.title) > 2.
5. Projects yr, COUNT(m.title).
*/