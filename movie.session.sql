CREATE TABLE customer (
	customer_id SERIAL PRIMARY KEY,
	name VARCHAR(200),
	email VARCHAR(200)
);

CREATE TABLE ticket (
	ticket_id SERIAL PRIMARY KEY,
	customer_id INTEGER,
	movie_id INTEGER,
	price NUMERIC,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE
);

CREATE TABLE movie (
	movie_id SERIAL PRIMARY KEY,
	name VARCHAR(150),
	description VARCHAR(1000)
);

CREATE TABLE concession (
	concession_id SERIAL PRIMARY KEY,
	customer_id INTEGER,
	concession_detail_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
	FOREIGN KEY(concession_detail_id) REFERENCES concession_detail(concession_detail_id) ON DELETE CASCADE
);

CREATE TABLE concession_detail (
	concession_detail_id SERIAL PRIMARY KEY,
	price NUMERIC,
	name VARCHAR(200),
	description VARCHAR(1000)
);

INSERT INTO customer (name, email)
VALUES
	('John Smith', 'some@email.com'),
	('Billybob Joe', 'nota@bot.com'),
	('Александр Иванов', 'яблоки@gmail.com');


-- I goofed

ALTER TABLE movie
-- Show time is in time since the epoch, because screw timezones... those can be worked out clientside
ADD showtime BIGINT;

ALTER TABLE movie
ADD place CHAR;

INSERT INTO movie (name, description, showtime, place)
VALUES
	('The Fall', 'Empires rise and fall. So does everything else. Gravity is sinusoidal.', 1626902036, 'A'),
	('What''s that awful noise?', 'Please make it stop. I''ve been hearing it for the past 39 days.', 1626902335, 'B')

INSERT INTO ticket (customer_id, movie_id, price)
VALUES
	(NULL, 1, 19.99),
	(1, 1, 25.99),
	(3, 1, 18.99),
	(NULL, 1, 19.99),
	(NULL, 2, 29.99),
	(2, 2, 29.99),
	(NULL, 2, 29.99);

INSERT INTO concession_detail (name, description, price)
VALUES
	('Boyoing', 'A deliciously bouncy treat that turns your insides into flubber.', 0.99),
	('Apple', 'It''s literally just an apple.', 99.99);

INSERT INTO concession (customer_id, concession_detail_id)
VALUES
	(3, 2),
	(1, 1);

SELECT * FROM customer;
SELECT * FROM movie;
SELECT * FROM ticket;
SELECT * FROM concession_detail;
SELECT * FROM concession;