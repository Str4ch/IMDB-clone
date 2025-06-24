ALTER TABLE title_basics
ADD CONSTRAINT title_basics_pk PRIMARY KEY (tconst);

alter table title_basics
ALTER COLUMN startyear TYPE INT
USING startyear::integer;

alter table title_basics
ALTER COLUMN endyear TYPE INT
USING endyear::integer;

ALTER TABLE title_basics
ALTER COLUMN genres TYPE VARCHAR[]
USING string_to_array(genres, ',');

create index start_year_idx on title_basics(startyear);
create index end_year_idx on title_basics(endyear);
create index idx_primary_title on title_basics(primarytitle);
create index idx_original_title on title_basics(originaltitle);
create index idx_runtime_min on title_basics(runtimeminutes);
create index idx_genres on title_basics(genres);
create index idx_title_id on title_basics(tconst);

