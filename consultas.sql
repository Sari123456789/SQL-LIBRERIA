-- OPERACIONES BÁSICAS
-- Ver los empleados que trabajan en el centro de estética
SELECT * FROM Empleados; 

--  Consultar empleados en un cargo específico y ordenar alfabéticamente
SELECT 
NOMBRE_EMPLEADO AS NOMBRE , CARGO, TELEFONO_EMPLEADO AS TLFN
FROM Empleados
WHERE CARGO = 'Técnico de Cabina'
ORDER BY NOMBRE_EMPLEADO ASC;

-- Buscar empleados con un nombre que contenga "Ana" en cualquier parte
SELECT * FROM Empleados
WHERE NOMBRE_EMPLEADO LIKE '%Ana%';

-- Consultar tabla clientes
SELECT * FROM Clientes;

-- Buscar clientes cuyo nombre contenga "Maria"
SELECT * FROM Clientes
WHERE NOMBRE_CLIENTE like 'Maria%';

-- Consultar clientes que se registraron después de una fecha específica  y ordenamos ascendente
SELECT * FROM Clientes
WHERE FECHA_REGISTRO between '2023-02-14' AND '2024-02-14'
ORDER BY FECHA_REGISTRO ASC;

 -- Consultar clientes con un teléfono que empiece con un código específico (SI QUEREMOS QUE EMPIEZE POR 'X%', QUE ACABE POR '%X' 
 -- Y QUE CONTENGA '%X%').
 SELECT NOMBRE_CLIENTE AS Nombre,
 TELEFONO_CLIENTE AS Tlfn
 FROM Clientes
 WHERE TELEFONO_CLIENTE LIKE '%67';
 
 --  Buscar tratamientos cuyo precio esté entre 50 y 200
 SELECT * FROM Tratamientos
 WHERE precio > 50 AND precio < 200;
 
-- Consultar pagos realizados después de una fecha específica
SELECT * FROM Pagos
WHERE FECHA_PAGO > '2024-09-17';

-- AGREGACION Y AGRUPACION
-- Empleados: Contar el número total de empleados
 SELECT COUNT(*) AS TOTAL_EMPLEADOS 
 FROM Empleados; 
 
-- Tratamientos: Obtener el tratamiento más caro 
 SELECT NOMBRE_TTO, PRECIO AS MAS_CARO from Tratamientos
 ORDER BY PRECIO DESC
 LIMIT 1;
 
 -- Pagos: Sumar el total de los pagos realizados
 SELECT SUM(CUANTIA) AS TOTAL
 FROM Pagos;
 
 -- Clientes: Contar cuántos clientes se registraron cada mes
 SELECT extract(MONTH FROM FECHA_REGISTRO) AS MES_REGISTRO,
 COUNT(*) AS TOTAL_CLIENTES
 FROM Clientes
 GROUP BY extract(MONTH FROM FECHA_REGISTRO)
 ORDER BY MES_REGISTRO;
 ;
 
 -- Tratamientos: Ver el precio promedio de los tratamientos
 SELECT AVG(PRECIO) AS MEDIA 
 FROM tratamientos;
 
 -- Cuantos clientes cumplen años en cada mes 
 SELECT extract(MONTH FROM CUMPLEAÑOS_CLIENTE) AS MES_CUMPLEAÑOS,
 COUNT(*) AS N_CLIENTES
 FROM Clientes
 GROUP BY extract(MONTH FROM CUMPLEAÑOS_CLIENTE)
 ORDER BY MES_CUMPLEAÑOS;
 
  -- Cuantos clientes cumplen años en cada mes con nombre de mes
 SELECT MONTHNAME(CUMPLEAÑOS_CLIENTE) AS MES_CUMPLEAÑOS,
 COUNT(*) AS N_CLIENTES
 FROM Clientes
 GROUP BY MONTHNAME(CUMPLEAÑOS_CLIENTE);