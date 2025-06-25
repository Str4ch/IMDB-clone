/* averagerating of all titles per year */
select 
	avg(tr.averagerating),
	tb.startyear  
from title_basics as tb
inner join title_ratings as tr
on tr.tconst=tb.tconst
left join title_episode as te
on te.parenttconst = tb.tconst
where tb.startyear is not null and tr.numVotes > 20  and te.episodenumber is null and te.seasonnumber is null/* exclude unpopular titles and show episodes */
group by tb.startyear  
order by tb.startyear asc;

/* directors' films avg rating */
select nb.primaryname, avg(tr.averagerating) from name_basics as nb
inner join title_principals as ntj on ntj.nconst=nb.nconst
inner join title_basics as tb on ntj.tconst=tb.tconst
inner join title_ratings as tr on tr.tconst=tb.tconst
where primaryprofession is not null and ntj.category='director'
group by nb.primaryname

/* Genre popularity over time*/
SELECT 
  unnest(genres) AS genre,
  startyear,
  COUNT(*) AS count
FROM title_basics
WHERE startyear IS NOT NULL and startyear < 2025
GROUP BY genre, startyear
ORDER BY startyear desc, count DESC;
