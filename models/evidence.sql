CREATE DATABASE evidencedb;

USE evidencedb;

-- Evidences and users

CREATE TABLE evidence (
	id INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(100) NOT NULL,
	description VARCHAR(200) NOT NULL,
	dir VARCHAR(200) NOT NULL,
	tipe VARCHAR(30) NOT NULL,
	lat INT NOT NULL,
	lon INT NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
);

CREATE TABLE user (
	id INT NOT NULL AUTO_INCREMENT,
	user VARCHAR(30) NOT NULL,
	password VARCHAR(30) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE role (
	id INT NOT NULL AUTO_INCREMENT,
	role ENUM('checker', 'validator', 'administrator') NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE evidenceStateChanges (
	id INT NOT NULL AUTO_INCREMENT,
	evidence_id INT NOT NULL,
	user_id INT NOT NULL,
	description VARCHAR(200) NOT NULL,
	state ENUM('unverified', 'verified', 'validated') NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (evidence_id) REFERENCES evidence(id),
	FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE userToRole (
	id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	role_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES user(id),
	FOREIGN KEY (role_id) REFERENCES role(id)
);

CREATE TABLE author (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE evidenceAuthor (
	id INT NOT NULL AUTO_INCREMENT,
	evidence_id INT NOT NULL,
	author_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (evidence_id) REFERENCES evidence(id),
	FOREIGN KEY (author_id) REFERENCES author(id)
);

-- Condiciones

CREATE TABLE condicion (
	id INT NOT NULL AUTO_INCREMENT,
	contenido VARCHAR(800) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE capitulo (
	id INT NOT NULL AUTO_INCREMENT,
	contenido VARCHAR(800) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES condicion(id)
);

CREATE TABLE paragrafo (
	id INT NOT NULL AUTO_INCREMENT,
	contenido VARCHAR(800) NOT NULL,
	capitulo_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (capitulo_id) REFERENCES capitulo(id)
);

CREATE TABLE seccion (
	id INT NOT NULL AUTO_INCREMENT,
	capitulo_id INT NOT NULL,
	contenido VARCHAR(800) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (capitulo_id) REFERENCES capitulo(id)
);

CREATE TABLE articulo (
	id INT NOT NULL AUTO_INCREMENT,
	contenido VARCHAR(800) NOT NULL,
	seccion_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (seccion_id) REFERENCES seccion(id)
);

CREATE TABLE literal (
	id INT NOT NULL AUTO_INCREMENT,
	contenido VARCHAR(800) NOT NULL,
	articulo_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (articulo_id) REFERENCES articulo(id)
);

CREATE TABLE numeral (
	id INT NOT NULL AUTO_INCREMENT,
	contenido VARCHAR(800) NOT NULL,
	literal_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (literal_id) REFERENCES literal(id)
);

-- Relaciones evidencias a todo

CREATE TABLE EvidenceToArticulo (
	id INT NOT NULL AUTO_INCREMENT,
	evidence_id INT NOT NULL,
	articulo_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (evidence_id) REFERENCES evidence(id),
	FOREIGN KEY (articulo_id) REFERENCES articulo(id)
);

CREATE TABLE EvidenceToLiteral (
	id INT NOT NULL AUTO_INCREMENT,
	evidence_id INT NOT NULL,
	literal_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (evidence_id) REFERENCES evidence(id),
	FOREIGN KEY (literal_id) REFERENCES literal(id)
);

CREATE TABLE EvidenceToNumeral (
	id INT NOT NULL AUTO_INCREMENT,
	evidence_id INT NOT NULL,
	numeral_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (evidence_id) REFERENCES evidence(id),
	FOREIGN KEY (numeral_id) REFERENCES numeral(id)
);

CREATE TABLE EvidenceToParagrafo (
	id INT NOT NULL AUTO_INCREMENT,
	evidence_id INT NOT NULL,
	paragrafo_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (evidence_id) REFERENCES evidence(id),
	FOREIGN KEY (paragrafo_id) REFERENCES paragrafo(id)
);

-- Procedures

DELIMITER //

-- User Procedures

CREATE PROCEDURE getUserList()
BEGIN
	SELECT * FROM user;
END //

CREATE PROCEDURE getUser(IN idVal VARCHAR(30))
BEGIN
	SELECT * FROM user WHERE id=idVal;
END //

CREATE PROCEDURE createUser(IN userVal VARCHAR(30), IN passwordVal VARCHAR(30))
BEGIN
	INSERT INTO user VALUES (NULL, userVal, passwordVal);
END //

CREATE PROCEDURE updateUser(IN idVal INT, IN userVal VARCHAR(30), IN passwordVal VARCHAR(30))
BEGIN
	UPDATE user SET user=userVal, password=passwordVal WHERE id=idVal;
END //

CREATE PROCEDURE deleteUser(IN idVal VARCHAR(30))
BEGIN
	DELETE FROM user WHERE id=idVal;
END //

CREATE PROCEDURE login(IN userVal VARCHAR(30), IN passwordVal VARCHAR(30))
BEGIN
	SELECT * FROM user WHERE user=userVal AND password=passwordVal;
END //

-- Evidence procedures

CREATE PROCEDURE getEvidenceList()
BEGIN
	SELECT * FROM evidence;
END //

CREATE PROCEDURE getEvidence(IN idVal VARCHAR(30))
BEGIN
	SELECT * FROM evidence WHERE id=idVal;
END //

CREATE PROCEDURE createEvidence(IN titleVal VARCHAR(100), IN descriptionVal VARCHAR(200), IN dirVal VARCHAR(200), IN tipeVal VARCHAR(30), IN latVal INT, IN lonVal INT)
BEGIN
	INSERT INTO evidence VALUES (NULL, titleVal, descriptionVal, dirVal, tipeVal, latVal, lonVal, NULL);
END //

CREATE PROCEDURE updateEvidence(IN idVal INT, IN titleVal VARCHAR(100), IN descriptionVal VARCHAR(200), IN dirVal VARCHAR(200), IN tipeVal VARCHAR(30), IN latVal INT, IN lonVal INT)
BEGIN
	UPDATE evidence SET title = titleVal, description = descriptionVal, dir = dirVal, tipe = tipeVal, lat = latVal, lon = lonVal WHERE id=idVal;
END //

CREATE PROCEDURE deleteEvidence(IN idVal VARCHAR(30))
BEGIN
	DELETE FROM evidence WHERE id=idVal;
END //

-- Author procedures

CREATE PROCEDURE getAuthorsList()
BEGIN
	SELECT * FROM author;
END //

CREATE PROCEDURE getAuthor(IN idVal VARCHAR(30))
BEGIN
	SELECT * FROM author WHERE id=idVal;
END //

CREATE PROCEDURE createAuthor(IN nameVal VARCHAR(100))
BEGIN
	INSERT INTO author VALUES (NULL, nameVal);
END //

CREATE PROCEDURE updateAuthor(IN idVal INT, IN nameVal VARCHAR(100))
BEGIN
	UPDATE author SET name = nameVal WHERE id=idVal;
END //

CREATE PROCEDURE deleteAuthor(IN idVal VARCHAR(30))
BEGIN
	DELETE FROM author WHERE id=idVal;
END //

DELIMITER ;

-- Insert Data

INSERT INTO user VALUES (NULL, 'admin', 'admin');
INSERT INTO evidence VALUES (NULL, 'Resolucion', '123', 'abc', 'def', 1, 2, NULL);
INSERT INTO author VALUES (NULL, 'author');