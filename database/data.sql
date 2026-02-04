BEGIN;

INSERT INTO jugador (nombre, telefono)
VALUES
('Carlos', '991123456'),
('Luis', '992654821'),
('Marco', '986978541');

INSERT INTO partido (fecha, costo_por_jugador, estado)
VALUES
('2026-02-01', 5.00, 'PENDIENTE');

INSERT INTO producto (nombre, precio, stock)
VALUES
('Gatorade', 5.00, 50),
('Cielo', 2.00, 100),
('Sporade', 3.50, 40);

INSERT INTO participacion_partido (partido_id, jugador_id, monto_pagado, deuda_generada)
VALUES
(1, 1, 5.00, 0),
(1, 2, 0, 5.00),
(1, 3, 5.00, 0);

INSERT INTO venta (fecha, jugador_id, total)
VALUES
('2026-02-01', 1, 5.00),
('2026-02-01', 2, 7.00),
('2026-02-01', 3, 8.50);

INSERT INTO detalle_venta (venta_id, producto_id, cantidad, subtotal)
VALUES
(1, 1, 1, 5.00),
(2, 1, 1, 5.00),
(2, 2, 1, 2.00),
(3, 1, 1, 5.00),
(3, 3, 1, 3.50);

COMMIT;