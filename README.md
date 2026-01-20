# Sistema de Stock y Productos – Proyecto Base de Datos

## Descripción general
Este proyecto modela un sistema simple de gestión de productos y stock, pensado para un negocio de venta de repuestos/accesorios.  
El foco está puesto en el **control automático de stock**, a partir de los movimientos de entrada y salida, y en un **modelo de datos normalizado**.

---

## Modelo de datos

### Tabla `categoria`
Representa las categorías posibles de los productos (ej.: fundas, auriculares, cargadores).

**Motivo del diseño:**  
Se modela como entidad independiente para:
- Evitar valores repetidos o inconsistentes.
- Facilitar filtros y selecciones desde una interfaz (listas desplegables).
- Permitir escalabilidad (agregar categorías sin modificar productos).

Campos principales:
- `id`
- `nombre`
- `activo`

---

### Tabla `producto`
Almacena los productos del negocio.

Campos principales:
- `id`
- `nombre`
- `id_categoria` (FK a `categoria`)
- `stock_minimo`
- `activo`

Cada producto pertenece a una única categoría.

---

### Tabla `movimiento_stock`
Registra todas las variaciones de stock.

Campos principales:
- `id`
- `id_producto` (FK a `producto`)
- `tipo` (`ENTRADA` o `SALIDA`)
- `cantidad`
- `fecha`

**Concepto clave:**  
El stock no se guarda como un valor fijo, sino que se **calcula dinámicamente** a partir de estos movimientos.

---

## Query de stock automático

La siguiente consulta calcula el **stock actual** de cada producto, teniendo en cuenta:
- Entradas (+cantidad)
- Salidas (−cantidad)

Además, identifica los productos cuyo stock es **menor o igual al stock mínimo**, permitiendo detectar faltantes.

