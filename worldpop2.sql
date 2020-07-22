--- How many countries in the countries table are from Africa?
SELECT COUNT(*)
FROM countries
WHERE continent = 'Africa';

--- What was the total population of the continent of Oceania in 2005:
WITH comb AS (
  SELECT *
  FROM countries
  JOIN population_years
    ON countries.id = population_years.country_id
)
SELECT SUM(population)
FROM comb 
WHERE continent = 'Oceania' ANd year = 2005;

--- What was the average population of countries in South American in 2003:
WITH comb AS (
  SELECT *
  FROM countries
  JOIN population_years
    ON countries.id = population_years.country_id
)
SELECT AVG(population)
FROM comb
WHERE continent = 'South America' AND year = 2003;

--- What country had the smallest population in 2007:
WITH comb AS (
  SELECT *
  FROM countries
  JOIN population_years
    ON countries.id = population_years.country_id
)
SELECT name
FROM comb
WHERE year = 2007
ORDER BY population ASC
LIMIT 1;

--- What is the average population of Poland during the time period covered in the dataset:
WITH comb AS (
  SELECT *
  FROM countries
  JOIN population_years
    ON countries.id = population_years.country_id
)
SELECT AVG(population)
FROM comb
WHERE name = 'Poland';

--- How many countries have the word "The" in their name:
WITH comb AS (
  SELECT *
  FROM countries
  LEFT JOIN population_years
    ON countries.id = population_years.country_id
)
SELECT COUNT(*)
FROM comb
WHERE name LIKE '%The%';

--- What was the total population of each continent in 2010:
WITH comb AS (
  SELECT *
  FROM countries
  JOIN population_years
    ON countries.id = population_years.country_id
)
SELECT continent, SUM(population)
FROM comb
GROUP BY continent;




