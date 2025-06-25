alter table title_episode
ALTER COLUMN seasonnumber TYPE INT
USING seasonnumber::integer;

alter table title_episode
ALTER COLUMN episodenumber TYPE INT
USING episodenumber::integer;

ALTER TABLE title_episode
ADD CONSTRAINT fk_tconst
FOREIGN KEY (tconst) REFERENCES title_basics(tconst);

ALTER TABLE title_episode
ADD CONSTRAINT fk_parent_tconst
FOREIGN KEY (parenttconst) REFERENCES title_basics(tconst);

select * from title_episode
limit 100;