DROP TABLE vet_specialties;
DROP TABLE vets;
DROP TABLE specialties;
DROP TABLE pets;
DROP TABLE owners;
DROP TABLE types;
DROP TABLE visits;

CREATE TABLE vets (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30)
);
CREATE INDEX vets_last_name ON vets(last_name);

CREATE TABLE specialties (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(80)
);
CREATE INDEX specialties_name ON specialties(name);

CREATE TABLE vet_specialties (
  vet_id INT NOT NULL,
  specialty_id INT NOT NULL
);
ALTER TABLE vet_specialties ADD CONSTRAINT fk_vet_specialties_vets FOREIGN KEY (vet_id) REFERENCES vets(id);
ALTER TABLE vet_specialties ADD CONSTRAINT fk_vet_specialties_specialties FOREIGN KEY (specialty_id) REFERENCES specialties(id);

CREATE TABLE types (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(80)
);
CREATE INDEX types_name ON types(name);

CREATE TABLE owners (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  address VARCHAR(255),
  city VARCHAR(80),
  telephone VARCHAR(20),
  pets_count INT NOT NULL DEFAULT 0
);
CREATE INDEX owners_last_name ON owners(last_name);

CREATE TABLE pets (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30),
  birth_date DATE,
  type_id INT NOT NULL,
  owner_id INT NULL
);
ALTER TABLE pets ADD CONSTRAINT fk_pets_owners FOREIGN KEY (owner_id) REFERENCES owners(id);
ALTER TABLE pets ADD CONSTRAINT fk_pets_types FOREIGN KEY (type_id) REFERENCES types(id);
CREATE INDEX pets_name ON pets(name);

CREATE TABLE visits (
  id INT AUTO_INCREMENT PRIMARY KEY,
  pet_id INT NOT NULL,
  visit_date DATE,
  description VARCHAR(255)
);
ALTER TABLE visits ADD CONSTRAINT fk_visits_pets FOREIGN KEY (pet_id) REFERENCES pets(id);
CREATE INDEX visits_pet_id ON visits(pet_id);

INSERT INTO VETS VALUES(1,'James','Carter');
INSERT INTO VETS VALUES(2,'Helen','Leary');
INSERT INTO VETS VALUES(3,'Linda','Douglas');
INSERT INTO VETS VALUES(4,'Rafael','Ortega');
INSERT INTO VETS VALUES(5,'Henry','Stevens');
INSERT INTO VETS VALUES(6,'Sharon','Jenkins');
INSERT INTO SPECIALTIES VALUES(1,'radiology');
INSERT INTO SPECIALTIES VALUES(2,'surgery');
INSERT INTO SPECIALTIES VALUES(3,'dentistry');
INSERT INTO VET_SPECIALTIES VALUES(2,1);
INSERT INTO VET_SPECIALTIES VALUES(3,2);
INSERT INTO VET_SPECIALTIES VALUES(3,3);
INSERT INTO VET_SPECIALTIES VALUES(4,2);
INSERT INTO VET_SPECIALTIES VALUES(5,1);
INSERT INTO TYPES VALUES(1,'cat');
INSERT INTO TYPES VALUES(2,'dog');
INSERT INTO TYPES VALUES(3,'lizard');
INSERT INTO TYPES VALUES(4,'snake');
INSERT INTO TYPES VALUES(5,'bird');
INSERT INTO TYPES VALUES(6,'hamster');
INSERT INTO OWNERS VALUES(1,'George','Franklin','110 W. Liberty St.','Madison','6085551023', 1);
INSERT INTO OWNERS VALUES(2,'Betty','Davis','638 Cardinal Ave.','Sun Prairie','6085551749', 1);
INSERT INTO OWNERS VALUES(3,'Eduardo','Rodriquez','2693 Commerce St.','McFarland','6085558763', 2);
INSERT INTO OWNERS VALUES(4,'Harold','Davis','563 Friendly St.','Windsor','6085553198', 1);
INSERT INTO OWNERS VALUES(5,'Peter','McTavish','2387 S. Fair Way','Madison','6085552765', 1);
INSERT INTO OWNERS VALUES(6,'Jean','Coleman','105 N. Lake St.','Monona','6085552654', 2);
INSERT INTO OWNERS VALUES(7,'Jeff','Black','1450 Oak Blvd.','Monona','6085555387', 1);
INSERT INTO OWNERS VALUES(8,'Maria','Escobito','345 Maple St.','Madison','6085557683', 1);
INSERT INTO OWNERS VALUES(9,'David','Schroeder','2749 Blackhawk Trail','Madison','6085559435', 1);
INSERT INTO OWNERS VALUES(10,'Carlos','Estaban','2335 Independence La.','Waunakee','6085555487', 2);
INSERT INTO PETS VALUES(1,'Leo','2000-09-07',1,1);
INSERT INTO PETS VALUES(2,'Basil','2002-08-06',6,2);
INSERT INTO PETS VALUES(3,'Rosy','2001-04-17',2,3);
INSERT INTO PETS VALUES(4,'Jewel','2000-03-07',2,3);
INSERT INTO PETS VALUES(5,'Iggy','2000-11-30',3,4);
INSERT INTO PETS VALUES(6,'George','2000-01-20',4,5);
INSERT INTO PETS VALUES(7,'Samantha','1995-09-04',1,6);
INSERT INTO PETS VALUES(8,'Max','1995-09-04',1,6);
INSERT INTO PETS VALUES(9,'Lucky','1999-08-06',5,7);
INSERT INTO PETS VALUES(10,'Mulligan','1997-02-24',2,8);
INSERT INTO PETS VALUES(11,'Freddy','2000-03-09',5,9);
INSERT INTO PETS VALUES(12,'Lucky','2000-06-24',2,10);
INSERT INTO PETS VALUES(13,'Sly','2002-06-08',1,10);
INSERT INTO VISITS VALUES(1,7,'1996-03-04','rabies shot');
INSERT INTO VISITS VALUES(2,8,'1996-03-04','rabies shot');
INSERT INTO VISITS VALUES(3,8,'1996-06-04','neutered');
INSERT INTO VISITS VALUES(4,7,'1996-09-04','spayed');
