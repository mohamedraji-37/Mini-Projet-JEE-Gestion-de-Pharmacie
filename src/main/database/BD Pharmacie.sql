CREATE TABLE admin (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE commande (
    id_commande INT PRIMARY KEY AUTO_INCREMENT,
    date_commande DATE NOT NULL,
    id_client INT NOT NULL,
    total DECIMAL(10,2),

  
    FOREIGN KEY (id_client)
    REFERENCES client(id)
    
);
CREATE TABLE ligne_Commande (
    id_ligne INT PRIMARY KEY AUTO_INCREMENT,
    id_commande INT NOT NULL,
    id_medicament INT NOT NULL,
    quantite INT NOT NULL,
    prix_unitaire DECIMAL(10,2) NOT NULL,

   
    FOREIGN KEY (id_commande)
    REFERENCES Commande(id_commande),
 

    
    FOREIGN KEY (id_medicament)
   REFERENCES medicament(id)
);
CREATE TABLE medicament (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    description TEXT,
    prix DOUBLE NOT NULL,
    quantite INT NOT NULL,
    date_expiration DATE,
    image VARCHAR (200)
    
);
CREATE TABLE admin (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
);
CREATE TABLE client (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    telephone VARCHAR(20),
    email VARCHAR(100),
    password VARCHAR(255) NOT NULL
);
