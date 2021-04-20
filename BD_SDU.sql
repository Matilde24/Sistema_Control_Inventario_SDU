create database Sistema_Control_Inventario_SDU

USE Sistema_Control_Inventario_SDU;

   --Tabla Usuario
create table Usuarios
(ID_Usuario int identity(1,1) primary key not null,
Nombres varchar(50)not null,
usuario varchar (50),
Contraseña varchar(50)not null,
tipo_usuario varchar(50)not null,
)

--FACTURA_VENTA
CREATE TABLE FACTURA_VENTA
(
Id_Factura_venta NVARCHAR (20) PRIMARY KEY,
Fecha datetime,
Numero_Fcatura Nvarchar(15),
Id_cliente int,
Total decimal not null,
)

---DETALLE VENTA
create table DETALLE_VENTA
(
id_detalle_Venta nvarchar(20) PRIMARY KEY,
id_Factura_compra nvarchar (30),
Cantidad NVARCHAR (40),
ID_producto int identity (1,1),
Descripcion nvarchar (50),
Precio_Unitario nvarchar(15),
Total decimal not null,

constraint pk_DETALLE_VENTA_Factura_COMPRA FOREIGN KEY (id_Factura_compra) references Factura_COMPRA (Id_Factura_compra), 
)

--CRÉDITO 
CREATE TABLE CREDITO
(
Id_factura NVARCHAR (16) primary key,
Id_Factura_venta NVARCHAR (20),
Id_cliente int identity (1,1),
Monto NVARCHAR (30)
constraint pk_CREDITO_FACTURA_VENTA FOREIGN KEY (Id_Factura_venta) references FACTURA_VENTA (Id_Factura_venta),
constraint pk_CREDITO_CLIENTES FOREIGN KEY (Id_cliente) references CLIENTES (Id_cliente)
)

----Tabla Productos

CREATE TABLE PRODUCTOS
(
ID_producto int identity (1,1) PRIMARY KEY NOT NULL,
Id_Factura_venta NVARCHAR (20),
Id_cliente int,
ID_categoria  int,
id_Factura_compra nvarchar (30),
Nombre_producto NVARCHAR (35) NOT NULL,
Precio INT NOT NULL,
Cantidad NVARCHAR (20) NOT NULL,
Marca NVARCHAR (15) NOT NULL,
Color NVARCHAR (10) NOT NULL,
Fecha_Vencimiento nvarchar(20)
CONSTRAINT PK_PRODUCTOS_CATEGORIA FOREIGN KEY(ID_categoria) references CATEGORIA (ID_categoria),
CONSTRAINT PK_PRODUCTOS_FACTURA_VENTA FOREIGN KEY(Id_Factura_venta) references FACTURA_VENTA (Id_Factura_venta),
CONSTRAINT PK_PRODUCTOS_Factura_COMPRA FOREIGN KEY(id_Factura_compra) references Factura_COMPRA (id_Factura_compra)
)


--INVENTARIO
CREATE TABLE INVENTARIO
(
Id_inventario int identity (1,1) primary key NOT NULL,
Id_Factura_venta NVARCHAR (20),
Id_producto int,
constraint fk_inv_prod foreign key (Id_producto) references PRODUCTOS (Id_producto)
)

----Tabla Factura
CREATE TABLE FACTURA
(
Id_factura NVARCHAR (16)PRIMARY KEY,
Id_proveedor NVARCHAR (25),
Id_cliente int,
id_compra nvarchar (30),
Apellido_cliente NVARCHAR (20),
Producto NVARCHAR (100),
Marca NVARCHAR (100),
Cantidad NVARCHAR (40),
Precio int,
CONSTRAINT PK_FACTURA_CLIENTES FOREIGN KEY(Id_cliente) references CLIENTES (Id_cliente),
CONSTRAINT PK_FACTURA_PROVEEDORES FOREIGN KEY(Id_proveedor) references PROVEEDORES (Id_proveedor)
)

----Tabla Cliente
CREATE TABLE CLIENTES
(
Id_cliente int identity (1,1) PRIMARY KEY,
Nombre_cliente NVARCHAR (20),
Apellido_cliente NVARCHAR (20),
)

---Tabla FACTURA_COMPRA
 CREATE TABLE Factura_COMPRA
 (
 id_Factura_compra nvarchar (30) PRIMARY KEY,
 Id_proveedor NVARCHAR (25),
 Fecha datetime,
 Codigo_Servicio varchar(10),
 Id_factura NVARCHAR (16),
 ID_Usuario int,
 Nombre_cliente NVARCHAR (20),
 Nombre_producto varchar (25),
 cantidad nvarchar (25),
 Marca varchar (25),
 Direccion NVARCHAR (50),
 Precio int,
 Total decimal not null,
 Id_producto int,
 )


 ---Tabla PROVEEDORES
  create table PROVEEDORES
 (
Id_proveedor NVARCHAR (25)primary key,
Nombre_empresa varchar(50),
Direcion NVARCHAR (50),
Telefono varchar(50)not null,

 )


 ---Tabla Categoria

 create table CATEGORIA
 (
 ID_categoria  int primary key,
 Descripcion nvarchar (50)
 )

 ---Tabla servicio

  create table Servicios
  (
   Codigo_Servicio varchar(10) primary key,
   ID_categoria  int,
   Nombre_Servicio varchar(50),
   precio varchar(50),
   constraint fk_Servicios_CATEGORIA foreign key (ID_categoria) references CATEGORIA (ID_categoria)
    )

   ---Tabla Detalle-Servicio

  Create table Detalle_Servicio
 (
   ID_Detalle_Servicio int identity(0001,0001) primary key,
   Codigo_Servicio varchar(10),
   Fecha datetime,
  Constraint pk_Detalle_Servicio_fk_Servicios foreign key(Codigo_Servicio) references Servicios(Codigo_Servicio)
 )


  
