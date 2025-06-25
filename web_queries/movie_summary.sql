-- This query retrieves a summary of a movie including its title, year, duration,
-- directors, writers, average rating, and number of votes.

WITH movie AS (
    SELECT 
        t.tconst,
        t.primaryTitle AS title,
        t.startYear AS year,
        t.runtimeMinutes AS duration,
        r.averageRating AS avg_rating,
        r.numVotes AS num_votes,
        c.directors AS director_ids,
        c.writers AS writer_ids
    FROM title_basics t
    LEFT JOIN title_crew c ON t.tconst = c.tconst
    LEFT JOIN title_ratings r ON t.tconst = r.tconst
    WHERE t.tconst = 'tt7359072' /* EXAMPLE ID */
),

directors AS (
    SELECT m.tconst, string_agg(n.primaryName, ', ') AS director_names
    FROM movie m
    JOIN unnest(m.director_ids) AS d_id(nconst) ON true
    JOIN name_basics n ON d_id.nconst = n.nconst
    GROUP BY m.tconst
),

writers AS (
    SELECT m.tconst, string_agg(n.primaryName, ', ') AS writer_names
    FROM movie m
    JOIN unnest(m.writer_ids) AS w_id(nconst) ON true
    JOIN name_basics n ON w_id.nconst = n.nconst
    GROUP BY m.tconst
)

SELECT 
    m.title,
    m.year,
    m.duration,
    d.director_names,
    w.writer_names,
    m.avg_rating,
    m.num_votes
FROM movie m
LEFT JOIN directors d ON m.tconst = d.tconst
LEFT JOIN writers w ON m.tconst = w.tconst
LIMIT 1;