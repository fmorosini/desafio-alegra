with products_dw as
(
	select id_product from innova_dw.dim_products dc 	
)

insert into innova_dw.dim_products(id_product,nombre,precio,categoria)
select p.id,p.nombre,p.precio,pc.nombre 
from innova.products p
inner join innova.prod_categorias pc on p.categoria = pc.id
where p.id not in (
	select id_product from products_dw
);

