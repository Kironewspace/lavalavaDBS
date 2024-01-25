

CREATE DATABASE LavaLava;

USE LavaLava;

CREATE TABLE Usuarios (
id INT identity,
nombre NVARCHAR(50) NOT NULL,
apellido NVARCHAR(50) NOT NULL,
numero_telefonico NVARCHAR(50) NOT NULL,
prendas NVARCHAR(50) NOT NULL,
fecha_registro DATE NOT NULL,
ultima_actualizacion DATE NOT NULL,
primary key(id)
);



CREATE TABLE Empleados (
id_empleados INT identity NOT NULL,
nombre NVARCHAR(50) NOT NULL,
apellido NVARCHAR(50) NOT NULL,
documentos NVARCHAR(50) NOT NULL,
direccion NVARCHAR(75) NOT NULL,
puesto NVARCHAR(50) NOT NULL,
fecha_contratacion DATE NOT NULL,
PRIMARY KEY (id_empleados)
);

CREATE TABLE Nominas (
id INT IDENTITY,
id_empleado INT,
nombre NVARCHAR(50) NOT NULL,
sueldo DECIMAL(10,2) NOT NULL,
fecha_pago DATE NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_empleado) REFERENCES Empleados (id_empleados)
);







CREATE TABLE Productos (
id_producto INT NOT NULL ,
tipo NVARCHAR(50) NOT NULL,
nombre NVARCHAR(50) NOT NULL,
precio DECIMAL(10,2) NOT NULL,
PRIMARY KEY (id_producto)
);

create table factura(
id_servicio int,
id_cliente_atendido int,
id_empleado_atendedor int,
id_factura int identity,
nombre_empleado_atendedor NVARCHAR(50),
nombre_cliente_atendido NVARCHAR(50),
fecha_atendido Date,
id_producto_utilizado int,
producto_utilizado NVARCHAR(25),
foreign key (id_servicio) references Usuarios (id),
foreign key (id_producto_utilizado) references Productos (id_producto),
foreign key (id_cliente_atendido) references Usuarios (id),
foreign key (id_empleado_atendedor) references Empleados (id_empleados)
);

CREATE TABLE Servicios (
id_servicio int identity,
lavado nvarchar NOT NULL,
planchado nvarchar NOT NULL,
precio_planchado DECIMAL(10,2) NOT NULL,
precio_lavado DECIMAL(10,2) NOT NULL,
domicilio nvarchar NOT NULL,
precio_domicilio DECIMAL(10,2) NOT NULL,
impuesto DECIMAL(10,2) NOT NULL,
total DECIMAL(10,2) NOT NULL,

PRIMARY KEY (lavado, planchado, domicilio, id_servicio),
foreign key (id_servicio) references Usuarios (id)
);


UPDATE Nominas
SET fecha_pago = GETDATE();

UPDATE Usuarios
SET fecha_registro = GETDATE(),
ultima_actualizacion = GETDATE();

UPDATE Empleados
SET fecha_contratacion = GETDATE();

UPDATE Servicios
SET impuesto = 18,
total = precio_lavado + precio_planchado + precio_domicilio + impuesto;

UPDATE factura
SET producto_utilizado = (
SELECT nombre
FROM Productos
WHERE id_producto = factura.id_producto_utilizado
),
id_cliente_atendido = (
SELECT id
FROM Usuarios
WHERE id = factura.id_cliente_atendido
),
id_empleado_atendedor = (
SELECT id_empleados
FROM Empleados
WHERE id_empleados = factura.id_empleado_atendedor
),
nombre_cliente_atendido = (
SELECT nombre
FROM Usuarios
WHERE id = factura.id_cliente_atendido
),
nombre_empleado_atendedor = (
SELECT nombre
FROM Empleados
WHERE id_empleados = factura.id_empleado_atendedor
);

insert into Usuarios (nombre, apellido, numero_telefonico, prendas, ultima_actualizacion, fecha_registro)
values ('elpepe','luffy','809-232-3232','Poloche', GETDATE(),  GETDATE());
