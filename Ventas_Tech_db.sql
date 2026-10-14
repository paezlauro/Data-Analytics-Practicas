-- =============================================================================
-- PROYECTO INTEGRADOR: TECHSTORE
-- MÓDULO 3: CHECKPOINT - SCRIPT SQL DE INGENIERÍA DE DATOS
-- =============================================================================

/* Crear Base de Datos */

CREATE DATABASE Ventas_Tech_DB;

-- Activamos la Base de Datos
USE Ventas_Tech_DB;

-- -----------------------------------------------------------------------------
-- SECCIÓN 1: DROPTABLES
-- -----------------------------------------------------------------------------

-- Elimino Tablas si ya existen, en orden inverso a las dependencias, para no violar las foreign keys.
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

-- -----------------------------------------------------------------------------
-- SECCIÓN 2: CREATETABLES
-- -----------------------------------------------------------------------------

-- Tabla Categorias
CREATE TABLE Categorias(
	ID_Categoria INT PRIMARY KEY,
	Nombre_Categoria VARCHAR(50) NOT NULL,
	Descripcion VARCHAR(200),
	);

-- Tabla Clientes
CREATE TABLE Clientes(
	ID_Cliente INT PRIMARY KEY,
	Nombre VARCHAR(100) NOT NULL,
	Email VARCHAR(100) UNIQUE,
	Ciudad VARCHAR(50),
	Fecha_Registro DATE NOT NULL,
	);

-- Tabla Productos
CREATE TABLE Productos(
	ID_Producto INT PRIMARY KEY,
	Nombre_Producto VARCHAR(100) NOT NULL,
	ID_Categoria INT 
		FOREIGN KEY REFERENCES Categorias(ID_Categoria),
	Precio DECIMAL(10,2) NOT NULL,
	Stock INT DEFAULT 0,
	Activo BIT DEFAULT 1,
	);

-- Tabla Ventas
CREATE TABLE Ventas(
	ID_Venta INT PRIMARY KEY,
	ID_Cliente INT 
		FOREIGN KEY REFERENCES Clientes(ID_Cliente),
	ID_Producto INT
		FOREIGN KEY REFERENCES Productos(ID_Producto),
	Cantidad INT NOT NULL,
	Precio_Unitario DECIMAL(10,2) NOT NULL,
	Fecha_Venta DATE NOT NULL,
	);

-- -----------------------------------------------------------------------------
-- SECCIÓN 3: INSERTDATA
-- -----------------------------------------------------------------------------

-- Carga registros Categorias (4 Registros)
INSERT INTO categorias (id_categoria, nombre_categoria, descripcion) VALUES
  (1, 'Computación',    'Laptops, PCs y monitores'),
  (2, 'Accesorios',     'Periféricos y complementos'),
  (3, 'Audio',          'Auriculares y parlantes'),
  (4, 'Almacenamiento', 'Discos y memorias');

-- Carga registros Clientes (5 Registros)
INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro) VALUES
  (1, 'María López',  'maria@mail.com',  'Buenos Aires', '2024-01-05'),
  (2, 'Carlos Ruiz',  'carlos@mail.com', 'Córdoba',      '2024-01-10'),
  (3, 'Ana Gómez',    'ana@mail.com',    'Rosario',      '2024-02-01'),
  (4, 'Pedro Sanz',   'pedro@mail.com',  'Mendoza',      '2024-02-15'),
  (5, 'Laura Torres', 'laura@mail.com',  'Tucumán',      '2024-03-01');

-- Carga registros Productos (6 Registros)
INSERT INTO productos (id_producto, nombre_producto, id_categoria, precio, stock, activo) VALUES
  (1, 'Laptop Pro 15',      1, 1200.00, 15, 1),
  (2, 'Mouse Inalámbrico',  2,   28.00, 80, 1),
  (3, 'Monitor 4K 27',      1,  450.00, 12, 1),
  (4, 'Auriculares BT Pro', 3,  120.00, 35, 1),
  (5, 'SSD Externo 1TB',    4,  130.00, 18, 1),
  (6, 'Teclado Mecánico',   2,   95.00, 40, 1);

-- Carga registros Ventas (10 Registros)
INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES
  ( 1, 1, 1, 2, 1200.00, '2024-03-05'),
  ( 2, 2, 2, 5,   28.00, '2024-03-06'),
  ( 3, 3, 3, 1,  450.00, '2024-03-07'),
  ( 4, 1, 4, 2,  120.00, '2024-03-08'),
  ( 5, 4, 5, 3,  130.00, '2024-03-10'),
  ( 6, 2, 6, 4,   95.00, '2024-03-11'),
  ( 7, 5, 1, 1, 1200.00, '2024-03-12'),
  ( 8, 3, 2, 8,   28.00, '2024-03-13'),
  ( 9, 4, 4, 1,  120.00, '2024-03-14'),
  (10, 5, 3, 2,  450.00, '2024-03-15');

-- -----------------------------------------------------------------------------
-- SECCIÓN 4: VALIDACION
-- -----------------------------------------------------------------------------

-- Confirmacion de la carga de las tablas
SELECT * FROM categorias;   -- esperado: 4 filas
SELECT * FROM clientes;     -- esperado: 5 filas
SELECT * FROM productos;    -- esperado: 6 filas
SELECT * FROM ventas;       -- esperado: 10 filas
