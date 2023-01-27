
--use master;
--drop database system_scolarite;
-- si la supression de la BD persiste .. veuillez supprimer toutes les connexion entrantes/sortantes , puis réessayer ...

create table PERSONNEL
(
	id_personnel int identity primary key,
	nom_personnel text(25),
	prenom_personnel text(25),
	date_naissance_personnel date,
	photo_personnel image,
	email_personnel text(100),
	telephone_personnel text(15),
	sexe text(10) not null,
	adresse text(100),
	username text(20),
	mot_de_passe text(20)
);


create table ACTUALITE
(
	id_actualite int identity primary key,
	sujet text(25),
	description_actualite text(250),
             ajoute_par_personnel int not null,
	foreign key(ajoute_par_personnel) references PERSONNEL(id_personnel)
);

create table BRANCHE
(
	id_branche int identity primary key,
	libelle_branche text(50),
	prerequis_note float,
	description_branche text(250)
);

create table NIVEAU
(
	id_niveau int identity primary key,
	libelle_niveau text(50),
	description_niveau text(250)
);

create table GROUPE
(
	id_groupe int identity primary key,
	libelle_grp text(10),
             branche int not null,
             niveau int not null,
	foreign key(branche) references BRANCHE(id_branche),
	foreign key(niveau) references NIVEAU(id_niveau)
);


create table ETUDIANT
(
	code_massar text(20) primary key,
	nom text(25),
	prenom text(25),
	date_naissance date,
	date_inscription date default current_timestamp,
	email text(100),
	telephone text(15),
	a_deja_redouble bit,
	sexe text(10) not null,
	adresse text(100),
	username text(20),
	mot_de_passe text(20),
             groupe int not null,
	foreign key(groupe) references GROUPE(id_groupe)
);

create table PROFESSEUR
(
	Code_Pro_Nationnal text(20) primary key,
	Cin text(10) unique,
	Nom text(25),
	Prenom text(25),
	Date_Naissance date,
	Date_Commencement_Contrat date default current_timestamp,
	Type_Contrat text(10),
	Email text(100),
	Telephone text(15),
	sexe text(10) not null,
	Adresse text(100),
	Situation_Familliale text(20),
	username text(20),
	mot_de_passe text(20)
);

create table MATIERE
(
	id_matiere int identity primary key,
	LBL_Matiere text(25),
	Date_Ajout date default current_timestamp,
	Coeff int
);


create table ENSEIGNEMENT
(
              professeur text(20) not null,
              groupe int not null,
              matiere int not null,
              foreign key(professeur) references PROFESSEUR(Code_Pro_Nationnal),
              foreign key(groupe) references GROUPE(id_groupe),
              foreign key(matiere) references MATIERE(id_matiere),
              primary key(professeur, groupe, matiere)
);

create table NOTE
(
	Valeur_Note text(20),
	id_note int identity primary key,
	etudiant_ text(20),
    matiere int not null,
	foreign key(matiere) references MATIERE(id_matiere)
);

create table ALERT_CONTROLE
(
	id_alert int identity primary key,
	date_control date,
	heure_debut text(8),
	heure_fin text(8),
	statut text(10),
	description_control text(250),
             groupe int not null,
	foreign key(groupe) references GROUPE(id_groupe)
);