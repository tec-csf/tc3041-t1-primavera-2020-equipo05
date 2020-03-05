CREATE TABLE votacion (id INTEGER NOT NULL, fecha DATE NOT NULL, PRIMARY KEY (id, fecha))
CREATE TABLE colegio (numero INTEGER NOT NULL PRIMARY KEY, num_elect INTEGER, fecha_votacion DATE, id_votacion INTEGER)
ALTER TABLE colegio ADD FOREIGN KEY (fecha_votacion, id_votacion) REFERENCES votacion(fecha, id)
CREATE TABLE mesa (id CHAR NOT NULL, v_blanco INTEGER, v_nulo INTEGER, num_colegio INTEGER NOT NULL, FOREIGN KEY (num_colegio) REFERENCES colegio(numero), PRIMARY KEY (id, num_colegio))
CREATE TABLE partido (siglas VARCHAR(5) NOT NULL PRIMARY KEY, nombre VARCHAR(80), id_pres VARCHAR(30))
CREATE TABLE apoderado (ine VARCHAR(16) NOT NULL PRIMARY KEY, nombre VARCHAR(80), partido VARCHAR(5))
ALTER TABLE apoderado FOREIGN KEY (partido) REFERENCES partido(siglas)
CREATE TABLE votante (id VARCHAR(16) NOT NULL, nombre VARCHAR(80), fecha_nac DATE NOT NULL, direccion VARCHAR(80), atr_disc CHAR, id_mesa CHAR NOT NULL, num_colegio INTEGER NOT NULL, fecha_inicio DATE NOT NULL, fecha_fin DATE NOT NULL, PERIOD BUSINESS_TIME(fecha_inicio, fecha_fin), PRIMARY KEY (id, BUSINESS_TIME WITHOUT OVERLAPS), FOREIGN KEY (id_mesa, num_colegio) REFERENCES mesa(id, num_colegio))
CREATE TABLE list_mun (id_votante VARCHAR(16) NOT NULL, orden INTEGER NOT NULL, partido VARCHAR(5) NOT NULL, PRIMARY KEY(id_votante, partido))
ALTER TABLE list_mun FOREIGN KEY (partido) REFERENCES partido(siglas)
CREATE TABLE Elec_mun ( id_mesa CHAR NOT NULL, num_colegio INTEGER NOT NULL, partido VARCHAR(5) NOT NULL, sys_start TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW BEGIN, sys_end TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW END, ts_id TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS TRANSACTION START ID, PERIOD SYSTEM_TIME (sys_start, sys_end)) 
ALTER TABLE Elec_mun FOREIGN KEY (id_mesa, num_colegio) REFERENCES mesa(id, num_colegio)
ALTER TABLE Elec_mun FOREIGN KEY (partido) REFERENCES partido(siglas)
CREATE TABLE Elec_fed ( id_mesa CHAR NOT NULL, num_colegio INTEGER NOT NULL, partido VARCHAR(5) NOT NULL, sys_start TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW BEGIN, sys_end TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW END, ts_id TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS TRANSACTION START ID, PERIOD SYSTEM_TIME (sys_start, sys_end))
ALTER TABLE Elec_fed FOREIGN KEY (id_mesa, num_colegio) REFERENCES mesa(id, num_colegio)
ALTER TABLE Elec_fed FOREIGN KEY (partido) REFERENCES partido(siglas)
CREATE TABLE hist_Elec_fed LIKE Elec_fed
ALTER TABLE Elec_fed ADD VERSIONING USE HISTORY TABLE hist_Elec_fed
CREATE TABLE hist_Elec_mun LIKE Elec_mun
ALTER TABLE Elec_mun ADD VERSIONING USE HISTORY TABLE hist_Elec_mun