test=> ALTER TABLE movies ADD lexemesStarring tsvector;
ALTER TABLE
test=> UPDATE movies SET lexemesStarring = to_tsvector(Starring);
UPDATE 5229
test=> SELECT url FROM movies WHERE lexemesStarring @@ to_tsquery('american');
test=> UPDATE movies SET rank2 = ts_rank(lexemesStarring,plainto_tsquery((SELECT Starring FROM movies WHERE url = 'american-pie' )));
UPDATE 5229
test=> CREATE TABLE RecStar AS SELECT url, rank2 FROM movies WHERE rank > 0.01 ORDER BY rank2 DESC LIMIT 50;
SELECT 50
test=> \copy (SELECT * FROM RecStar) to '/home/pi/RSL/top50recommendationsStarring.csv' WITH csv;
