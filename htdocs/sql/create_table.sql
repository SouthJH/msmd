CREATE DATABASE IF NOT EXISTS MOVIE;

USE MOVIE;

DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS screen;
DROP TABLE IF EXISTS movie;
DROP TABLE IF EXISTS user_info;


CREATE TABLE movie(
	mid			INT not null,
    title		VARCHAR(50) not null,
    genre		INT,
    grade		INT,
    director	VARCHAR(70),
    PRIMARY KEY(mid)
) DEFAULT CHARACTER SET = 'utf8';


CREATE TABLE screen(
	sid 		INT not null,
    mid			INT not null,
    s_time		DATETIME not null,
    e_time 		DATETIME not null,
    seat 		VARCHAR(156) not null,
    FOREIGN KEY(mid) REFERENCES movie(mid),
    PRIMARY KEY(sid)
) DEFAULT CHARACTER SET = 'utf8';


CREATE TABLE user_info(
	uid 		VARCHAR(20) not null,
    pw 			VARCHAR(20) not null,
    uname		VARCHAR(20) not null,
    phone		VARCHAR(16) not null,
    authority	INT not null,
    PRIMARY KEY(uid)
) DEFAULT CHARACTER SET = 'utf8';


CREATE TABLE reservation(
	no_account	BOOL not null,	
    rid 		INT not null,
	uid 		VARCHAR(20) not null,
    sid			INT not null,
    FOREIGN KEY(uid) REFERENCES user_info(uid),
    FOREIGN KEY(sid) REFERENCES screen(sid),
    PRIMARY KEY(rid)
) DEFAULT CHARACTER SET = 'utf8';