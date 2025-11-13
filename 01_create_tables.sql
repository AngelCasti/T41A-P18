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
----------------------------------------------------------------
--Ejercicios Recomendados
CREATE TABLE ciudades (
    id SERIAL PRIMARY KEY,
    nombre TEXT,
    ruta_id INT
);

INSERT INTO ciudades (nombre, ruta_id) VALUES
('Amsterdam', 3),
('Berlín', 4),
('Frankfurt', 1),
('Dortmund', 4),
('Munich', 1);

WITH RECURSIVE red_rutas AS (
    SELECT id, nombre, ruta_id FROM ciudades WHERE nombre = 'Amsterdam'
    UNION ALL
    SELECT c.id, c.nombre, c.ruta_id
    FROM ciudades c
    INNER JOIN red_rutas r ON c.ruta_id = r.id
)

SELECT * FROM red_rutas;

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre TEXT,
    intereses TEXT[]
);

INSERT INTO usuarios (nombre, intereses)
VALUES ('Ana', ARRAY['PostgreSQL', 'Grafos', 'NoSQL']);

SELECT nombre, intereses[1] AS primer_interes FROM usuarios;
