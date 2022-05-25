CREATE TABLE pg4e_debug (
  id SERIAL,
  query VARCHAR(4096),
  result VARCHAR(4096),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id)
);

alter table pg4e_debug add neon27 integer;

select * from pg4e_debug;

--- STORED PROCEDURE
CREATE TABLE keyvalue ( 
  id SERIAL,
  key VARCHAR(128) UNIQUE,
  value VARCHAR(128) UNIQUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  PRIMARY KEY(id)
);

create or replace function trigger_set_timestamp()
returns trigger as $$
begin 
	new.updated_at = now();
	return new;
end;
$$ language plpgsql;


create trigger set_timestamp
before update on keyvalue
for each row
execute procedure trigger_set_timestamp();

select * from keyvalue;

--- MUSICAL TRACKS

CREATE TABLE album (
  id SERIAL,
  title VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE track (
    id SERIAL,
    title VARCHAR(128),
    len INTEGER, rating INTEGER, count INTEGER,
    album_id INTEGER REFERENCES album(id) ON DELETE CASCADE,
    UNIQUE(title, album_id),
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS track_raw;
CREATE TABLE track_raw
 (title TEXT,
 artist TEXT,
 album TEXT,
 album_id INTEGER,
 count INTEGER,
 rating INTEGER,
 len INTEGER);
 
\copy track_raw(title,artist,album,count,rating,len) from 'library.csv' with delimiter ',' csv;

INSERT INTO album(title) SELECT DISTINCT album FROM track_raw;

UPDATE track_raw SET album_id = (SELECT album.id FROM album WHERE album.title = track_raw.album);

INSERT INTO track(title,len,rating,count,album_id) SELECT title,len,rating,count,album_id FROM track_raw;

SELECT track.title, album.title
FROM track
JOIN album ON track.album_id = album.id
ORDER BY track.title 
LIMIT 3;

--- UNESCO HERTITAGE SITES
DROP TABLE IF EXISTS unesco_raw;
CREATE TABLE unesco_raw
 (name TEXT, description TEXT, justification TEXT, year INTEGER,
    longitude FLOAT, latitude FLOAT, area_hectares FLOAT,
    category TEXT, category_id INTEGER, state TEXT, state_id INTEGER,
    region TEXT, region_id INTEGER, iso TEXT, iso_id INTEGER);

CREATE TABLE category (
  id SERIAL,
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

\copy unesco_raw(name,description,justification,year,longitude,latitude,area_hectares,category,state,region,iso) FROM 'whc-sites-2018-small.csv' WITH DELIMITER ',' CSV HEADER;

CREATE TABLE iso (
  id SERIAL,
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE state (
  id SERIAL,
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE region (
  id SERIAL,
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

INSERT INTO category(name) SELECT DISTINCT category FROM unesco_raw;
INSERT INTO iso(name) SELECT DISTINCT iso FROM unesco_raw;
INSERT INTO state(name) SELECT DISTINCT state FROM unesco_raw;
INSERT INTO region(name) SELECT DISTINCT region FROM unesco_raw;

UPDATE unesco_raw SET iso_id = (SELECT id FROM iso WHERE iso.name = unesco_raw.iso);
UPDATE unesco_raw SET state_id = (SELECT id FROM state WHERE state.name = unesco_raw.state);
UPDATE unesco_raw SET category_id = (SELECT id FROM category WHERE category.name = unesco_raw.category);
UPDATE unesco_raw SET region_id = (SELECT id FROM region WHERE region.name = unesco_raw.region);

DROP TABLE IF EXISTS unesco;
CREATE TABLE unesco
 (name TEXT, description TEXT, justification TEXT, year INTEGER,
    longitude FLOAT, latitude FLOAT, area_hectares FLOAT,
    category_id INTEGER, state_id INTEGER,
    region_id INTEGER, iso_id INTEGER);

insert into unesco (name,description,justification,year,
					longitude, latitude, area_hectares,
					category_id,state_id,region_id,iso_id)
select name,description,justification,year,longitude, latitude,
		area_hectares,category_id,state_id,region_id,iso_id
from unesco_raw;

SELECT unesco.name, year, category.name, state.name, region.name, iso.name
  FROM unesco
  JOIN category ON unesco.category_id = category.id
  JOIN iso ON unesco.iso_id = iso.id
  JOIN state ON unesco.state_id = state.id
  JOIN region ON unesco.region_id = region.id
  ORDER BY state.name, unesco.name
  LIMIT 3;

 --- MUSIC TRACKS PLUS ARTISTS
DROP TABLE IF EXISTS album CASCADE;
CREATE TABLE album (
    id SERIAL,
    title VARCHAR(128) UNIQUE,
    PRIMARY KEY(id)
);

DROP table IF EXISTS track CASCADE;
CREATE TABLE track (
    id SERIAL,
    title TEXT, 
    artist TEXT, 
    album TEXT, 
    album_id INTEGER REFERENCES album(id) ON DELETE CASCADE,
    count INTEGER, 
    rating INTEGER, 
    len INTEGER,
    PRIMARY KEY(id)
);

DROP TABLE IF exists artist CASCADE;
CREATE TABLE artist (
    id SERIAL,
    name VARCHAR(128) UNIQUE,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS tracktoartist CASCADE;
CREATE TABLE tracktoartist (
    id SERIAL,
    track VARCHAR(128),
    track_id INTEGER REFERENCES track(id) ON DELETE CASCADE,
    artist VARCHAR(128),
    artist_id INTEGER REFERENCES artist(id) ON DELETE CASCADE,
    PRIMARY KEY(id)
);


\copy track(title,artist,album,count,rating,len) FROM 'library.csv' WITH DELIMITER ',' CSV;

INSERT INTO album(title) SELECT DISTINCT album FROM track; 

UPDATE track SET album_id = (SELECT album.id FROM album WHERE album.title = track.album);

INSERT INTO tracktoartist (track, artist) SELECT DISTINCT title,artist FROM track; 

INSERT INTO artist(name) SELECT DISTINCT artist FROM track;  

UPDATE tracktoartist SET track_id = (SELECT track.id FROM track WHERE track.title = tracktoartist.track);

UPDATE tracktoartist SET artist_id = (SELECT artist.id FROM artist WHERE artist.name = tracktoartist.artist);

ALTER TABLE track DROP COLUMN album;

ALTER TABLE tracktoartist DROP COLUMN track;

ALTER TABLE tracktoartist DROP COLUMN artist;

ALTER TABLE track DROP COLUMN artist;

SELECT track.title, album.title, artist.name
FROM track
JOIN album ON track.album_id = album.id
JOIN tracktoartist ON track.id = tracktoartist.track_id
JOIN artist ON tracktoartist.artist_id = artist.id
ORDER BY track.title
LIMIT 3;

--- GENERATING TEXT
CREATE TABLE bigtext(
	content TEXT);

INSERT INTO bigtext(content) SELECT  'This is record number ' || generate_series(100000,199999) || ' of quite a few text records.';

--- REGEX
SELECT purpose FROM taxdata WHERE purpose ~ '^[A-Z]' ORDER BY purpose DESC LIMIT 3;

SELECT purpose FROM taxdata WHERE purpose ~ '[0-9][0-9][0-9][0-9]+$' ORDER BY purpose DESC LIMIT 3;
