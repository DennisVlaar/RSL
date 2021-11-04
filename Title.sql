test=> ALTER TABLE movies ADD rank1 float4;
ALTER TABLE
test=> ALTER TABLE movies ADD lexemesTitle tsvector;
ALTER TABLE
test=> UPDATE movies SET lexemesTitle = to_tsvector(Title);
UPDATE 5229
test=> SELECT url FROM movies WHERE lexemesTitle @@ to_tsquery('american');
test=> UPDATE movies SET rank1 = ts_rank(lexemesTitle,plainto_tsquery((SELECT Title FROM movies WHERE url = 'american-pie')));
UPDATE 5229
test=> CREATE TABLE RecTit AS SELECT url, rank1 FROM movies WHERE rank1 > 0.01 ORDER BY rank1 DESC LIMIT 50;
SELECT 2
test=> \copy (SELECT * FROM RecTit) to '/home/pi/RSL/top50recommendationsTitle.csv' WITH csv;
