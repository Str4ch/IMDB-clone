ALTER TABLE name_basics
ADD CONSTRAINT name_basics_pk PRIMARY KEY (nconst);

alter table name_basics
ALTER COLUMN birthyear TYPE INT
USING birthyear::integer;

alter table name_basics
ALTER COLUMN deathyear TYPE INT
USING deathyear::integer;

create index prim_name_idx on name_basics(primaryname)

/*
create index prim_birth_idx on name_basics(birthyear)
create index prim_death_idx on name_basics(deathyear)
*/


ALTER TABLE name_basics
ALTER COLUMN primaryprofession TYPE VARCHAR[]
USING string_to_array(primaryprofession, ',');

ALTER TABLE name_basics
ALTER COLUMN knownfortitles TYPE VARCHAR[]
USING string_to_array(knownfortitles, ',');

/* JOIN TABLE */
CREATE TABLE name_title_join AS
SELECT nconst, unnest(knownfortitles) AS tconst
FROM name_basics;

create index tconst_idx on name_title_join(tconst);
create index nconst_idx on name_title_join(nconst);

ALTER TABLE name_title_join ADD COLUMN id SERIAL PRIMARY KEY;

/* REMOVE INVALID ROWS FROM JOIN TABLE */
CREATE TABLE name_title_join_invalid AS
SELECT ntj.*
FROM name_title_join ntj
LEFT JOIN title_basics tb ON ntj.tconst = tb.tconst
WHERE tb.tconst IS NULL;

DELETE FROM name_title_join ntj
USING name_title_join_invalid ntji
WHERE ntj.tconst = ntji.tconst and ntj.nconst = ntji.nconst;

/* ADD FORIEGN KEYS */

ALTER TABLE name_title_join
ADD CONSTRAINT fk_tconst
FOREIGN KEY (tconst) REFERENCES title_basics(tconst);

ALTER TABLE name_title_join
ADD CONSTRAINT fk_nconst
FOREIGN KEY (nconst) REFERENCES name_basics(nconst);
