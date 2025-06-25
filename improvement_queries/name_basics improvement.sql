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
