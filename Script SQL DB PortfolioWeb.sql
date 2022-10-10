USE portfolio;
ALTER TABLE persona
ADD sobre_mi VARCHAR(200);
INSERT INTO persona
	(id, nombre, apellido, titulo)
VALUES
	(1,'Fabiola','Lutrario','Full Stack Developer Jr.');
SELECT *FROM persona;
ALTER TABLE idioma
DROP COLUMN porcentaje;
ALTER TABLE habilidad
DROP COLUMN porcentaje;
CREATE TABLE IF NOT EXISTS porcentaje(
	id INT AUTO_INCREMENT NOT NULL,
	PRIMARY KEY(id)
);
ALTER TABLE idioma
ADD porcentaje_id INT NOT NULL;
ALTER TABLE idioma
   ADD CONSTRAINT fk_porcentaje_idioma
   FOREIGN KEY(porcentaje_id) REFERENCES porcentaje(id);
   ALTER TABLE habilidad
ADD porcentaje_id INT NOT NULL;
   ALTER TABLE habilidad
   ADD CONSTRAINT fk_porcentaje_habilidad
   FOREIGN KEY(porcentaje_id) REFERENCES porcentaje(id);
   INSERT INTO porcentaje
	(id)
VALUES
	(1),
    (2);
SELECT *FROM porcentaje;
INSERT INTO porcentaje
	(id)
VALUES
	(3), (4), (5), (6), (7), (8), (9), (10),(11), (12), (13), (14), (15), (16), (17), (18),
    (19), (20), (21), (22), (23), (24), (25), (26), (27), (28), (29), (30),(31), (32), (33), 
    (34), (35), (36), (37), (38),(39), (40), (41), (42), (43), (44), (45), (46),
    (47), (48), (49), (50), (51), (52), (53), (54), (55), (56), (57), (58),(59), (60), (61), (62), 
    (63), (64), (65), (66),(67), (68), (69), (70), (71), (72), (73), (74),
    (75), (76), (77), (78), (79), (80), (81), (82), (83), (84), (85), (86),(87), (88), (89), 
    (90), (91), (92), (93), (94),(95), (96), (97), (98), (99), (100);
    INSERT INTO idioma
	(idioma,porcentaje_id)
VALUES
	('Español',99), ('Inglés',30);
SELECT *FROM idioma;
INSERT INTO habilidad
	(habilidad,porcentaje_id)
VALUES
	('Trabajo en equipo',88), ('Compañerismo',95);
SELECT *FROM habilidad;
ALTER TABLE experiencia
CHANGE COLUMN descripcion descripcion VARCHAR(600);
INSERT INTO experiencia
	(logo,cargo,empresa,fechaInicio,fechaFin,esTrabajoActual,descripcion,persona_id)
VALUES
	('www.foto.com/logoEmpresa','Axiliar Administrativo','Supermercado Popular, C.A.','2015-08-01','2017-11-20',0,
    'Manejo de base de datos en sistema administrativo ZEUS, 
    arqueo de caja, atención a proveedores, actualización de libros de compra-venta, elaboración de contratos, sobres de pago 
    y liquidación, control de asistencia diaria mediante lector biométrico, control de inventario, entre otras actividades 
    inherentes al cargo.',1);
SELECT *FROM experiencia;
	ALTER TABLE educacion
CHANGE COLUMN descripcion descripcion VARCHAR(500);
INSERT INTO educacion
	(logo,titulo,centroEducativo,fechaInicio,fechaFin,seEncuentraCursando,persona_id)
VALUES
	('www.foto.com/logoCentroEducativo','Licenciatura en Educación Informática','Universidad del Zulia (Venezuela)',
    '2012-04-01','2017-03-30',0,1);
SELECT *FROM educacion;
INSERT INTO persona_domina_idioma
	(idioma_id,persona_id)
VALUES
	(1,1),(2,1);
INSERT INTO persona_tiene_habilidad
	(habilidad_id,persona_id)
VALUES
	(1,1),(2,1);
INSERT INTO proyecto
	(logo,nombre,fechaRealizacion,descripcion,link,imagen,persona_id)
VALUES
	('www.foto.com/logoProyecto1','Portfolio Web','2023,01,15',
    'Diseño y programación del presente Portfolio Web seguiendo los lineamientos de Argentina Programa.',
    'www.fabiolalutrariodev.com','www.foto.com/imagenProyecto1',1);
    SELECT *FROM proyecto;
SELECT CONCAT(p.nombre," ",p.apellido) AS nombre_y_apellido,
 i.idioma, i.porcentaje_id AS porcentaje 
FROM persona p
INNER JOIN persona_domina_idioma pi
  ON p.id = pi.persona_id
INNER JOIN idioma i
  ON pi.idioma_id = i.id;

    