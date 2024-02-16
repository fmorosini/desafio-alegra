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

select ttc.total_vendido,dp.nombre as producto,dc.nombre  as customer 
from top_products_customer ttc
inner join innova_dw.dim_products dp on dp.id_product = ttc.product
inner join dim_customers dc on ttc.customer = dc.id_customer 
where ttc.customer in 
(
	select t.customer
	from top_ten_customers t
)
order by ttc.customer;
