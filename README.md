Carpetas:

/data: archivos .csv para generar tablas en OLTP (schema innova)

/"dump bbdd": dumps de la BBDD

/"scripts etl": scripts utilizados para generar nivel Silver (data warehouse) a partir de los datos del OLTP

/"scripts analitica": scripts utilizados para generar tablas en nivel gold (data mart) en schema innova_dm a partir de las tablas del DW

/diagramas: PNG con el duagrama ER tanto del OLTP (schema innova) como del DW (star model schema innova_dw)

/salida_parquet_csv: archivos de salida del notebook nb.ipynb en csv y parquet para storage data lake

/doc: documentación


Los modelos, tanto el normalizado para OLTP como el Star para DW (modelo de hechos y dimensiones) están documentados respectivamente en 


    innova OLTP: https://dbdiagram.io/d/innova-65ce2b5eac844320ae3ac4ac
    innova DW: https://dbdiagram.io/d/innova-DW-65ce2b78ac844320ae3ac74d


print("hola gil")
