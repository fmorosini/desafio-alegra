truncate table innova_dm.dm_evolucion_mensual_ventas_region;

insert into innova_dm.dm_evolucion_mensual_ventas_region (cantidad_ventas,cantidad_productos_vendidos,productos_por_venta,total_facturado,ubicacion,anio,mes)
select count(fi.cantidad) as cantidad_ventas,sum(fi.cantidad) as cantidad_productos_vendidos,
	cast(sum(fi.cantidad) as real) / cast(count(fi.cantidad) as real) as productos_por_venta,
	sum(fi.total) as total_facturado,dc.ubicacion,dt.anio,dt.mes
from innova_dw.fct_invoices fi 
inner join innova_dw.dim_customers dc on fi.customer = dc.id_customer 
inner join innova_dw.dim_tiempo dt on fi.fecha = dt.id_tiempo 
group by dc.ubicacion,dt.anio,dt.mes 
order by dt.anio,dt.mes,1 desc;