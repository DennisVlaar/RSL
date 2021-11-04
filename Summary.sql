ALTER TABLE movies ADD lexemesSumarry tsvector;
ALTER TABLE
test=> ALTER TABLE movies ADD lexemesSummary tsvector;
ALTER TABLE
test=> UPDATE movies SET lexemesSummary = to_tsvector(Summary);
UPDATE 5229
test=> SELECT url FROM movies WHERE lexemesSummary @@ to_tsquery ('pirate');
test=> ALTER TABLE movies ADD rank float4;
ALTER TABLE
test=> UPDATE movies SET rank = ts_rank(lexemesSummary,plainto_tsquery(( SELECT Summary FROM movies WHERE url = 'american-pie' ) ));
UPDATE 5229
test=> CREATE TABLE RecSum AS SELECT url, rank FROM movies WHERE rank > 0.01 ORDER BY rank DESC LIMIT 50;
SELECT 50
test=> \copy (SELECT * FROM RecSum) to '/home/pi/RSL/top50recommendations.csv' WITH csv;
COPY 50