-- This query retrieves details about a specific TV series, including its title, start and end years,
-- number of seasons, average rating, number of votes, and main cast.

WITH series AS (
    SELECT *
    FROM title_basics
    WHERE tconst = 'tt0944947' AND titleType = 'tvSeries'
),

seasons AS (
    SELECT COUNT(DISTINCT seasonNumber) AS seasons_count
    FROM title_episode
    WHERE parentTconst = 'tt0944947' AND seasonNumber IS NOT NULL
),

rating AS (
    SELECT averageRating, numVotes
    FROM title_ratings
    WHERE tconst = 'tt0944947'
),

main_cast AS (
    SELECT array_agg(primaryName ORDER BY t_ordering) AS cast
    FROM (
        SELECT DISTINCT ON (n.primaryName) n.primaryName, p.t_ordering
        FROM title_principals p
        JOIN name_basics n ON p.nconst = n.nconst
        WHERE p.tconst = 'tt0944947' /* EXAMPLE ID */
          AND p.category IN ('actor', 'actress')
        ORDER BY n.primaryName, p.t_ordering
        LIMIT 5
    ) sub
)

SELECT
    s.primaryTitle AS title,
    s.startYear,
    s.endYear,
    se.seasons_count,
    r.averageRating,
    r.numVotes,
    mc.cast AS main_cast
FROM series s
LEFT JOIN seasons se ON TRUE
LEFT JOIN rating r ON TRUE
LEFT JOIN main_cast mc ON TRUE
LIMIT 1;