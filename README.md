# IMDB clone

## How to set up database

### STEP 1

Run sql script ```CREATE_TABLES.sql```

### STEP 2

Using ```psql``` run 7 following commands:

\copy title_episode FROM 'path/to/files/title.episode.tsv' WITH (FORMAT text, DELIMITER E'\t', HEADER true)
\copy title_ratings FROM 'path/to/files/title.ratings.tsv' WITH (FORMAT text, DELIMITER E'\t', HEADER true)
\copy name_basics FROM 'path/to/files/name.basics.tsv' WITH (FORMAT text, DELIMITER E'\t', HEADER true)
\copy title_akas FROM 'path/to/files/title.akas.tsv' WITH (FORMAT text, DELIMITER E'\t', HEADER true)
\copy title_basics FROM 'path/to/files/title.basics.tsv' WITH (FORMAT text, DELIMITER E'\t', HEADER true)
\copy title_crew FROM 'path/to/files/title.crew.tsv' WITH (FORMAT text, DELIMITER E'\t', HEADER true)
\copy title_principals FROM 'path/to/files/title.principals.tsv' WITH (FORMAT text, DELIMITER E'\t', HEADER true)

(you can also find them in ```copy_db``` file)

