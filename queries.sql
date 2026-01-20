-- Muestra stock_actual, stock_minimo y diferencia
WITH stock AS (
  SELECT
    p.id,
    p.nombre,
    c.nombre AS categoria,
    p.stock_minimo,
    COALESCE(
      SUM(
        CASE
          WHEN ms.tipo = 'Entrada' THEN ms.cantidad
          WHEN ms.tipo = 'Salida' THEN -ms.cantidad
        END
      ), 0
    ) AS stock_actual
  FROM producto p
  JOIN categoria c ON c.id = p.id_categoria
  LEFT JOIN movimiento_stock ms ON ms.id_producto = p.id
  WHERE p.activo = TRUE
  GROUP BY
    p.id,
    p.nombre,
    c.nombre,
    p.stock_minimo
)
SELECT
  id,
  nombre,
  categoria,
  stock_minimo,
  stock_actual,
  stock_actual - stock_minimo AS diferencia
FROM stock
WHERE stock_actual <= stock_minimo
ORDER BY diferencia ASC;



