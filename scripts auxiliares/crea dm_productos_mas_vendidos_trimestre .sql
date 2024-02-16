-- innova_dm.dm_productos_mas_vendidos_trimestre definition

-- Drop table

-- DROP TABLE innova_dm.dm_productos_mas_vendidos_trimestre;

CREATE TABLE innova_dm.dm_productos_mas_vendidos_trimestre (
	id serial4 NOT NULL,
	producto varchar(50) NULL,
	anio int4 NULL,
	trimestre int4 NULL,
	total_vendido int4 NULL
);