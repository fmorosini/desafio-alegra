with invoices_dw as
(
	select idw.id_invoice from innova_dw.fct_invoices idw
)

insert into innova_dw.fct_invoices (id_invoice,customer,product,cantidad,total,fecha)
select i.id,i.id_customer,i.id_product,i.cantidad,(i.cantidad * p.precio) as total,dt.id_tiempo 
from innova.invoices i 
inner join innova.products p on i.id_product = p.id
inner join innova_dw.dim_tiempo dt on dt.fecha_dia = cast(i.fecha as text)
where i.id not in 
(
	select id_invoice from invoices_dw
);

