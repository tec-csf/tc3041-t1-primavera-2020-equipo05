
# Tarea 1. SQL Avanzado

---

##### Integrantes:
1. *Gabriel Schlam Huber* - *A01024122* - *Santa Fe*
2. *Eduardo Harari* - *A01025876* - *Santa Fe*
3. *Diego Alejandro Moreno Acevedo* - *A01022113* - *Santa Fe*
---
## 1. Aspectos generales

Las orientaciones de la tarea se encuentran disponibles en la plataforma **Canvas**.

Este documento es una guía sobre qué información debe entregar como parte de la tarea, qué requerimientos técnicos debe cumplir y la estructura que debe seguir para organizar su entrega.


### 1.1 Requerimientos técnicos

A continuación se mencionan los requerimientos técnicos mínimos de la tarea, favor de tenerlos presente para que cumpla con todos.

* El equipo tiene la libertad de elegir las tecnologías de desarrollo a utilizar en la tarea, sin embargo, debe tener presente que la solución final se deberá ejecutar en una plataforma en la nube. Puede ser  [Google Cloud Platform](https://cloud.google.com/?hl=es), [Azure](https://azure.microsoft.com/en-us/), AWS [AWS](https://aws.amazon.com/es/free/) u otra.
* El equipo tiene la libertad de utilizar el DBMS de su preferencia.
* La arquitectura de la solución deberá estar separada claramente por capas (*frontend*, *backend*, datos y almacenamiento).
* Todo el código, *scripts* y la documentación de la tarea debe alojarse en este repositorio de GitHub, siguiendo la estructura que aparece a continuación.

### 1.2 Estructura del repositorio

El proyecto debe seguir la siguiente estructura de carpetas:
```
- / 			        # Raíz de toda la tarea
    - README.md			# Archivo con la información general de la tarea (este archivo)
    - frontend			# Carpeta con la solución del frontend (Web app)
    - backend			# Carpeta con la solución del backend en caso de ser necesario (CMS o API)
    - scripts		        # Carpeta con los scripts necesarios para generar la base de datos, cargar datos y ejecutar las consultas
    - database			# Carpeta con el diagrama Entidad-Relación Extendido y los archivos CSV de datos necesarios para generar la bases de datos

```

### 1.3 Documentación de la tarea

Como parte de la entrega de la tarea, se debe incluir la siguiente información:

* Diagrama del *Modelo Entidad-Relación Extendido*.
* *Scripts* para generar la base de datos, cargar datos y ejecutar consultas.
* Archivos CSV con los datos a cargar en al base de datos.
* Guía de configuración, instalación y despliegue de la aplicación en la plataforma en la nube  seleccionada.
* El código debe estar documentado siguiendo los estándares definidos para el lenguaje de programación seleccionado.

## 2. Solución

A continuación aparecen descritos los diferentes elementos que forman parte de la solución de la tarea.

### 2.1 Modelo de la *base de datos* 

![Diagrama ERE](database/DiagramaERE.png)

Nuestra implementación para nuestra base de datos incluye las entidades siguientes, con sus respectivas relaciones y/o restricciones:
1. **Colegio:**
	* Relación con:
		* Mesa
		* Votación
	* Jerarquías:
		* Mesa: 1 a muchos, es decir, un colegio tiene 1 o más mesas.
		* Votación: 1 a muchos, es decir, un colegio tiene 1 o más votaciones.
2. **Mesa:**
	* Relación con:
		* Colegio (previamente mencionada).
		* Votante
		* Partido:
			* Aquí existen 2 relaciones:
				* Elecciones municipales.
				* Elecciones federales.
	* Jerarquías:
		* Votante: 1 a muchos, es decir, una mesa tiene 1 o más votantes.
		* Partido: muchos a muchos, ya que una mesa tiene muchos votos por diferentes partidos, y un partido tiene muchos votos en diferentes mesas.
3. **Partido:**
	* Relación con:
		* Mesa (previamente mencionada).
		* Votante.
		* Apoderado.
	* Jerarquías:
		* Votante: 
			* 0 a 4.
			* Aquí existe una restricción, ya que cada partido tiene una lista nominal a la que pertenecen únicamente 4 votantes.
		* Apoderado: 1 a muchos, es decir, un partido tiene 1 o más apoderados.
4. **Votante:**
	* Relación con:
		* Partido (previamente mencionada).
		* Mesa (previamente mencionada).
	* Restricciones:
		* Un votante puede ser: Mexicano o Extranjero.
		* Si es Mexicano, tiene las siguientes opciones:
			* Ser un votante común.
			* Ser un miembro:
				* Vocal
				* Presidente
			* Ser un suplente de los puestos anteriores.

***Las demás entidades ya fueron mencionadas y explicadas***

### 2.2 Arquitectura de la solución

*[Incluya aquí un diagrama donde se aprecie la arquitectura de la solución propuesta, así como la interacción entre los diferentes componentes de la misma.]*

### 2.3 Frontend

Para el Frontend se utilizo el lenguaje de HTML, JAVASCRIPT y CSS. Se utilizo bootstrap para apoyarnos en el diseño y complementar la pagina web. 
Bootstrap es una herramienta muy poderosa que tiene su propio diseño al insertar pedazos de codigo basados en HTML. Con Bootstrap se crearon los botones , asi como el estilo de las letras, los TextBox etc. 
https://getbootstrap.com/docs/4.4/getting-started/introduction/ En este link podemos encontrar la documentacion de Bootstrap asi como los paso para poder trabajar con el de la mejor manera.

por otro lado se uso HTML, uno de los lenguages mas usados para la implementaciion de paginas web.
Mas adelante se encuentra un link sonde podemos ver algunos detalles sobre este lenguage y lo que es caaz de hacer.
https://www.w3schools.com/html/ En esta pagina podemos encontrar gran variedad de tutoriales asi como ejemplos sobre una  gran parte de los lenguages que usamos como HTML, CSS y JavaScript.


#### 2.3.1 HTML, CSS, JAVASCRIPT
#### 2.3.2 Bootstrap
#### 2.3.3 No se usaron librerias

### 2.4 Backend

*[Incluya aquí una explicación de la solución utilizada para el backend de la tarea. No olvide incluir las ligas o referencias donde se puede encontrar información de los lenguajes de programación, frameworks y librerías utilizadas.]*

#### 2.4.1 Lenguaje de programación
#### 2.4.2 Framework
#### 2.4.3 Librerías de funciones o dependencias

## 2.5 Pasos a seguir para utilizar la aplicación

Dentro de la pagina web se tienen dos columnas principales la cuales estan nombradas como "Home" y "View Tables". En la pestaña principal "Home" aparecen unos cuadros dentro de los cuales podemos ingresar datos correspondientes para cada tabla. Por ejemplo, la primera tabla que se tiene es la de Tabla Votacion la cual tiene 2 TextBox. 1)ID, 2)Fecha.
Dentro de estos 2 recuadros se tiene que ingresar el ID correspondiente de la votacion y la fecha de la misma. Ya teniendo estos 2 datos arriba del recuadro tenemos 3 botones los cuales estan nombrados con los nombres.
INSERT, UPDATE, DELETE. Como dice el nombre, despues de ingresar los datos se elige la opcion que deseemos y se la de click al boton y tus datos en ese momento son insertados a la tabla, actualizados o borrados.
El mismo paso se utilizara para cualquier tabla donde el usuario quiera hacer operaciones CRUD.

Dentro de la segunda pagina "View Tables" como lo dice su nombre es para vizualizar completas las tablas, es decir, a la hora de elegir una tabla, internamente se corre el query "SELECT * FROM NOMBRE_TABLA" y se vizualiza en pantalla donde el usuario podra ver los cambios correspodietes que hizo con operaciones CRUD o simplemnte ver la tabla completa sin insertar ninguna fila.


## 3. Referencias
https://www.w3schools.com/html/
https://www.ibm.com/developerworks/data/library/techarticle/0309thakrar/0309thakrar.html
https://www.ibm.com/support/knowledgecenter/SSEPGG_9.7.0/com.ibm.swg.im.dbclient.python.doc/doc/t0054368.html
https://stackoverflow.com/questions/6044326/how-to-connect-python-to-db2
https://www.ibm.com/support/pages/sql0805n-package-nullidsysln303-was-not-found
https://www.npmjs.com/package/ibm_db
https://stackoverflow.com/questions/4720343/loading-basic-html-in-node-js
https://developer.ibm.com/mainframe/2019/08/07/accessing-ibm-db2-on-node-js/





