CREATE TABLE netflix_raw_updated (
    show_id VARCHAR(10) PRIMARY KEY,
    type VARCHAR(10),
    title VARCHAR(200),
    director VARCHAR(250),
    "cast" VARCHAR(1000),
    country VARCHAR(150),
    date_added VARCHAR(20),
    release_year INT,
    rating VARCHAR(10),
    duration VARCHAR(10),
    listed_in VARCHAR(100),
    description VARCHAR(500)
);

SELECT * FROM netflix_raw_updated
where show_id = 's4915'


SELECT show_id, COUNT(*) AS duplicate_count
FROM netflix_raw_updated
GROUP BY show_id
HAVING COUNT(*) > 1;

SELECT title, COUNT(*) AS duplicate_count
FROM netflix_raw_updated
GROUP BY show_id
HAVING COUNT(*) > 1;

SELECT type, COUNT(*) AS duplicate_count
FROM netflix_raw_updated
GROUP BY show_id
HAVING COUNT(*) > 1;


#checking if the duplicates are based on both the columns (Type and Title) and concat them.

select * from netflix_raw
where concat(upper(title),type)  in (
select concat(upper(title),type) 
from netflix_raw
group by upper(title) ,type
having COUNT(*)>1
)
order by title






-- check duplicates
SELECT show_id, COUNT(*) AS duplicate_count
FROM netflix_raw_updated
GROUP BY show_id
HAVING COUNT(*) > 1;

SELECT title, COUNT(*) AS duplicate_count
FROM netflix_raw_updated
GROUP BY title
HAVING COUNT(*) > 1;



-- As there are no duplicates in show id column, marking this column as a primary key
CREATE TABLE netflix_raw_updated (
    show_id VARCHAR(10) PRIMARY KEY,
    type VARCHAR(10),
    title VARCHAR(200),
    director VARCHAR(250),
    "cast" VARCHAR(1000),
    country VARCHAR(150),
    date_added VARCHAR(20),
    release_year INT,
    rating VARCHAR(10),
    duration VARCHAR(10),
    listed_in VARCHAR(100),
    description VARCHAR(500)
);


--This query returns all rows from netflix_raw where the combination of title (ignoring case) and type appears more than once.

select * from netflix_raw
where concat(upper(title),type)  in (
select concat(upper(title),type) 
from netflix_raw
group by upper(title) ,type
having COUNT(*)>1
)
order by title


#Creating another table as a movie or a drama can be named as same(genre)

select show_id , trim(value) as genre
into netflix_genre
from netflix_raw
cross apply string_split(listed_in,',')


select show_id , trim(value) as cast
into netflix_genre
from netflix_raw
cross apply string_split(listed_in,',')

select show_id , trim(value) as Country
into netflix_genre
from netflix_raw
cross apply string_split(listed_in,',')



