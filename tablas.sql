SELECT current_database();

CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE producto (
id SERIAL PRIMARY KEY,
nombre VARCHAR(45) NOT NULL UNIQUE,
categoria VARCHAR(45) NOT NULL,
precio_venta NUMERIC(10,2) NOT NULL CHECK (precio_venta >= 0),
stock_minimo INT NOT NULL,
activo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TYPE tipo_movimiento AS ENUM ('Entrada', 'Salida');

CREATE TABLE movimiento_stock (
id SERIAL PRIMARY KEY,
id_producto INT NOT NULL REFERENCES producto(id),
tipo tipo_movimiento NOT NULL,
cantidad INT NOT NULL CHECK (cantidad > 0),
fecha TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
motivo VARCHAR(45) NOT NULL
);

CREATE TABLE compra (
id SERIAL PRIMARY KEY,
fecha TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
total NUMERIC(10,2) NOT NULL CHECK (total >= 0)
);

CREATE TABLE venta (
id SERIAL PRIMARY KEY,
fecha TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
total NUMERIC(10,2) NOT NULL CHECK (total >= 0)
);

CREATE TABLE detalle_compra (
id SERIAL PRIMARY KEY,
id_compra INT NOT NULL REFERENCES compra(id),
id_producto INT NOT NULL REFERENCES producto(id),
cantidad INT NOT NULL CHECK (cantidad > 0),
precio_compra_unitario NUMERIC(10,2) NOT NULL CHECK (precio_compra_unitario >= 0)
);

CREATE TABLE detalle_venta (
id SERIAL PRIMARY KEY,
id_venta INT NOT NULL REFERENCES venta(id),
id_producto INT NOT NULL REFERENCES producto(id),
cantidad INT NOT NULL CHECK (cantidad > 0),
precio_venta_unitario NUMERIC(10,2) NOT NULL CHECK (precio_venta_unitario >= 0)
);