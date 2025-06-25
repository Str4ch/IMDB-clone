-- This query retrieves the name, birth year, and roles of a person with a specific ID.

SELECT 
	p.primaryName AS actor_name,
	p.birthYear AS birth_year,
    t.primaryTitle AS name,
    t.startYear AS year,
    string_agg(DISTINCT pr.category, ', ') AS roles

FROM name_basics p
JOIN title_principals pr ON p.nconst = pr.nconst
JOIN title_basics t ON pr.tconst = t.tconst
WHERE p.nconst = 'nm0000138'  /* EXAMPLE ID */
GROUP BY p.primaryName, p.birthYear, t.primaryTitle, t.titleType, t.startYear
LIMIT 1;