truncate table innova_dm.dm_top3_productos_por_top10_cliente ;

drop table if exists top_ten_customers;
drop table if exists top_products_customer;

create temporary table top_ten_customers as

	select sum(fi.cantidad),fi.customer
	from innova_dw.fct_invoices fi 
	inner join innova_dw.dim_tiempo dt on dt.id_tiempo = fi.fecha 
	group by fi.customer
	order by 1 desc
	limit 10;

create temporary table top_products_customer as

	select sum(fi.cantidad) as total_vendido,fi.product,fi.customer  
	from innova_dw.fct_invoices fi 
	group by fi.product,fi.customer
	order by fi.customer,1 desc;

with top_3_products_customer as
(
	select array
		( 
			select dp.nombre 
			from top_products_customer t
			inner join innova_dw.dim_products dp on dp.id_product = t.product
			where t.customer = ttc.customer
			order by t.total_vendido
			limit 3
		) as top3
		,ttc.customer
	from top_products_customer ttc
	where ttc.customer in 
	(	
		select t.customer
		from top_ten_customers t
	)
		
)
insert into innova_dm.dm_top3_productos_por_top10_cliente (top3productos,customer)
select distinct t3c.top3,dc.nombre as customer
from top_3_products_customer t3c
inner join innova_dw.dim_customers dc on dc.id_customer = t3c.customer;