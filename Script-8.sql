create table if not exists genres (
	genre_id serial primary key, 
	genre_name varchar(100)
);

create table if not exists musicians (
	musician_id serial primary key, 
	musician_name varchar(100)
);

create table if not exists genres_musicians (
	genre_id int references genres (genre_id), 
	musician_id int references musicians(musician_id),
	constraint pk primary key (genre_id, musician_id)
);

create table if not exists albums (
	album_id serial primary key, 
	album_name varchar(100),
	release_year date
);

create table if not exists musicians_albums (
	album_id int references albums (album_id), 
	musician_id int references musicians(musician_id),
	constraint prk primary key (album_id, musician_id)
);

create table if not exists compositions (
	composition_id serial primary key, 
	composition_name varchar(150),
	duration interval,
	album_id int references albums (album_id)
);

create table if not exists compilations_compositions (
	compilation_id int references compilations (compilation_id), 
	composition_id int references compositions (composition_id),
	constraint pkey primary key (compilation_id, composition_id)
);

create table if not exists compilations (
	compilation_id serial primary key, 
	compilation_name varchar(150),
	compilation_year date
);

--drop table compilation;
--drop table genres;
--drop table genresmusicians;
--drop table musicians;
--drop table musiciansalbums;