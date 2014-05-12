CREATE TABLE videos (
	vidid integer SERIAL PRIMARY KEY,
	title text,
	complete_date date,
	anime1 text,
	anime2 text,
	anime3 text,
	artist1 text,
	artist2 text,
	artist3 text,
	song1 text,
	song2 text,
	song3 text
);

CREATE TABLE csuser (
	userid integer SERIAL PRIMARY KEY,
	username text,
	firstname text,
	lastname text,
	address text,
	city text,
	state text,
	postcode text,
	phone text,
	email text
);

CREATE TABLE contest (
	contestid integer SERIAL PRIMARY KEY,
	coordinator integer REFERENCES csuser (userid),
	contestname text,
	deadline date,
	freshness date
);
	
CREATE TYPE status AS ENUM ('Pending', 'Recieved', 'Accepted', 'Disqualified', 'Finalist', 'Overflow');
	
CREATE TABLE contestsubmissions(
	contestid integer REFERENCES contest (contestid),
	vidid integer REFERENCES videos (vidid),
	entrystatus status,
	statuscomment text,
	category text,
	PRIMARY KEY (contestid, vidid)
);
	