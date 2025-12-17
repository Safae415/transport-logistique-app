CREATE DATABASE IF NOT EXISTS Transport_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;


USE Transport_db;

CREATE TABLE users (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(100),
  prenom VARCHAR(100),
  email VARCHAR(150) UNIQUE,
  password VARCHAR(255),
  telephone VARCHAR(20),
  role ENUM('CLIENT','EMPLOYE','ADMIN'),
  active BOOLEAN,
  created_at DATETIME
);
CREATE TABLE clients (
  id BIGINT PRIMARY KEY,
  adresse VARCHAR(255),
  ville VARCHAR(100),
  pays VARCHAR(100),
  entreprise VARCHAR(150),
  ice VARCHAR(50),
  FOREIGN KEY (id) REFERENCES users(id)
);
CREATE TABLE employes (
  id BIGINT PRIMARY KEY,
  matricule VARCHAR(50),
  poste VARCHAR(100),
  salaire DOUBLE,
  FOREIGN KEY (id) REFERENCES users(id)
);
CREATE TABLE vehicules (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  immatriculation VARCHAR(50),
  type VARCHAR(100),
  capacite_poids DOUBLE,
  capacite_volume DOUBLE,
  etat VARCHAR(50)
);
CREATE TABLE transports (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  reference VARCHAR(50),
  date_demande DATE,
  date_depart DATE,
  date_arrivee DATE,
  origine VARCHAR(150),
  destination VARCHAR(150),
  distance_km DOUBLE,
  statut VARCHAR(50),
  client_id BIGINT,
  employe_id BIGINT,
  vehicule_id BIGINT,
  FOREIGN KEY (client_id) REFERENCES clients(id),
  FOREIGN KEY (employe_id) REFERENCES employes(id),
  FOREIGN KEY (vehicule_id) REFERENCES vehicules(id)
);
CREATE TABLE marchandises (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  type VARCHAR(100),
  description TEXT,
  poids DOUBLE,
  volume DOUBLE,
  valeur_declaree DOUBLE,
  transport_id BIGINT,
  FOREIGN KEY (transport_id) REFERENCES transports(id)
);
CREATE TABLE factures (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  numero VARCHAR(50),
  date_facture DATE,
  montant_ht DOUBLE,
  tva DOUBLE,
  montant_ttc DOUBLE,
  statut VARCHAR(50),
  transport_id BIGINT,
  FOREIGN KEY (transport_id) REFERENCES transports(id)
);
CREATE TABLE paiements (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  reference VARCHAR(50),
  date_paiement DATE,
  montant DOUBLE,
  mode_paiement VARCHAR(50),
  statut VARCHAR(50),
  facture_id BIGINT,
  FOREIGN KEY (facture_id) REFERENCES factures(id)
);
