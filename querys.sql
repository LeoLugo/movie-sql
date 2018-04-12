
/* Select all columns and rows from the movies table */ 
SELECT * FROM movies;
/* Select only the title and id of the first 10 rows */
SELECT id, title FROM movies LIMIT 10;
/* Find the movie with the id of 485 */
SELECT * FROM movies WHERE id = 485;
/* Find the id (only that column) of the movie Made in America (1993) */
SELECT id FROM movies WHERE title LIKE "Made in America%";
/* Find the first 10 sorted alphabetically */
SELECT title FROM movies order by title LIMIT 10;
/* Find all movies from 2002 */
SELECT * FROM movies WHERE title LIKE '%2002%';
/* Find out what year the Godfather came out */
SELECT SUBSTRING(title, -5, 4) FROM movies WHERE id = 858;
/* Without using joins find all the comedies */
SELECT * FROM movies WHERE genres LIKE '%comedy%';
/* Find all comedies in the year 2000 */
SELECT * FROM movies WHERE genres LIKE '%comedy%' && SUBSTRING(title, -5, 4) = 2000;
/* Find any movies that are about death and are a comedy */
SELECT * FROM movies WHERE genres LIKE '%comedy%' && title LIKE '%death%';
/* Find any movies from either 2001 or 2002 with a title containing super */
SELECT * FROM movies WHERE title LIKE '%super%' && (SUBSTRING(title, -5, 4) = 2001 OR SUBSTRING(title, -5, 4) = 2002);
/* Create a new table called actors (We are going to pretend the actor can only play in one movie). The table should include name, character name, foreign key to movies and date of birth at least plus an id field. */
/*done*/
/* Pick 3 movies and create insert statements for 10 actors each. You should use the multi value insert statements */
INSERT INTO actors (name, charactername, movieid)
			VALUES('Jennifer Lawrence', 'Isabel', 1),
			('Natalie Portman', 'Aviv', 1),
			('Mila Kunis', 'Sasa', 1),
			('Charlize Theron', 'Kaylin', 2),
			('Scarlett Johansson', 'Serina', 2),
			('Tom Hanks', 'Garret', 2),
			('Johnny Depp', 'Wardell', 3),
			('Tom Cruise', 'Toby', 3),
			('Brad Pitt', 'Richie', 3),
			('Leonardo DiCaprio', 'Scott', 3);
/* Create a new column in the movie table to hold the MPAA rating. UPDATE 5 different movies to their correct rating */
UPDATE movies SET rating = "G" WHERE id = 1 OR id = 2 OR id = 3 OR id = 4 OR id = 5;
/* With Joins: */
/* Find all the ratings for the movie Godfather, show just the title and the rating */
SELECT 
	movies.title,
	ratings.rating
 FROM
 	movies
 	LEFT JOIN ratings on movies.id = ratings.movie_id
 	WHERE title LIKE '%godfather, the%';
	
/* Order the previous objective by newest to oldest */
SELECT 
	movies.title,
	ratings.rating,
	ratings.timestamp
 FROM
 	movies
 	LEFT JOIN ratings on movies.id = ratings.movie_id
 	WHERE title LIKE '%godfather, the%'
 	ORDER BY timestamp DESC;

/* Find the comedies from 2005 and get the title and imdbid from the links table */
SELECT 
	movies.title,
	links.imdb_id
	FROM
	movies
	LEFT JOIN links on movies.id = links.movie_id
	WHERE movies.title LIKE '%2005%' && movies.genres LIKE '%comedy%';
/* Find all movies that have no ratings */
SELECT
movies.title,
ratings.rating
FROM 
movies
LEFT JOIN ratings on movies.id = ratings.movie_id
WHERE ISNULL(ratings.rating);
/* Complete the following aggregation objectives:
Get the average rating for a movie */

/* Get the total ratings for a movie */

/* Get the total movies for a genre */

/* Get the average rating for a user */

/* Find the user with the most ratings */

/* Find the user with the highest average rating */

/* Find the user with the highest average rating with more than 50 reviews */

/* Find the movies with an average rating over 4 */




/* Hard Mode
Use concat and research about internet movie database to produce a valid url from the imdbid
Use concat and research about the movie database to produce a valid url from tmdbid
Get the ratings for The Unusuals and convert the timestamp into a human readable date time
Using SQL normalize the tags in the tags table. Make them lowercased and replace the spaces with -
Create a new field on the movies table for the year. Using an update query and a substring method update that column for every movie with the year found in the title column.
Once you have completed the new year column go through the title column and strip out the year.
Create a new column in the movies table and store the average review for each and every movie. */

