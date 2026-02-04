-- 1. Deuda acumulada de cada jugador:

SELECT 
    j.id,
    j.nombre,
    COALESCE(SUM(pp.deuda_generada), 0) AS deuda_total
FROM jugador j
LEFT JOIN participacion_partido pp 
    ON j.id = pp.jugador_id
WHERE j.activo = TRUE
GROUP BY j.id, j.nombre
ORDER BY deuda_total DESC;

-- 2. Historial de partidos de cada jugador:

SELECT 
    p.fecha,
    p.costo_por_jugador,
    pp.monto_pagado,
    pp.deuda_generada
FROM participacion_partido pp
JOIN partido p ON pp.partido_id = p.id
WHERE pp.jugador_id = 1
ORDER BY p.fecha DESC;

-- 3. Jugadores que participaron en un partido:

SELECT 
    j.nombre,
    pp.monto_pagado,
    pp.deuda_generada
FROM participacion_partido pp
JOIN jugador j ON pp.jugador_id = j.id
WHERE pp.partido_id = 1;

-- 4. Total recaudado en un partido:

SELECT 
    p.fecha,
    SUM(pp.monto_pagado) AS total_recaudado
FROM partido p
JOIN participacion_partido pp 
    ON p.id = pp.partido_id
WHERE p.id = 1
GROUP BY p.fecha;

-- 5. Total deuda generada en un partido:

SELECT 
    p.fecha,
    SUM(pp.deuda_generada) AS deuda_total
FROM partido p
JOIN participacion_partido pp 
    ON p.id = pp.partido_id
WHERE p.id = 1
GROUP BY p.fecha;

-- 6. Stock actual de productos:

SELECT 
    nombre,
    stock
FROM producto
WHERE activo = TRUE
ORDER BY nombre;

-- 7. Historial de compras de un jugador:

SELECT 
    v.fecha,
    v.total
FROM venta v
WHERE v.jugador_id = 1
ORDER BY v.fecha DESC;

-- 8. Detalle de productos comprados en una venta:

SELECT 
    p.nombre,
    dv.cantidad,
    dv.subtotal
FROM detalle_venta dv
JOIN producto p 
    ON dv.producto_id = p.id
WHERE dv.venta_id = 1;

-- 9. Total vendido por producto (reporte MUY útil):

SELECT 
    p.nombre,
    SUM(dv.cantidad) AS total_vendido
FROM detalle_venta dv
JOIN producto p ON dv.producto_id = p.id
GROUP BY p.nombre
ORDER BY total_vendido DESC;


-- 10. Ingresos totales por bebidas:

SELECT 
    SUM(total) AS ingresos_bebidas
FROM venta;

--11. Consulta PRO (Dashboard resumen general):

SELECT
    (SELECT COUNT(*) FROM jugador WHERE activo = TRUE) AS total_jugadores,

    (SELECT COALESCE(SUM(deuda_generada),0) 
     FROM participacion_partido) AS deuda_total,

    (SELECT COALESCE(SUM(total),0) 
     FROM venta) AS ingresos_bebidas;
