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
<<<<<<< HEAD
 GROUP BY MONTHNAME(CUMPLEAÑOS_CLIENTE);
 
 -- JOIN
 -- Clientes con las citas que tienen 
 SELECT Clientes.NOMBRE_CLIENTE as nombre,
 Citas.FECHA_HORA as cita,
 Citas.ESTADO 
 FROM Clientes
 RIGHT JOIN Citas
 ON Clientes.ID_CLIENTE = Citas.ID_CLIENTE;
 
 
 -- Clientes con las citas que tienen que no se hayan realizado ya 
SELECT Clientes.NOMBRE_CLIENTE as nombre,
 Citas.FECHA_HORA as cita,
 Citas.ESTADO 
 FROM Clientes
 RIGHT JOIN Citas
 ON Clientes.ID_CLIENTE = Citas.ID_CLIENTE
 WHERE ESTADO <> 'COMPLETADO';


-- Empleados con los tratamientos que han realizado 
SELECT Empleados.NOMBRE_EMPLEADO as 'Lo realizó',
Empleados.CARGO,
Citas.FECHA_HORA,
Tratamientos.NOMBRE_TTO as Tratamiento
FROM Empleados
RIGHT JOIN Citas
ON Empleados.ID_EMPLEADO = Citas.ID_EMPLEADO
LEFT JOIN Tratamientos
ON Tratamientos.ID_TTO = Citas.ID_TTO;

-- Citas con los pagos realizados 
SELECT Citas.FECHA_HORA as Cita,
Pagos.CUANTIA, Pagos.METODO_PAGO
from Citas
RIGHT JOIN Pagos
ON Citas.ID_CITA = Pagos.ID_CITA; 

-- Clientes con los tratamientos realizados 
SELECT Clientes.NOMBRE_CLIENTE as nombre,
Tratamientos.NOMBRE_TTO as Tratamiento,
Tratamientos.DURACION
FROM Clientes
LEFT JOIN Citas
ON Clientes.ID_CLIENTE = Citas.ID_CLIENTE
LEFT JOIN Tratamientos
ON Citas.ID_TTO = Tratamientos.ID_TTO;

-- Clientes que no han realizado ninguna cita
SELECT Clientes.NOMBRE_CLIENTE,
Clientes.EMAIL_CLIENTE
from Clientes
LEFT JOIN Citas
ON Clientes.ID_CLIENTE = Citas.ID_CLIENTE
where Citas.ID_CITA IS NULL ;

-- Empleados con más de un tratamiento realizado
SELECT Empleados.NOMBRE_EMPLEADO as nombre,
COUNT(ID_CITA) as n_citas
FROM Empleados
RIGHT JOIN Citas
ON Empleados.ID_EMPLEADO = Citas.ID_EMPLEADO
GROUP BY Empleados.NOMBRE_EMPLEADO
HAVING COUNT(ID_CITA) > 1;

-- Clientes con pagos mayores a 100€
SELECT Clientes.NOMBRE_CLIENTE as Nombre,
Clientes.TELEFONO_CLIENTE as Telefono,
SUM(Pagos.CUANTIA) as total
FROM Clientes
INNER JOIN Citas
ON Clientes.ID_CLIENTE = Citas.ID_CLIENTE
INNER JOIN Pagos
ON Citas.ID_CITA = Pagos.ID_CITA
GROUP BY Clientes.ID_CLIENTE
HAVING Total > 100
ORDER BY Total DESC;

-- Empleados que no han realizado ningún tratamiento en el último mes
SELECT Empleados.NOMBRE_EMPLEADO as nombre
FROM Empleados
LEFT JOIN Citas
ON Empleados.ID_EMPLEADO = Citas.ID_EMPLEADO
LEFT JOIN Tratamientos
ON Citas.ID_TTO = Tratamientos.ID_TTO
where Citas.FECHA_HORA < DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- Tratamientos más solicitados en el último mes
SELECT Tratamientos.NOMBRE_TTO as Tratamiento,
COUNT(Tratamientos.ID_TTO) as n_veces
FROM Tratamientos
JOIN Citas
ON Tratamientos.ID_TTO = Citas.ID_TTO
where Citas.FECHA_HORA >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY Tratamientos.NOMBRE_TTO
ORDER BY n_veces DESC;
=======
 GROUP BY MONTHNAME(CUMPLEAÑOS_CLIENTE);
>>>>>>> 0a9cb308ddd64595e050b591ff13ab01a6b005f1
