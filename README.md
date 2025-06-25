# IMDB clone

## How to set up the database

### STEP 1

Run sql script ```import_queries/create_tables.sql```

### STEP 2

Using ```psql``` run 7 following lines from ```import_queries/copy_db.sh``` file.
You have ```import_queries/drop_tables.sql``` supportive file, if necessary

### STEP 3

First run ```improvement_queries/title_basics improvement.sql``` and then ```improvement_queries/name_basics improvement.sql```

### STEP 4
Run ```improvement_queries/title_akas improvement.sql```
```improvement_queries/title_crew improvement.sql```
```improvement_queries/title_episode improvement.sql```
```improvement_queries/title_principals improvement.sql```
```improvement_queries/title_ratings improvement.sql``` (5 in total) in any order