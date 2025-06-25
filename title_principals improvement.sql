/* REMOVE INVALID ROWS FROM JOIN TABLE */
CREATE TABLE title_principals_invalid AS
SELECT tp.*
FROM title_principals tp
LEFT JOIN name_basics nb ON tp.nconst = nb.nconst
WHERE nb.nconst IS NULL;

DELETE FROM title_principals tp
USING title_principals_invalid tpi
WHERE tp.nconst = tpi.nconst;

ALTER TABLE title_principals
ADD CONSTRAINT fk_tconst
FOREIGN KEY (tconst) REFERENCES title_basics(tconst);

ALTER TABLE title_principals
ADD CONSTRAINT fk_nconst
FOREIGN KEY (nconst) REFERENCES name_basics(nconst);

CREATE INDEX IF NOT EXISTS idx_title_principals_tconst ON title_principals(tconst);

CREATE INDEX IF NOT EXISTS idx_title_principals_nconst ON title_principals(nconst);

CREATE INDEX IF NOT EXISTS idx_title_principals_category ON title_principals(category);

