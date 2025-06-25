-- This query retrieves details about episodes of a specific series, including their titles, ratings, and number of votes.

SELECT 
    e.seasonNumber,
    e.episodeNumber,
    t.primaryTitle AS episodeTitle,
    r.averageRating::FLOAT,
    r.numVotes

FROM title_episode e
JOIN title_basics t ON e.tconst = t.tconst
LEFT JOIN title_ratings r ON e.tconst = r.tconst
WHERE e.parentTconst = 'tt0944947' /* EXAMPLE ID */
ORDER BY e.seasonNumber, e.episodeNumber
LIMIT 1;