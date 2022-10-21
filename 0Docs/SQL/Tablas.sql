CREATE DATABASE IF NOT EXISTS UNIkart_DB;
USE UNIkart_DB;

#Creamos la tabla de registro
CREATE TABLE IF NOT EXISTS Registro(
	ID_Registro smallint unsigned 	NOT NULL auto_increment,
    Nombres 	varchar(25)			NOT NULL,
    Apellidos 	varchar(25)			NOT NULL,
    FechaNac	datetime			NOT NULL,
    Email		varchar(50)			NOT NULL,
    FotoPerfil	varchar(300)		NOT NULL,
    Username	varchar(25)			NOT NULL,
    Contrasenia	varchar(25)			NOT NULL,
    ID_Tarjeta 	smallint unsigned 	NOT NULL,
    
    CONSTRAINT PK_ID_Registro
		PRIMARY KEY (ID_Registro)
);
alter table Registro
	add constraint PK_ID_Registro
		foreign key (ID_Tarjeta)
		references Tarjeta (ID_Tarjeta);
ALTER TABLE Registro ADD INDEX idx_nomRegistro (Nombres);
ALTER TABLE Registro MODIFY COLUMN Nombres 		varchar(25) comment 'Nombres del usuario';
ALTER TABLE Registro MODIFY COLUMN Apellidos 	varchar(25) comment 'Apellidos del usuario';
ALTER TABLE Registro MODIFY COLUMN FechaNac 	datetime 	comment 'Fecha de nacimiento del usuario';
ALTER TABLE Registro MODIFY COLUMN Email 		varchar(50) comment 'Correo electrónico del usuario';
ALTER TABLE Registro MODIFY COLUMN FotoPerfil 	varchar(300)comment 'ruta de la foto de perfil del usuario';
ALTER TABLE Registro MODIFY COLUMN Username 	varchar(25) comment 'Nombre de usuario del usuario';
ALTER TABLE Registro MODIFY COLUMN Contrasenia 	varchar(25) comment 'Contraseña del usuario';


#Creamos la tabla de Perfil
CREATE TABLE IF NOT EXISTS Perfil(
	ID_Perfil	smallint unsigned 	NOT NULL auto_increment,
    Rol 		varchar(25)			NOT NULL,
    Visibilidad bool				NOT NULL,
    Celular		int unsigned		NOT NULL,
    
    CONSTRAINT PK_ID_Perfil
		PRIMARY KEY (ID_Perfil)
);
alter table Perfil
ADD ID_Registro smallint unsigned 	NOT NULL,
ADD ID_Producto smallint unsigned 	NOT NULL,
ADD ID_Areas	smallint unsigned 	NOT NULL,
ADD ID_Menu		smallint unsigned 	NOT NULL,
	add constraint PK_ID_Perfil_Reg
		foreign key (ID_Registro)
		references Registro (ID_Registro),
	add constraint PK_ID_Perfil_Prod
		foreign key (ID_Producto)
		references Productos (ID_Producto),
	add constraint PK_ID_Perfil_Areas
		foreign key (ID_Areas)
		references Areas (ID_Areas),
	add constraint PK_ID_Perfil_Menu
		foreign key (ID_Menu)
		references Menu (ID_Menu);
ALTER TABLE Perfil ADD INDEX idx_rolPerfil (Rol);
ALTER TABLE Perfil MODIFY COLUMN Rol 			varchar(25) comment 'Rol del usuario';
ALTER TABLE Perfil MODIFY COLUMN Visibilidad 	bool 		comment 'Visibilidad del perfil del usuario (privado/público)';
ALTER TABLE Perfil MODIFY COLUMN Celular 		int 		comment 'Número telefónico del usuario';


#Creamos la tabla de Tarjeta
CREATE TABLE IF NOT EXISTS Tarjeta(
	ID_Tarjeta	smallint unsigned 	NOT NULL auto_increment,
    NombreTarj 	varchar(300)		NOT NULL,
    NumTarj		bigint unsigned		NOT NULL,
    FechaTarj	datetime			NOT NULL,
    CCVTarj		tinyint				NOT NULL,
    
    CONSTRAINT PK_ID_Tarjeta
		PRIMARY KEY (ID_Tarjeta)
);
ALTER TABLE Tarjeta ADD INDEX idx_NombreTarj(NombreTarj);


#Creamos la tabla de Areas
CREATE TABLE IF NOT EXISTS Areas(
	ID_Areas		smallint unsigned 	NOT NULL auto_increment,
    Nombre 			varchar(25)			NOT NULL,
    AreaAprobadaX	varchar(25)			NOT NULL,
    
    CONSTRAINT PK_ID_Areas
		PRIMARY KEY (ID_Areas)
);
alter table Areas
ADD ID_Negocio smallint unsigned 	NOT NULL,
  add constraint PK_ID_Areas_Neg
	foreign key (ID_Negocio)
	references Negocios (ID_Negocio);
ALTER TABLE Areas ADD INDEX idx_NombreAreas(Nombre);


#Creamos la tabla de Negocios
CREATE TABLE IF NOT EXISTS Negocios(
	ID_Negocio		smallint unsigned 	NOT NULL auto_increment,
    Nombre 			varchar(25)			NOT NULL,
    NegAprobadoX	varchar(25)			NOT NULL,
    
    CONSTRAINT PK_ID_Negocio
		PRIMARY KEY (ID_Negocio)
);
ALTER TABLE Negocios ADD INDEX idx_NombreNegocios(Nombre);


#Creamos la tabla de Productos
CREATE TABLE IF NOT EXISTS Productos(
	ID_Producto		smallint unsigned 	NOT NULL auto_increment,
    Negocio 		varchar(25)			NOT NULL,
    Nombre 			varchar(25)			NOT NULL,
    Valoracion		tinyint unsigned	NOT NULL,
    Precio			bool				NOT NULL,
    PrecioCant		smallint unsigned	NOT NULL,
    Disponibilidad	int unsigned		NOT NULL,
    Descripcion		varchar(100)		NOT NULL,
    
    CONSTRAINT PK_ID_Producto
		PRIMARY KEY (ID_Producto)
);
alter table Productos
ADD ID_Categoria smallint unsigned 	NOT NULL,
ADD ID_Comentario smallint unsigned NOT NULL,
	add constraint PK_ID_Prod_Cat
		foreign key (ID_Categoria)
		references Categorias (ID_Categoria),
	add constraint PK_ID_Prod_Com
		foreign key (ID_Comentario)
		references Comentarios (ID_Comentario);
ALTER TABLE Productos ADD INDEX idx_NombreProductos(Nombre);


#Creamos la tabla de Categorias
CREATE TABLE IF NOT EXISTS Categorias(
	ID_Categoria	smallint unsigned 	NOT NULL auto_increment,
    Categoria 		varchar(25)			NOT NULL,
    CatAprobadaX	tinyint				NOT NULL,
    
    CONSTRAINT PK_ID_Categoria
		PRIMARY KEY (ID_Categoria)
);
ALTER TABLE Categorias ADD INDEX idx_NombreCategoria(Categoria);


#Creamos la tabla de Comentarios
CREATE TABLE IF NOT EXISTS Comentarios(
	ID_Comentario	smallint unsigned 	NOT NULL auto_increment,
    Comentario 		varchar(300)		NOT NULL,
    Valoracion		tinyint	unsigned	NOT NULL,
    Fecha			datetime			NOT NULL,
    
    CONSTRAINT PK_ID_Comentario
		PRIMARY KEY (ID_Comentario)
);
ALTER TABLE Comentarios ADD INDEX idx_Comentarios(Comentario);


#Creamos la tabla de Menu
CREATE TABLE IF NOT EXISTS Menu(
	ID_Menu		smallint unsigned 	NOT NULL auto_increment,
    LinkMenu 	varchar(300)		NOT NULL,
    
    CONSTRAINT PK_ID_Menu
		PRIMARY KEY (ID_Menu)
);
alter table Menu
ADD ID_Producto smallint unsigned 	NOT NULL,
	add constraint PK_ID_Menu_Prod
		foreign key (ID_Producto)
		references Productos (ID_Producto);
ALTER TABLE Menu ADD INDEX idx_Menu(LinkMenu);


#Creamos la tabla de ProductosPlus
CREATE TABLE IF NOT EXISTS ProductosPlus(
	ID_ProdPlus		smallint unsigned 	NOT NULL auto_increment,
    Especificacion 	varchar(300)		NOT NULL,
    
    CONSTRAINT PK_ID_ProdPlus
		PRIMARY KEY (ID_ProdPlus)
);
alter table ProductosPlus
ADD ID_Producto smallint unsigned 	NOT NULL,
	add constraint PK_ID_ProdPlus_Prod
		foreign key (ID_Producto)
		references Productos (ID_Producto);
ALTER TABLE ProductosPlus ADD INDEX idx_ProductosPlus(Especificacion);


#Creamos la tabla de BarraNavegacion
CREATE TABLE IF NOT EXISTS BarraNavegacion(
	ID_Nav		smallint unsigned 	NOT NULL auto_increment,
    
    CONSTRAINT PK_ID_Nav
		PRIMARY KEY (ID_Nav)
);
alter table BarraNavegacion
ADD ID_ProdPlus smallint unsigned 	NOT NULL,
	add constraint PK_ID_NavBar_ProdPlus
		foreign key (ID_ProdPlus)
		references ProductosPlus (ID_ProdPlus);
ALTER TABLE BarraNavegacion ADD INDEX idx_BarraNav(ID_Nav);


#Creamos la tabla de ProdKart
CREATE TABLE IF NOT EXISTS ProdKart(
	ID_ProdKart		smallint unsigned 	NOT NULL auto_increment,
    
    CONSTRAINT PK_ID_ProdKart
		PRIMARY KEY (ID_ProdKart)
);
alter table ProdKart
ADD ID_Producto smallint unsigned 	NOT NULL,
	add constraint PK_ID_ProdKart_Prod
		foreign key (ID_Producto)
		references Productos (ID_Producto);
ALTER TABLE ProdKart ADD INDEX idx_ProdKart(ID_ProdKart);


#Creamos la tabla de ProdWL
CREATE TABLE IF NOT EXISTS ProdWL(
	ID_ProdWL		smallint unsigned 	NOT NULL auto_increment,
    
    CONSTRAINT PK_ID_ProdWL
		PRIMARY KEY (ID_ProdWL)
);
alter table ProdWL
ADD ID_Producto smallint unsigned 	NOT NULL,
	add constraint PK_ID_ProdWL_Prod
		foreign key (ID_Producto)
		references Productos (ID_Producto);
ALTER TABLE ProdWL ADD INDEX idx_ProdWL(ID_ProdWL);


#Creamos la tabla de OrdenCompra
CREATE TABLE IF NOT EXISTS OrdenCompra(
	ID_Nota			smallint unsigned 	NOT NULL auto_increment,
    CostoProd 		int unsigned 		NOT NULL,
    Propina 		int unsigned 		NOT NULL,
    TarifaServicio 	int unsigned 		NOT NULL,
    Total 			int unsigned 		NOT NULL,
    CatPago 		varchar(300)		NOT NULL,
    Codigo 			varchar(30)			NOT NULL,
    
    CONSTRAINT PK_ID_Nota
		PRIMARY KEY (ID_Nota)
);
alter table OrdenCompra
ADD ID_Tarjeta smallint unsigned 	NOT NULL,
ADD ID_Carrito smallint unsigned 	NOT NULL,
	add constraint PK_ID_OrdC_Tarj
		foreign key (ID_Tarjeta)
		references Tarjeta (ID_Tarjeta),
	add constraint PK_ID_OrdC_Kart
		foreign key (ID_Carrito)
		references Carrito (ID_Carrito);
ALTER TABLE OrdenCompra ADD INDEX idx_TotalNota(Total);


#Creamos la tabla de Carrito
CREATE TABLE IF NOT EXISTS Carrito(
	ID_Carrito		smallint unsigned 	NOT NULL auto_increment,
    Cantidad 		tinyint unsigned	NOT NULL,
    FechaKart 		datetime			NOT NULL,
    
    CONSTRAINT PK_ID_Carrito
		PRIMARY KEY (ID_Carrito)
);
alter table Carrito
ADD ID_ProdKart smallint unsigned 	NOT NULL,
	add constraint FK_ID_Carrito_Prod
		foreign key (ID_ProdKart)
		references ProdKart (ID_ProdKart);
ALTER TABLE Carrito ADD INDEX idx_TotalCarrito(Cantidad);


#Creamos la tabla de Wishlist
CREATE TABLE IF NOT EXISTS Wishlist(
	ID_Wishlist	smallint unsigned 	NOT NULL auto_increment,
    Imagen 		varchar(300)		NOT NULL,
    Nombre 		varchar(25)			NOT NULL,
    Privacidad 	bool 				NOT NULL,
    Descripcion varchar(100)		NOT NULL,
    
    CONSTRAINT PK_ID_Wishlist
		PRIMARY KEY (ID_Wishlist)
);
alter table Wishlist
ADD ID_ProdWL smallint unsigned 	NOT NULL,
	add constraint FK_ID_Wishlist_Prod
		foreign key (ID_ProdWL)
		references ProdWL (ID_ProdWL);
ALTER TABLE Wishlist ADD INDEX idx_NameWishlist(Nombre);


#Creamos la tabla de Compra
CREATE TABLE IF NOT EXISTS Compra(
	ID_Compra		smallint unsigned 	NOT NULL auto_increment,
    LugarEntrega 	varchar(100)		NOT NULL,
    NombreRepart 	varchar(25)			NOT NULL,
    NombreCliente 	varchar(25)			NOT NULL,
    NombreVend 		varchar(25)			NOT NULL,
    
    CONSTRAINT PK_ID_Compra
		PRIMARY KEY (ID_Compra)
);
alter table Compra
ADD ID_Carrito 		smallint unsigned 	NOT NULL,
ADD ID_Nota 		smallint unsigned 	NOT NULL,
ADD ID_HistPed 		smallint unsigned 	NOT NULL,
ADD ID_HistVentas 	smallint unsigned 	NOT NULL,
ADD ID_Chat 		smallint unsigned 	NOT NULL,
	add constraint PK_ID_Compra_Kart
		foreign key (ID_Carrito)
		references Carrito (ID_Carrito),
	add constraint PK_ID_Compra_Nota
		foreign key (ID_Nota)
		references OrdenCompra (ID_Nota),
	add constraint PK_ID_Compra_HPed
		foreign key (ID_HistPed)
		references HistPedidos (ID_HistPed),
	add constraint PK_ID_Compra_HVen
		foreign key (ID_HistVentas)
		references HistVentas (ID_HistVentas),
	add constraint PK_ID_Compra_Chat
		foreign key (ID_Chat)
		references Chat (ID_Chat);
ALTER TABLE Compra ADD INDEX idx_LugarCompra(LugarEntrega);


#Creamos la tabla de HistPedidos
CREATE TABLE IF NOT EXISTS HistPedidos(
	ID_HistPed	smallint unsigned 	NOT NULL auto_increment,
    FechaNom 	date				NOT NULL,
    Hora 		time				NOT NULL,
    
    CONSTRAINT PK_ID_HistPed
		PRIMARY KEY (ID_HistPed)
);
alter table HistPedidos
ADD ID_Nota 	smallint unsigned 	NOT NULL,
ADD ID_Compra 	smallint unsigned 	NOT NULL,
	add constraint PK_ID_HPed_Nota
		foreign key (ID_Nota)
		references OrdenCompra (ID_Nota),
	add constraint PK_ID_HPed_Compra
		foreign key (ID_Compra)
		references Compra (ID_Compra);
ALTER TABLE HistPedidos ADD INDEX idx_FechaPed(FechaNom);


#Creamos la tabla de HistVentas
CREATE TABLE IF NOT EXISTS HistVentas(
	ID_HistVentas	smallint unsigned 	NOT NULL auto_increment,
    FechaNom 		date				NOT NULL,
    Hora 			time				NOT NULL,
    
    CONSTRAINT PK_ID_HistVentas
		PRIMARY KEY (ID_HistVentas)
);
ALTER TABLE HistVentas ADD INDEX idx_FechaVen(FechaNom);


#Creamos la tabla de VentasResumen
CREATE TABLE IF NOT EXISTS VentasResumen(
	ID_ResumenVentas	smallint unsigned 	NOT NULL auto_increment,
    FreqLugares 		varchar(100)		NOT NULL,
    FreqRepartidores 	varchar(25)			NOT NULL,
    FreqCategorias 		varchar(25)			NOT NULL,
    VentasTotalesNum 	int unsigned 		NOT NULL,
    VentasTotales 		int unsigned 		NOT NULL,
    
    CONSTRAINT PK_ID_ResumenVentas
		PRIMARY KEY (ID_ResumenVentas)
);
alter table VentasResumen
ADD ID_HistVentas 	smallint unsigned 	NOT NULL,
ADD ID_Compra 	smallint unsigned 	NOT NULL,
	add constraint PK_ID_VenR_HVen
		foreign key (ID_HistVentas)
		references HistVentas (ID_HistVentas),
	add constraint PK_ID_VenR_Compra
		foreign key (ID_Compra)
		references Compra (ID_Compra);
ALTER TABLE VentasResumen ADD INDEX idx_TotalVentas(VentasTotales);


#Creamos la tabla de Chat
CREATE TABLE IF NOT EXISTS Chat(
	ID_Chat		smallint unsigned 	NOT NULL auto_increment,
    ImgLft 		varchar(300)		NOT NULL,
    NombreLft 	varchar(25)			NOT NULL,
    MensajesLft varchar(300)		NOT NULL,
    RolLft 		varchar(25)			NOT NULL,
    ImgRgt 		varchar(300)		NOT NULL,
    NombreRgt	varchar(25)			NOT NULL,
    MensajesRgt varchar(300)		NOT NULL,
    RolRgt		varchar(25)			NOT NULL,
    Tiempo		time				NOT NULL,
    Actividad	bool				NOT NULL,
    
    CONSTRAINT PK_ID_Chat
		PRIMARY KEY (ID_Chat)
);
ALTER TABLE Chat ADD INDEX idx_Chat(NombreLft);