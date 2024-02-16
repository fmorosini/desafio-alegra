with customers_dw as
(
	select id_customer from innova_dw.dim_customers dc 	
)

insert into innova_dw.dim_customers(id_customer,nombre,ubicacion,segmento)
select c.id,c.nombre,cu.nombre,cs.nombre 
from innova.customers c
inner join innova.cust_segmentos cs on c.segmento = cs.id 
inner join innova.cust_ubicaciones cu on c.ubicacion = cu.id
where c.id not in (
	select id_customer from customers_dw
);

