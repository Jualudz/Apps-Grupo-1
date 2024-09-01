-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS UniversidadCursos;

-- Usar la base de datos
USE UniversidadCursos;

-- Tabla para los tipos de usuario
CREATE TABLE Tipos_Usuario (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(20) NOT NULL
);

-- Insertar los tipos de usuario
INSERT INTO Tipos_Usuario (tipo) VALUES ('alumno'), ('profesor'), ('administrador');

-- Tabla de usuarios
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    id_tipo INT NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_tipo) REFERENCES Tipos_Usuario(id_tipo)
);

-- Tabla de facultades
CREATE TABLE Facultades (
    id_facultad INT AUTO_INCREMENT PRIMARY KEY,
    nombre_facultad VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla de materias
CREATE TABLE Materias (
    id_materia INT AUTO_INCREMENT PRIMARY KEY,
    nombre_materia VARCHAR(100) NOT NULL,
    id_facultad INT NOT NULL,
    descripcion TEXT,
    FOREIGN KEY (id_facultad) REFERENCES Facultades(id_facultad)
);

-- Tabla de cursos
CREATE TABLE Cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    id_materia INT NOT NULL,
    id_profesor INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE,
    descripcion TEXT,
    FOREIGN KEY (id_materia) REFERENCES Materias(id_materia),
    FOREIGN KEY (id_profesor) REFERENCES Usuarios(id_usuario)
);

-- Tabla de calendario
CREATE TABLE Calendario (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_evento DATE,
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

-- Tabla de inscripciones
CREATE TABLE Inscripciones (
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT NOT NULL,
    id_alumno INT NOT NULL,
    fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso),
    FOREIGN KEY (id_alumno) REFERENCES Usuarios(id_usuario)
);
INSERT INTO Usuarios (nombre, correo, contraseña, id_tipo)
VALUES 
    ('Juan Pérez', 'juan.perez@example.com', 'password123', 1),  -- Alumno
    ('Ana García', 'ana.garcia@example.com', 'password456', 2),  -- Profesor
    ('Luis Fernández', 'luis.fernandez@example.com', 'password789', 3); -- Administrador
    
select * from usuarios