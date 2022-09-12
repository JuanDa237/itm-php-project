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
	user VARCHAR(100) NOT NULL,
	password VARCHAR(100) NOT NULL,
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