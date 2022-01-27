create database Peliculas; 
\c peliculas;

-- Creamos tabla de Peliculas

create table peliculas (
    id int,
    peliculas varchar(150),
    ano_estreno int,
    director varchar(50),
    primary key (id)
);

-- Creamos tabla de Reparto

create table reparto (
    id int,
    actor varchar(50),
    foreign key (id) references peliculas(id)
);

-- copiamos bases de datos

copy peliculas from '/Users/matias/Documents/Desafio_latam/Bases de Datos/Bases de datos relacionales/desafio2/peliculas.csv' csv header;

-- En este caso el copy va sin el header al final

copy reparto from '/Users/matias/Documents/Desafio_latam/Bases de Datos/Bases de datos relacionales/desafio2/reparto.csv' csv ;

-- Obtener ID de la pelicula Titanic, retorna el id 2

select id from peliculas where peliculas = 'Titanic';

-- Obtener la lista de actores que aparecen en la pelicula titanic
-- Para hacerlo usamos el id que obtuvimos en la linea anterior

select actor from reparto where id = 2;

-- Contamos cuantas peliculas ha participado Harrison Ford
-- contamos Ids con actor = 'Harrison Ford' y agrupamos por actor

select count(id), actor from reparto where actor = 'Harrison Ford' group by actor;

-- Buscamos las peliculas estrenadas entre 1990 y 1999 y ordenamos por titulo de manera ascendente 

select * from peliculas where ano_estreno between 1990 and 1999 order by peliculas asc;

-- Consulta que muestra titulos con su longitud y ponemos alias a length

select peliculas, length(peliculas) as longitud_titulo from peliculas;

-- Consultamos cual es la longitud mas grande.
-- usamos la misma consulta anterior pero ordenamos por longitud de manera descendiente y limitamos la busqueda a 1 para que solo aparezca el mayor

select peliculas, length(peliculas) as longitud_titulo from peliculas order by longitud_titulo desc limit 1;
