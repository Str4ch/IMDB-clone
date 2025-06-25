-- This query retrieves the complete cast and crew for a specific ID.

SELECT
    t.primaryTitle AS title,
    t.startYear AS year,

    array_agg(n.primaryName) FILTER (WHERE p.category = 'director') AS directors,

    array_agg(n.primaryName) FILTER (WHERE p.category = 'writer') AS writers,

    array_agg(n.primaryName) FILTER (WHERE p.category = 'producer') AS producers,

    array_agg(n.primaryName) FILTER (WHERE p.category = 'composer') AS composers,

    array_agg(n.primaryName) FILTER (WHERE p.category = 'cinematographer') AS cinematographers,

	array_agg(n.primaryName) FILTER (WHERE p.category = 'self') AS selfs,

	array_agg(n.primaryName) FILTER (WHERE p.category = 'production_designers') AS production_designers,

    array_agg(n.primaryName) FILTER (WHERE p.category = 'editor') AS editors,

    array_agg(n.primaryName) FILTER (WHERE p.category = 'casting_director') AS casting_directors,

    array_agg(n.primaryName) FILTER (WHERE p.category = 'archive_footage') AS archive_footage,

    array_agg(n.primaryName) FILTER (WHERE p.category = 'archive_sound') AS archive_sound,

    array_agg(n.primaryName || COALESCE(' as ' || trim(BOTH '"' FROM (p.t_characters::json ->> 0)), ''))
		FILTER (WHERE p.category IN ('actor', 'actress')) AS cast

FROM title_basics t
LEFT JOIN title_ratings r ON t.tconst = r.tconst
JOIN title_principals p ON t.tconst = p.tconst
JOIN name_basics n ON p.nconst = n.nconst
WHERE t.tconst = 'tt7359004' /* EXAMPLE ID */
GROUP BY t.primaryTitle, t.startYear
LIMIT 1;