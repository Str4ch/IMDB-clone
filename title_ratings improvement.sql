ALTER TABLE title_ratings
ADD CONSTRAINT fk_tconst
FOREIGN KEY (tconst) REFERENCES title_basics(tconst);

create index rating_idx on title_ratings(averagerating);
CREATE INDEX IF NOT EXISTS idx_title_ratings_tconst ON title_ratings(tconst);

