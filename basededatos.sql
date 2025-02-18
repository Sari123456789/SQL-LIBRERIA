CREATE DATABASE IF NOT EXISTS CentroEstetica;
USE CentroEstetica;

CREATE TABLE IF NOT EXISTS Clientes (
ID_CLIENTE INT PRIMARY KEY auto_increment,
NOMBRE_CLIENTE VARCHAR(50) NOT NULL,
EMAIL_CLIENTE VARCHAR(50) NOT NULL UNIQUE,
TELEFONO_CLIENTE VARCHAR(15) NOT NULL,
FECHA_REGISTRO datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
CUMPLEAÑOS_CLIENTE date not null
);

CREATE TABLE IF NOT EXISTS Empleados (
ID_EMPLEADO INT PRIMARY KEY AUTO_INCREMENT,
NOMBRE_EMPLEADO VARCHAR(50) NOT NULL,
CARGO VARCHAR(50) NOT NULL,
TELEFONO_EMPLEADO VARCHAR(15) NOT NULL,
EMAIL_EMPLEADO VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Tratamientos (
ID_TTO INT PRIMARY KEY auto_increment,
NOMBRE_TTO VARCHAR(50) NOT NULL,
DESCRIPCION TEXT,
PRECIO DECIMAL(10,2) NOT NULL,
DURACION INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Citas (
ID_CITA INT PRIMARY KEY auto_increment,
FECHA_HORA datetime NOT NULL,
ESTADO ENUM('COMPLETADO', 'PENDIENTE', 'CANCELADA') DEFAULT 'PENDIENTE',
ID_CLIENTE INT NOT NULL,
ID_EMPLEADO INT NOT NULL,
ID_TTO INT NOT NULL,
FOREIGN KEY (ID_CLIENTE) REFERENCES Clientes(ID_CLIENTE),
FOREIGN KEY (ID_EMPLEADO) REFERENCES Empleados(ID_EMPLEADO),
FOREIGN KEY (ID_TTO) REFERENCES Tratamientos(ID_TTO)
);

CREATE TABLE IF NOT EXISTS Pagos (
ID_PAGO INT PRIMARY KEY auto_increment,
METODO_PAGO ENUM('EFECTIVO', 'TARJETA', 'TRANSFERENCIA') NOT NULL,
FECHA_PAGO DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
CUANTIA DECIMAL(10,2) NOT NULL,
ID_CITA INT NOT NULL,
foreign key (ID_CITA) REFERENCES Citas(ID_CITA)
);

-- Clientes con fechas de registro en 2023 (Año Anterior)
INSERT INTO Clientes (NOMBRE_CLIENTE, EMAIL_CLIENTE, TELEFONO_CLIENTE, CUMPLEAÑOS_CLIENTE, FECHA_REGISTRO)
VALUES 
('Laura Martínez', 'laura.martinez@email.com', '912345678', '1991-04-22', '2023-05-15'),
('Javier Rodríguez', 'javier.rodriguez@email.com', '923456789', '1986-09-05', '2023-07-01'),
('María López', 'maria.lopez@email.com', '934567890', '1993-12-11', '2023-11-10'),
('Carlos Sánchez', 'carlos.sanchez@email.com', '945678901', '1989-02-28', '2023-06-21'),
('Ana Fernández', 'ana.fernandez@email.com', '956789012', '1990-08-18', '2023-09-12'),
('Pedro Gómez', 'pedro.gomez@email.com', '967890123', '1988-03-07', '2023-01-20'),
('Beatriz Ruiz', 'beatriz.ruiz@email.com', '978901234', '1995-04-10', '2023-04-03'),
('José Martínez', 'jose.martinez@email.com', '989012345', '1992-10-15', '2023-12-22');

-- Clientes con fechas de registro en 2024 (Año Actual)
INSERT INTO Clientes (NOMBRE_CLIENTE, EMAIL_CLIENTE, TELEFONO_CLIENTE, CUMPLEAÑOS_CLIENTE, FECHA_REGISTRO)
VALUES 
('Sandra Morales', 'sandra.morales@email.com', '765432109', '1990-03-14', '2024-04-10'),
('Felipe Torres', 'felipe.torres@email.com', '776543210', '1987-05-20', '2024-05-11'),
('Patricia Gómez', 'patricia.gomez@email.com', '787654321', '1992-07-25', '2024-06-15'),
('Adrián Pérez', 'adrian.perez@email.com', '798765432', '1988-11-30', '2024-07-20'),
('Lucía García', 'lucia.garcia@email.com', '809876543', '1994-12-12', '2024-08-05'),
('Francisco Díaz', 'francisco.diaz@email.com', '820987654', '1991-01-17', '2024-09-30'),
('Verónica Ruiz', 'veronica.ruiz@email.com', '831098765', '1989-02-25', '2024-10-14'),
('Antonio Romero', 'antonio.romero@email.com', '842209876', '1993-06-19', '2024-11-03');

-- Clientes con fecha de registro en 2025 (Próximo Año)
INSERT INTO Clientes (NOMBRE_CLIENTE, EMAIL_CLIENTE, TELEFONO_CLIENTE, CUMPLEAÑOS_CLIENTE, FECHA_REGISTRO)
VALUES 
('Marta Jiménez', 'marta.jimenez@email.com', '900123456', '1995-01-09', '2025-01-15'),
('Raúl Pérez', 'raul.perez@email.com', '910234567', '1991-03-03', '2025-02-10'),
('Andrea Sánchez', 'andrea.sanchez@email.com', '920345678', '1985-06-12', '2025-03-05'),
('David López', 'david.lopez@email.com', '930456789', '1992-07-22', '2025-04-07'),
('Isabel Martín', 'isabel.martin@email.com', '940567890', '1990-10-30', '2025-05-15'),
('Raquel Díaz', 'raquel.diaz@email.com', '950678901', '1993-02-18', '2025-06-22'),
('Ricardo Pérez', 'ricardo.perez@email.com', '960789012', '1991-11-11', '2025-07-02'),
('María García', 'maria.garcia@email.com', '970890123', '1987-12-14', '2025-08-19');



INSERT INTO Empleados (NOMBRE_EMPLEADO, CARGO, TELEFONO_EMPLEADO, EMAIL_EMPLEADO)
VALUES 
('María Fernández', 'Directora', '749876543', 'maria.fernandez@email.com'),
('Carla López', 'Asesora', '758987654', 'carla.lopez@email.com'),
('Lucía Rodríguez', 'Asesora', '769098765', 'lucia.rodriguez@email.com'),
('Juan Gómez', 'Técnico de Cabina', '780109876', 'juan.gomez@email.com'),
('Ana Ruiz', 'Técnico de Cabina', '791210987', 'ana.ruiz@email.com'),
('Pablo Martínez', 'Técnico de Cabina', '802321098', 'pablo.martinez@email.com'),
('Luis Díaz', 'Doctor', '813432109', 'luis.diaz@email.com'),
('Sofía Herrera', 'Doctora', '824543210', 'sofia.herrera@email.com');

INSERT INTO Tratamientos (NOMBRE_TTO, DESCRIPCION, PRECIO, DURACION)
VALUES 
('Radiofrecuencia', 'Tratamiento facial que combate la flacidez y rejuvenece la piel.', 120.00, 60),
('Masaje Relajante', 'Masaje corporal para aliviar el estrés y mejorar la circulación.', 40.00, 45),
('Limpieza Facial', 'Eliminación de impurezas y células muertas de la piel.', 50.00, 30),
('Dermapen', 'Microagujas para rejuvenecer la piel y mejorar su textura.', 80.00, 60),
('Aumento de Labios', 'Relleno de labios con ácido hialurónico para aumentar su volumen.', 150.00, 45),
('Neuromodulador', 'Tratamiento para reducir arrugas y líneas de expresión.', 200.00, 30),
('Rinoplastia', 'Cirugía estética para modificar la forma de la nariz.', 1500.00, 120),
('Carboxiterapia', 'Tratamiento médico para eliminar la celulitis y mejorar la circulación.', 100.00, 45);

-- Citas con estado PENDIENTE, COMPLETADO y CANCELADA
INSERT INTO Citas (FECHA_HORA, ESTADO, ID_CLIENTE, ID_EMPLEADO, ID_TTO)
VALUES
-- Citas PENDIENTES
('2024-05-15 10:00:00', 'PENDIENTE', 1, 1, 1),  -- Laura Martínez
('2024-06-21 11:30:00', 'PENDIENTE', 2, 2, 2),  -- Javier Rodríguez
('2024-07-10 15:00:00', 'PENDIENTE', 3, 3, 3),  -- María López
('2024-08-02 14:00:00', 'PENDIENTE', 4, 4, 4),  -- Carlos Sánchez
('2024-09-05 16:00:00', 'PENDIENTE', 5, 5, 5),  -- Ana Fernández
('2024-10-08 09:00:00', 'PENDIENTE', 6, 6, 6),  -- Pedro Gómez
('2024-11-12 12:00:00', 'PENDIENTE', 7, 7, 7),  -- Beatriz Ruiz
('2024-12-22 13:00:00', 'PENDIENTE', 8, 8, 8),  -- José Martínez

-- Citas COMPLETADAS
('2023-06-15 09:00:00', 'COMPLETADO', 9, 1, 1),  -- Sandra Morales
('2023-07-20 10:30:00', 'COMPLETADO', 10, 2, 2), -- Felipe Torres
('2023-08-15 14:00:00', 'COMPLETADO', 11, 3, 3), -- Patricia Gómez
('2023-09-30 16:00:00', 'COMPLETADO', 12, 4, 4), -- Adrián Pérez
('2023-10-10 17:30:00', 'COMPLETADO', 13, 5, 5), -- Lucía García
('2023-11-25 13:00:00', 'COMPLETADO', 14, 6, 6), -- Francisco Díaz
('2023-12-05 14:30:00', 'COMPLETADO', 15, 7, 7), -- Verónica Ruiz
('2023-12-12 11:30:00', 'COMPLETADO', 16, 8, 8), -- Antonio Romero

-- Citas CANCELADAS
('2022-12-05 12:00:00', 'CANCELADA', 17, 1, 1), -- Marta Jiménez
('2022-11-25 13:00:00', 'CANCELADA', 18, 2, 2), -- Raúl Pérez
('2022-10-15 10:30:00', 'CANCELADA', 19, 3, 3), -- Andrea Sánchez
('2022-09-20 14:00:00', 'CANCELADA', 20, 4, 4), -- David López
('2022-08-30 15:30:00', 'CANCELADA', 21, 5, 5), -- Isabel Martín
('2022-07-12 16:00:00', 'CANCELADA', 22, 6, 6), -- Raquel Díaz
('2022-06-18 09:00:00', 'CANCELADA', 23, 7, 7), -- Ricardo Pérez
('2022-05-21 10:00:00', 'CANCELADA', 24, 8, 8); -- María García


-- Pagos realizados para citas COMPLETADAS y PENDIENTES
INSERT INTO Pagos (METODO_PAGO, FECHA_PAGO, CUANTIA, ID_CITA)
VALUES
-- Pagos para Citas COMPLETADAS
('EFECTIVO', '2023-06-15 09:15:00', 50.00, 1),  -- Sandra Morales
('TARJETA', '2023-07-20 10:45:00', 75.00, 2),  -- Felipe Torres
('TRANSFERENCIA', '2023-08-15 14:15:00', 60.00, 3), -- Patricia Gómez
('EFECTIVO', '2023-09-30 16:15:00', 80.00, 4), -- Adrián Pérez
('TARJETA', '2023-10-10 17:45:00', 100.00, 5), -- Lucía García
('TRANSFERENCIA', '2023-11-25 13:15:00', 120.00, 6), -- Francisco Díaz
('EFECTIVO', '2023-12-05 14:45:00', 40.00, 7), -- Verónica Ruiz
('TARJETA', '2023-12-12 11:45:00', 65.00, 8), -- Antonio Romero

-- Pagos para Citas PENDIENTES
('EFECTIVO', '2024-05-15 10:15:00', 50.00, 9),  -- Laura Martínez
('TARJETA', '2024-06-21 11:45:00', 75.00, 10),  -- Javier Rodríguez
('TRANSFERENCIA', '2024-07-10 15:15:00', 60.00, 11),  -- María López
('EFECTIVO', '2024-08-02 14:15:00', 80.00, 12),  -- Carlos Sánchez
('TARJETA', '2024-09-05 16:15:00', 100.00, 13),  -- Ana Fernández
('TRANSFERENCIA', '2024-10-08 09:15:00', 120.00, 14),  -- Pedro Gómez
('EFECTIVO', '2024-11-12 12:15:00', 40.00, 15),  -- Beatriz Ruiz
('TARJETA', '2024-12-22 13:15:00', 65.00, 16);  -- José Martínez

<<<<<<< HEAD
-- VER ORGANIZACION TABLAS 
=======

>>>>>>> 0a9cb308ddd64595e050b591ff13ab01a6b005f1
SELECT * FROM Empleados;
SELECT * FROM Tratamientos;
SELECT * FROM Clientes;
select * from Citas;
Select * from Pagos;

<<<<<<< HEAD
-- Insertamos más datos para que haya alguno nulo
-- Empleado sin tratamientos realizados
INSERT INTO Empleados (NOMBRE_EMPLEADO, CARGO, TELEFONO_EMPLEADO, EMAIL_EMPLEADO)
VALUES ('Sara López', 'Jefa', '679879540', 'saralo@gmail.com');

-- Insertar tratamientos que aún no se han realizado
INSERT INTO Tratamientos (NOMBRE_TTO, DESCRIPCION, PRECIO, DURACION)
VALUES 
('Maderoterapia', 'Tratamiento corporal con técnicas manuales para reducir la celulitis.', 120.00, 60),
('Hilos Tensores', 'Tratamiento estético con hilos para tensar y rejuvenecer la piel.', 400.00, 90);

-- Insertar un cliente sin citas
INSERT INTO Clientes (NOMBRE_CLIENTE, EMAIL_CLIENTE, TELEFONO_CLIENTE, CUMPLEAÑOS_CLIENTE, FECHA_REGISTRO)
VALUES ('Manolo Rodríguez', 'loloro@gmail.com', '914123856', '1995-06-15', '2022-01-01'),
('Inés Rodríguez', 'inesro@gmail.com', '914703850', '1994-06-15', '2022-11-08');

=======
>>>>>>> 0a9cb308ddd64595e050b591ff13ab01a6b005f1



