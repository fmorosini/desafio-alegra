-- evolución compras mensuales por clientes top 10
truncate table innova_dm.dm_compras_mensuales_clientes_top10;

drop table if exists top_ten_customers;

create temporary table top_ten_customers as

	select sum(fi.cantidad),fi.customer
	from innova_dw.fct_invoices fi 
	inner join innova_dw.dim_tiempo dt on dt.id_tiempo = fi.fecha 
	group by fi.customer
	order by 1 desc
	limit 10;

insert into innova_dm.dm_compras_mensuales_clientes_top10 (customer,anio,mes,cantidad_productos,cantidad_compras,facturado)
select dc.nombre as customer,dt.anio,dt.mes,sum(fi.cantidad) as cantidad_productos,count(fi.id_invoice) as cantidad_compras,sum(fi.total) as facturado 
from innova_dw.fct_invoices fi
inner join innova_dw.dim_tiempo dt on dt.id_tiempo = fi.fecha 
inner join top_ten_customers ttc on ttc.customer = fi.customer
inner join innova_dw.dim_customers dc on ttc.customer = dc.id_customer 
group by dc.nombre,dt.anio,dt.mes
order by dc.nombre,dt.anio,dt.mes;



