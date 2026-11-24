DROP TABLE IF EXISTS ventas CASCADE;
DROP TABLE IF EXISTS productos CASCADE;
DROP TABLE IF EXISTS clientes CASCADE;

CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    edad INT CHECK (edad >= 18),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) CHECK (precio > 0),
    stock INT CHECK (stock >= 0)
);

CREATE TABLE ventas (
    venta_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT CHECK (cantidad > 0),
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_venta DECIMAL(10, 2) CHECK (total_venta > 0),
    CONSTRAINT fk_ventas_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id) ON DELETE CASCADE,
    CONSTRAINT fk_ventas_producto FOREIGN KEY (producto_id) REFERENCES productos(producto_id) ON DELETE CASCADE
);

BEGIN;

INSERT INTO clientes (nombre, apellido, email, edad) VALUES
('Carlos', 'Gómez', 'carlos.gomez@email.com', 28),
('María', 'Pérez', 'maria.perez@email.com', 34),
('Juan', 'Rodríguez', 'juan.rodriguez@email.com', 22),
('Ana', 'López', 'ana.lopez@email.com', 45),
('Lucía', 'Martínez', 'lucia.martinez@email.com', 30);

INSERT INTO productos (nombre_producto, categoria, precio, stock) VALUES
('Notebook Lenovo 14"', 'Tecnología', 850.00, 15),
('Mouse Inalámbrico Logitech', 'Tecnología', 25.50, 50),
('Auriculares Bluetooth', 'Tecnología', 45.00, 30),
('Cafetera Express', 'Hogar', 120.00, 10),
('Set de Sartenes Antiadherentes', 'Hogar', 65.00, 20);

INSERT INTO ventas (cliente_id, producto_id, cantidad, total_venta) VALUES
(1, 2, 2, 51.00),
(2, 1, 1, 850.00),
(3, 3, 1, 45.00),
(4, 4, 1, 120.00),
(5, 5, 2, 130.00);

COMMIT;

UPDATE productos
SET precio = precio * 1.10
WHERE categoria = 'Tecnología';

DELETE FROM ventas
WHERE venta_id = 5;