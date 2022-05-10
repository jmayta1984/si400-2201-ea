CREATE DATABASE MovieDB;

GO

USE MovieDB;

-- tables
-- Table: actors
CREATE TABLE actors (
    id int  NOT NULL,
    name varchar(100)  NOT NULL,
    gender char(1)  NOT NULL,
    CONSTRAINT actors_pk PRIMARY KEY  (id)
);

-- Table: directors
CREATE TABLE directors (
    id int  NOT NULL,
    name varchar(100)  NOT NULL,
    CONSTRAINT directors_pk PRIMARY KEY  (id)
);

-- Table: genres
CREATE TABLE genres (
    id int  NOT NULL,
    description varchar(50)  NOT NULL,
    CONSTRAINT genres_pk PRIMARY KEY  (id)
);

-- Table: movie_cast
CREATE TABLE movie_cast (
    actor_id int  NOT NULL,
    movie_id int  NOT NULL,
    role varchar(50)  NOT NULL,
    CONSTRAINT movie_cast_pk PRIMARY KEY  (actor_id,movie_id)
);

-- Table: movies
CREATE TABLE movies (
    id int  NOT NULL,
    title varchar(50)  NOT NULL,
    year int  NOT NULL,
    language varchar(50)  NOT NULL,
    duration int  NOT NULL,
    director_id int  NOT NULL,
    genre_id int  NOT NULL,
    CONSTRAINT movies_pk PRIMARY KEY  (id)
);

-- Table: ratings
CREATE TABLE ratings (
    reviewer_id int  NOT NULL,
    movie_id int  NOT NULL,
    stars int  NOT NULL,
    comment varchar(255)  NOT NULL,
    CONSTRAINT ratings_pk PRIMARY KEY  (reviewer_id,movie_id)
);

-- Table: reviewers
CREATE TABLE reviewers (
    id int  NOT NULL,
    name varchar(100)  NOT NULL,
    CONSTRAINT reviewers_pk PRIMARY KEY  (id)
);

-- foreign keys
-- Reference: movie_casting_actors (table: movie_cast)
ALTER TABLE movie_cast ADD CONSTRAINT movie_casting_actors
    FOREIGN KEY (actor_id)
    REFERENCES actors (id);

-- Reference: movie_casting_movies (table: movie_cast)
ALTER TABLE movie_cast ADD CONSTRAINT movie_casting_movies
    FOREIGN KEY (movie_id)
    REFERENCES movies (id);

-- Reference: movies_directors (table: movies)
ALTER TABLE movies ADD CONSTRAINT movies_directors
    FOREIGN KEY (director_id)
    REFERENCES directors (id);

-- Reference: movies_genres (table: movies)
ALTER TABLE movies ADD CONSTRAINT movies_genres
    FOREIGN KEY (genre_id)
    REFERENCES genres (id);

-- Reference: rating_movies (table: ratings)
ALTER TABLE ratings ADD CONSTRAINT rating_movies
    FOREIGN KEY (movie_id)
    REFERENCES movies (id);

-- Reference: rating_reviewers (table: ratings)
ALTER TABLE ratings ADD CONSTRAINT rating_reviewers
    FOREIGN KEY (reviewer_id)
    REFERENCES reviewers (id);

-- End of file.

