ALTER TABLE title_crew
ALTER COLUMN directors TYPE VARCHAR[]
USING string_to_array(directors, ',');

ALTER TABLE title_crew
ALTER COLUMN writers TYPE VARCHAR[]
USING string_to_array(writers, ',');

/* REMOVE INVALID ROWS FROM title_crew TABLE */
CREATE TABLE title_crew_invalid AS
SELECT tc.*
FROM title_crew tc
LEFT JOIN title_basics tb ON tc.tconst = tb.tconst
WHERE tb.tconst IS NULL;

DELETE FROM title_crew tc
USING title_crew_invalid tci
WHERE tc.tconst = tci.tconst;

/* FOREIGN KEYS */
ALTER TABLE title_crew
ADD CONSTRAINT fk_tconst
FOREIGN KEY (tconst) REFERENCES title_basics(tconst);
