CREATE DATABASE evidencedb;

USE evidencedb;

CREATE TABLE evidence (
	id INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(100) NOT NULL,
	description VARCHAR(200) NOT NULL,
	dir VARCHAR(200) NOT NULL,
	tipe VARCHAR(30) NOT NULL,
	lat INT NOT NULL,
	lon INT NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
);

CREATE TABLE evidenceStateChanges (
	id INT NOT NULL AUTO_INCREMENT,
	evidence_id INT NOT NULL,
	user_id INT,
	description VARCHAR(200) NOT NULL,
	state ENUM('unverified', 'verified', 'validated') NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (evidence_id) REFERENCES evidence(id)
)

CREATE TABLE user (
	id INT NOT NULL AUTO_INCREMENT,
	user VARCHAR(100) NOT NULL,
	password VARCHAR(100) NOT NULL,
);

CREATE TABLE userRole (
	id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	role ENUM('checker', 'validator', 'administrator') NOT NULL,
	password VARCHAR(100) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES user(id)
);