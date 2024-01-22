CREATE DATABASE LavaLava;

USE LavaLava;

CREATE TABLE Usuarios (
id INT primary key NOT NULL ,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
numero_telefonico VARCHAR(10) NOT NULL,
prendas VARCHAR(255) NOT NULL,
fecha_registro DATETIME NOT NULL,
ultima_actualizacion DATETIME NOT NULL,

);

CREATE TABLE Empleados (
id INT NOT NULL,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
documentos VARCHAR(50) NOT NULL,
direccion VARCHAR(255) NOT NULL,
puesto VARCHAR(50) NOT NULL,
fecha_contratacion DATE NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE Nominas (
id INT NOT NULL,
id_empleado INT NOT NULL,
nombre VARCHAR(50) NOT NULL,
sueldo DECIMAL(10,2) NOT NULL,
fecha_pago DATE NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_empleado) REFERENCES Empleados (id)
);

CREATE TABLE Productos (
id_producto INT NOT NULL ,
tipo VARCHAR(50) NOT NULL,
nombre VARCHAR(50) NOT NULL,
precio DECIMAL(10,2) NOT NULL,
PRIMARY KEY (id_producto)
);

CREATE TABLE Stock (
id_producto INT NOT NULL,
cantidad INT NOT NULL,
PRIMARY KEY (id_producto, cantidad),
FOREIGN KEY (id_producto) REFERENCES Productos (id_producto)
);

CREATE TABLE Servicios (
lavado nvarchar  NOT NULL,
planchado nvarchar NOT NULL,
precio_planchado DECIMAL(10,2) NOT NULL,
precio_lavado DECIMAL(10,2) NOT NULL,
domicilio nvarchar NOT NULL,
precio_domicilio DECIMAL(10,2) NOT NULL,
impuesto DECIMAL(10,2) NOT NULL,
total DECIMAL(10,2) NOT NULL,
PRIMARY KEY (lavado, planchado, domicilio)
);

UPDATE Usuarios
SET fecha_registro = GETDATE(),
ultima_actualizacion = GETDATE();

UPDATE Empleados
SET fecha_contratacion = GETDATE();

UPDATE Nominas
SET fecha_pago = GETDATE();

UPDATE Servicios
SET impuesto = 18,
total = precio_lavado + precio_planchado + precio_domicilio + impuesto;