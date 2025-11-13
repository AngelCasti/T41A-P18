--ARRAYS
CREATE TABLE productos(
  id SERIAL PRIMARY KEY,
  nombre TEXT,
  etiquetas TEXT[]
);

INSERT INTO productos (nombre, etiquetas) VALUES ('refrigerador', ARRAY['electrónicos', 'electrodoméstico', 'tecnología']), ('sillón', ARRAY['mueble', 'decoración', 'inmobiliario']), ('hamburguesa', ARRAY['comida', 'comida rápida', 'chatarra']);

SELECT * FROM productos WHERE 'tecnología' = ANY(etiquetas);
-------------------------------------------------------------
--CTE
CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre TEXT,
    jefe_id INT
);

INSERT INTO empleados (nombre, jefe_id) VALUES
('David', 1),
('Angel', 1),
('Jesús', 2),
('Jesús', 2),
('Cruz', 3);

WITH RECURSIVE red_jefes AS (
    SELECT id, nombre, jefe_id FROM empleados WHERE nombre = 'David'
    UNION ALL
    SELECT e.id, e.nombre, e.jefe_id
    FROM empleados e
    INNER JOIN red_jefes r ON e.jefe_id = r.id
)

SELECT * FROM red_jefes;
