CREATE TABLE jugador (
	id BIGSERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	telefono VARCHAR(20),
	activo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE partido(
	id BIGSERIAL PRIMARY KEY,
	fecha DATE NOT NULL,
	costo_por_jugador NUMERIC(10,2) NOT NULL,
	estado VARCHAR(20) NOT NULL
);

CREATE TABLE producto(
	id BIGSERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	precio NUMERIC(10,2) NOT NULL,
	stock INTEGER NOT NULL,
	activo BOOLEAN NOT NULL DEFAULT TRUE,

	CONSTRAINT chk_stock_no_negativo
	CHECK (stock >= 0),
	CONSTRAINT chk_precio_no_negativo
	CHECK (precio >=0)
);

CREATE TABLE venta(
	id BIGSERIAL PRIMARY KEY,
	fecha DATE NOT NULL,
	jugador_id BIGINT,
	total NUMERIC(10,2) NOT NULL,

	CONSTRAINT fk_venta_jugador
		FOREIGN KEY (jugador_id) REFERENCES jugador(id)
);

CREATE TABLE participacion_partido(
	id BIGSERIAL PRIMARY KEY,
	partido_id BIGINT NOT NULL,
	jugador_id BIGINT NOT NULL,
	monto_pagado NUMERIC(10,2) NOT NULL DEFAULT 0,
	deuda_generada NUMERIC(10,2) NOT NULL DEFAULT 0,

	CONSTRAINT fk_participacion_partido
		FOREIGN KEY (partido_id) REFERENCES partido(id),

	CONSTRAINT fk_participacion_jugador
		FOREIGN KEY (jugador_id) REFERENCES jugador(id),

	CONSTRAINT unique_jugador_partido
		UNIQUE (jugador_id, partido_id)
);

CREATE TABLE detalle_venta(
	id BIGSERIAL PRIMARY KEY,
	venta_id BIGINT NOT NULL,
	producto_id BIGINT NOT NULL,
	cantidad INTEGER NOT NULL,
	subtotal NUMERIC(10,2)NOT NULL,

	CONSTRAINT fk_detalle_venta
		FOREIGN KEY (venta_id) REFERENCES venta(id),

	CONSTRAINT fk_detalle_producto
		FOREIGN KEY (producto_id) REFERENCES producto(id)
);

CREATE INDEX idx_participacion_jugador
ON participacion_partido(jugador_id);

CREATE INDEX idx_participacion_partido
ON participacion_partido(partido_id);

CREATE INDEX idx_venta_jugador
ON venta(jugador_id);

