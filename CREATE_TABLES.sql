create table name_basics(
	nconst varchar,
	primaryName	varchar,
	birthYear varchar,
	deathYear varchar, 
	primaryProfession varchar,
	knownForTitles varchar
);

create table title_akas(
	titleId varchar,
	t_ordering int,
	title varchar,
	region varchar,
	t_language varchar,
	t_types varchar,
	t_attributes varchar,
	isOriginalTitle bool
);

create table title_basics(
	tconst varchar,
	titleType varchar,
	primaryTitle varchar,
	originalTitle varchar,
	isAdult bool,
	startYear varchar,
	endYear varchar,
	runtimeMinutes int,
	genres varchar
);

create table title_crew(
	tconst varchar,
	directors varchar,
	writers varchar
);

create table title_episode (
	tconst varchar,
	parentTconst varchar,
	seasonNumber varchar,
	episodeNumber varchar
);

create table title_principals(
	tconst varchar,
	t_ordering int,
	nconst varchar,
	category varchar,
	job varchar,
	t_characters varchar
);

create table title_ratings(
	tconst varchar primary key,
	averageRating float,
	numVotes int
);
