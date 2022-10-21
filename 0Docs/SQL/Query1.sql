CREATE DATABASE IF NOT EXISTS UNIkart_DB;
USE UNIkart_DB;

#Creamos la tabla de registro
CREATE TABLE IF NOT EXISTS Registro(
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

CREATE TABLE IF NOT EXISTS Perfil(
	ID_Perfil	smallint 	NOT NULL,
    Rol 		varchar(25)	NOT NULL,
    Visibilidad bool		NOT NULL,
    Celular		numeric		NOT NULL,
    
    CONSTRAINT PK_ID_Perfil
		PRIMARY KEY (ID_Perfil)
        
	/*CONSTRAINT FK_DepartamentoEmp	--nombre
		FOREIGN KEY (DepartamentoEmp)			//campo de llave foránea
		REFERENCES Departamento(DepNúmero),	 //tabla(campo de llave primaria)
	*/
);

CREATE TABLE IF NOT EXISTS Tarjeta(
	ID_Tarjeta	smallint 	NOT NULL,
    NombreTarj 	varchar(300)NOT NULL,
    NumeroTarj	int			NOT NULL,
    FechaTarj	datetime	NOT NULL,
    CCVTarj		tinyint		NOT NULL,
    
    CONSTRAINT PK_ID_Tarjeta
		PRIMARY KEY (ID_Tarjeta)
);

CREATE TABLE IF NOT EXISTS Areas(
	ID_Areas	smallint 	NOT NULL,
    Nombre 		varchar(25)	NOT NULL,
    AprobadoX	varchar(25)	NOT NULL,
    
    CONSTRAINT PK_ID_Areas
		PRIMARY KEY (ID_Areas)
);

CREATE TABLE IF NOT EXISTS Categorias(
	ID_Categorias	smallint 	NOT NULL,
    Nombre 			varchar(25)	NOT NULL,
    AprobadoX		varchar(25)	NOT NULL,
    
    CONSTRAINT PK_ID_Categorias
		PRIMARY KEY (ID_Categorias)
);

CREATE TABLE IF NOT EXISTS Productos(
	ID_Productos	smallint 	NOT NULL,
    Nombre 			varchar(25)	NOT NULL,
    Valoracion		tinyint		NOT NULL,
    Precio			bool		NOT NULL,
    PrecioCant		int			NOT NULL,
    Categorias		varchar(25)	NOT NULL,
    Disponibilidad	int			NOT NULL,
    Descripcion		varchar(100)NOT NULL,
    
    CONSTRAINT PK_ID_Productos
		PRIMARY KEY (ID_Productos)
);

CREATE TABLE IF NOT EXISTS Comentarios(
	ID_Comentario	smallint 	NOT NULL,
    Comentario 		varchar(300)NOT NULL,
    Valoracion		tinyint		NOT NULL,
    Fecha			datetime	NOT NULL,
    
    CONSTRAINT PK_ID_Comentario
		PRIMARY KEY (ID_Comentario)
);

CREATE TABLE IF NOT EXISTS Menu(
	ID_Menu		smallint 	NOT NULL,
    Link 		varchar(300)NOT NULL,
    
    CONSTRAINT PK_ID_Menu
		PRIMARY KEY (ID_Menu)
);