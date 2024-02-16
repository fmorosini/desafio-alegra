truncate table innova_dm.dm_productos_mas_vendidos_trimestre ;

with agg_cantidades as 
(
	select sum(fi.cantidad) as total_vendido,fi.product,dt.anio,dt.trimestre  
	from innova_dw.fct_invoices fi 
	inner join innova_dw.dim_tiempo dt on dt.id_tiempo = fi.fecha 
	group by fi.product,dt.anio,dt.trimestre
	order by dt.anio,dt.trimestre,1 desc
)

insert into innova_dm.dm_productos_mas_vendidos_trimestre (producto,anio,trimestre,total_vendido) 
select dp.nombre as producto,ac.anio,ac.trimestre,ac.total_vendido
from agg_cantidades ac
inner join innova_dw.dim_products dp on ac.product = dp.id_product 
where total_vendido = (
	select max(agg.total_vendido) 
	from agg_cantidades agg where agg.trimestre = ac.trimestre and agg.anio = ac.anio); 
