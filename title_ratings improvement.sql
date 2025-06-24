ALTER TABLE title_ratings
ADD CONSTRAINT fk_tconst
FOREIGN KEY (tconst) REFERENCES title_basics(tconst);