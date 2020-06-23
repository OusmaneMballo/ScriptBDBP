===========CONNEXION A LA BASE DE DONNEES=============
mysql -u root -p

===========CREATION DE LA BASE DE DONNEES=============

MariaDB [(none)]> CREATE DATABASE bpgroupe2;

===========CHAREGEMENT DE LA BASE DE DONNEES===========

MariaDB [(none)]> use bpgroupe2;

=================CREATION DES TABLES==================

MariaDB [bpgroupe2]> CREATE TABLE profil(
    -> id INT AUTO_INCREMENT,
    -> libelle VARCHAR (55),
    -> PRIMARY KEY(id));


MariaDB [bpgroupe2]> CREATE TABLE employe(
    -> id INT AUTO_INCREMENT,
    -> nom VARCHAR(30),
    -> prenom VARCHAR(30),
    -> telephone VARCHAR(15),
    -> adresse VARCHAR(55),
    -> email VARCHAR(30) DEFAULT NULL,
    -> profession VARCHAR(20),
    -> nci VARCHAR(20),
    -> login VARCHAR(20),
    -> password VARCHAR(20),
    -> PRIMARY KEY(id));


CREATE TABLE statut(
    -> id INT AUTO_INCREMENT,
    -> datestatut VARCHAR (15),
    -> datefin VARCHAR (15),
    -> profil_id INT,
    -> employe_id INT,
    -> PRIMARY KEY(id),
    -> FOREIGN KEY(profil_id) REFERENCES profil(id),
    -> FOREIGN KEY(employe_id) REFERENCES employe(id));

CREATE TABLE agence(
    -> id INT,
    -> nom VARCHAR(55),
    -> region VARCHAR(55),
    -> PRIMARY KEY(id));

CREATE TABLE affectation(
    -> id INT AUTO_INCREMENT,
    -> dateaffectation VARCHAR(15),
    -> datefin VARCHAR(15),
    -> employe_id INT,
    -> agence_id INT,
    -> PRIMARY KEY(id),
    -> FOREIGN KEY (employe_id) REFERENCES employe(id),
    -> FOREIGN KEY (agence_id) REFERENCES agence(id));

CREATE TABLE type_transaction(
    -> id INT,
    -> libelle VARCHAR(20),
    -> PRIMARY KEY(id));

CREATE TABLE type_frais(
    -> id INT,
    -> libelle VARCHAR(20),
    -> PRIMARY KEY(id));

CREATE TABLE type_compte(
    -> id INT,
    -> libelle VARCHAR(20),
    -> PRIMARY KEY(id));

CREATE TABLE type_client(
    -> id INT,
    -> libelle VARCHAR(20),
    -> PRIMARY KEY(id));

CREATE TABLE client_moral(
    -> id INT AUTO_INCREMENT,
    -> raison_social VARCHAR(20),
    -> nom VARCHAR(50),
    -> adresse VARCHAR(55),
    -> numidentf VARCHAR(55),
    -> telephone VARCHAR(15),
    -> email VARCHAR(30) DEFAULT NULL,
    -> login VARCHAR(30),
    -> password VARCHAR(30),
    -> PRIMARY KEY(id));

CREATE TABLE client_physique(
    -> id INT AUTO_INCREMENT,
    -> nom VARCHAR(55),
    -> prenom VARCHAR(55),
    -> telephone VARCHAR(14),
    -> salaire FLOAT,
    -> adresse VARCHAR(55),
    -> profession VARCHAR(20),
    -> login VARCHAR(20),
    -> password VARCHAR(20),
    -> email VARCHAR(30) DEFAULT NULL,
    -> nci VARCHAR(20),
    -> typeclt_id INT,
    -> cltmoral_id INT,
    -> PRIMARY KEY(id),
    -> FOREIGN KEY(typeclt_id) REFERENCES type_client(id),
    -> FOREIGN KEY(cltmoral_id) REFERENCES client_moral(id));

CREATE TABLE compte_client(
    -> id INT AUTO_INCREMENT,
    -> numeroCte VARCHAR(55),
    -> clerib VARCHAR(55),
    -> agence_id INT,
    -> solde DOUBLE,
    -> etat VARCHAR(10),
    -> cltphy_id INT,
    -> cltmoral_id INT,
    -> datecrea VARCHAR(14),
    -> dateferme VARCHAR(14),
    -> datefertempo VARCHAR(14),
    -> datereouv VARCHAR(14),
    -> PRIMARY KEY(id),
    -> FOREIGN KEY(agence_id) REFERENCES agence(id),
    -> FOREIGN KEY(cltphy_id) REFERENCES client_physique(id),
    -> FOREIGN KEY(cltmoral_id) REFERENCES client_moral(id));

CREATE TABLE frais_bancaire(
    -> id INT,
    -> fraisbanc DOUBLE,
    -> datefrais VARCHAR(15),
    -> typefrais_id INT,
    -> compteclient_id INT,
    -> PRIMARY KEY(id),
    -> FOREIGN KEY(compteclient_id) REFERENCES compte_client(id),
    -> FOREIGN KEY(typefrais_id) REFERENCES type_frais(id));

CREATE TABLE transaction(
    -> id INT AUTO_INCREMENT,
    -> montant_trans DOUBLE,
    -> typetrans_id INT,
    -> date_trans VARCHAR(15),
    -> employe_id INT,
    -> PRIMARY KEY(id),
    -> FOREIGN KEY(typetrans_id) REFERENCES type_transaction(id),
    -> FOREIGN KEY(employe_id) REFERENCES employe(id));


CREATE TABLE compttransaction(
    -> id int auto_increment primary key,
    -> compte_id int,
    -> transac_id int,
    -> foreign key(compte_id) references compte_client(id),
    -> foreign key (transac_id) references transaction(id), 
    -> datetransac varchar(15));

