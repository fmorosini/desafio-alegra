do
$$

declare fecha date;
declare dia int4;
declare mes int4;
declare anio int4;
declare trimestre int4;
declare cuatrimestre int4;
declare dia_semana int4;

begin
	
	drop table if exists tmp_fechas;

	create temporary table tmp_fechas as
	select distinct i.fecha from innova.invoices i order by 1;

	for fecha in select t.fecha from tmp_fechas t

	loop
		
		select extract(day from fecha),extract(month from fecha),extract(year from fecha),extract(quarter from fecha),extract(dow from fecha)
		into dia,mes,anio,trimestre,dia_semana;
	
		select case 
			when extract(month from fecha) between 1 and 4 then 1
			when extract(month from fecha) between 5 and 8 then 2
			when extract(month from fecha) between 9 and 12 then 3
		end into cuatrimestre;
		
		insert into innova_dw.dim_tiempo (fecha_dia,dia,mes,anio,trimestre,dia_semana,cuatrimestre) values(cast(fecha as text),dia,mes,anio,trimestre,dia_semana,cuatrimestre);
	
		-- raise notice '%, %, %, %, %, %, %',cast(fecha as text),dia,mes,anio,trimestre,dia_semana,cuatrimestre;
		
		
	
	end loop;

	drop table tmp_fechas;

end
$$