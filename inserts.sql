SELECT current_database();

INSERT INTO categoria (nombre)
VALUES
('Fundas'),
('Accesorios');

INSERT INTO producto (nombre, id_categoria, precio_venta, stock_minimo, activo)
VALUES
('Funda iPhone 14', 1, 1500, 5, TRUE),
('Cargador iPhone', 2, 2000, 10, TRUE),
('Auriculares iPhone', 2, 8000, 3, TRUE),
('Funda iPhone 13', 1, 1200, 4, TRUE),
('Protector pantalla iPhone', 2, 1000, 6, TRUE),
('Cable Lightning', 2, 500, 8, TRUE),
('Base cargador inalámbrica', 2, 4500, 2, TRUE),
('Funda iPhone 12', 1, 900, 3, TRUE),
('Soporte auto', 2, 2500, 2, TRUE),
('Powerbank 10000mAh', 2, 5500, 3, TRUE);

-- Entradas
INSERT INTO movimiento_stock (id_producto, tipo, cantidad, fecha, motivo)
VALUES
(1, 'Entrada', 10, '2026-01-01 09:00', 'Compra proveedor'),
(2, 'Entrada', 15, '2026-01-02 10:00', 'Compra proveedor'),
(3, 'Entrada', 5, '2026-01-03 11:00', 'Compra proveedor'),
(4, 'Entrada', 7, '2026-01-04 12:00', 'Compra proveedor'),
(5, 'Entrada', 12, '2026-01-05 13:00', 'Compra proveedor'),
(6, 'Entrada', 20, '2026-01-06 14:00', 'Compra proveedor'),
(7, 'Entrada', 3, '2026-01-07 15:00', 'Compra proveedor'),
(8, 'Entrada', 8, '2026-01-08 16:00', 'Compra proveedor'),
(9, 'Entrada', 5, '2026-01-09 17:00', 'Compra proveedor'),
(10, 'Entrada', 7, '2026-01-10 18:00', 'Compra proveedor');

-- Salidas
INSERT INTO movimiento_stock (id_producto, tipo, cantidad, fecha, motivo)
VALUES
(1, 'Salida', 4, '2026-01-11 10:00', 'Venta'),
(2, 'Salida', 7, '2026-01-12 11:00', 'Venta'),
(3, 'Salida', 2, '2026-01-13 12:00', 'Venta'),
(1, 'Salida', 3, '2026-01-14 13:00', 'Venta'),
(4, 'Salida', 1, '2026-01-15 14:00', 'Venta'),
(5, 'Salida', 5, '2026-01-16 15:00', 'Venta'),
(6, 'Salida', 8, '2026-01-17 16:00', 'Venta'),
(7, 'Salida', 1, '2026-01-18 17:00', 'Venta'),
(9, 'Salida', 2, '2026-01-19 18:00', 'Venta'),
(10, 'Salida', 3, '2026-01-20 19:00', 'Venta');

INSERT INTO compra (fecha, total)
VALUES
('2026-01-01 09:00', 15000),
('2026-01-02 10:00', 30000),
('2026-01-03 11:00', 40000);

INSERT INTO detalle_compra (id_compra, id_producto, cantidad, precio_compra_unitario)
VALUES
(1, 1, 10, 1200),
(1, 2, 15, 1800),
(2, 3, 5, 6000),
(2, 4, 7, 1000),
(3, 5, 12, 800),
(3, 6, 20, 400);

INSERT INTO venta (fecha, total)
VALUES
('2026-01-11 10:00', 9000),
('2026-01-12 11:00', 14000),
('2026-01-13 12:00', 16000);

INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_venta_unitario)
VALUES
(1, 1, 4, 1500),
(1, 2, 7, 2000),
(2, 3, 2, 8000),
(2, 1, 3, 1500),
(3, 4, 1, 1200),
(3, 5, 5, 1000);

