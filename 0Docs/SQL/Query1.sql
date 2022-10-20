CREATE DATABASE IF NOT EXISTS UNIkart_DB;
USE UNIkart_DB;

#Creamos la tabla de registro
CREATE TABLE IF NOT EXISTS registro(
	ID_Registro smallint 	NOT NULL,
    Nombres 	varchar(25)	NOT NULL,
    Apellidos 	varchar(25)	NOT NULL,
    FechaNac	datetime	NOT NULL,
    Email		varchar(50)	NOT NULL,
    FotoPerfil	varchar(200)NOT NULL,
    Username	varchar(25)	NOT NULL,
    Contrasenia	varchar(25)	NOT NULL,
    
    CONSTRAINT PK_ID_Registro
		PRIMARY KEY (ID_Registro)
);

CREATE TABLE IF NOT EXISTS registro(
	ID_Registro smallint 	NOT NULL,
    Nombres 	varchar(25)	NOT NULL,
    Apellidos 	varchar(25)	NOT NULL,
    FechaNac	datetime	NOT NULL,
    Email		varchar(50)	NOT NULL,
    FotoPerfil	varchar(200)NOT NULL,
    
    CONSTRAINT PK_ID_Registro
		PRIMARY KEY (ID_Registro)
);