CREATE DATABASE GestioDeProjectes;

USE GestioDeProjectes;

CREATE TABLE Usuaris (
    id_usuari INT AUTO_INCREMENT PRIMARY KEY,
    nom_usuari VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    contrasenya VARCHAR(255) NOT NULL,
    rol ENUM('Administrador', 'Col·laborador', 'Usuari') DEFAULT 'Usuari' NOT NULL
);

CREATE TABLE Projectes (
    id_projecte INT AUTO_INCREMENT PRIMARY KEY,
    nom_projecte VARCHAR(100) NOT NULL,
    descripcio TEXT,
    data_creacio DATETIME DEFAULT CURRENT_TIMESTAMP,
    creador_id INT,
    FOREIGN KEY (creador_id) REFERENCES Usuaris(id_usuari) ON DELETE
    SET
        NULL
);

CREATE TABLE Col · laboradors (
    id_col · laboracio INT AUTO_INCREMENT PRIMARY KEY,
    usuari_id INT NOT NULL,
    projecte_id INT NOT NULL,
    FOREIGN KEY (usuari_id) REFERENCES Usuaris(id_usuari) ON DELETE CASCADE,
    FOREIGN KEY (projecte_id) REFERENCES Projectes(id_projecte) ON DELETE CASCADE,
    UNIQUE (usuari_id, projecte_id)
);

CREATE TABLE Tasques (
    id_tasca INT AUTO_INCREMENT PRIMARY KEY,
    nom_tasca VARCHAR(100) NOT NULL,
    descripcio TEXT,
    estat ENUM('Pendent', 'En Progrés', 'Completada') DEFAULT 'Pendent',
    data_limit DATE,
    projecte_id INT NOT NULL,
    assignat_a INT,
    FOREIGN KEY (projecte_id) REFERENCES Projectes(id_projecte) ON DELETE CASCADE,
    FOREIGN KEY (assignat_a) REFERENCES Usuaris(id_usuari) ON DELETE
    SET
        NULL
);

CREATE TABLE UsuarisRols (
    id_usuar_rol INT AUTO_INCREMENT PRIMARY KEY,
    usuari_id INT NOT NULL,
    rol_id INT NOT NULL,
    FOREIGN KEY (usuari_id) REFERENCES Usuaris(id_usuari) ON DELETE CASCADE
);