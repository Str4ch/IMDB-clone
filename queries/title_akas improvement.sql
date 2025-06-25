create index idx_title on title_akas(titleid);

ALTER TABLE title_akas ADD COLUMN id SERIAL PRIMARY KEY;

/* REMOVE INVALID ROWS */

CREATE TABLE title_akas_invalid AS
SELECT ta.*
FROM title_akas ta
LEFT JOIN title_basics tb ON ta.titleid = tb.tconst
WHERE tb.tconst IS NULL;

DELETE FROM title_akas ta
USING title_akas_invalid tai
WHERE ta.id = tai.id;

/* ADD FOREIGN KEY */

ALTER TABLE title_akas
ADD CONSTRAINT fk_titleid
FOREIGN KEY (titleid) REFERENCES title_basics(tconst);
