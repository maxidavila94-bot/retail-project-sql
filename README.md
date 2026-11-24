# Proyecto Retail - Base de Datos SQL

Este repositorio contiene el script SQL correspondiente a la pre-entrega del proyecto **Retail**, con la creación de las tablas principales, restricciones de integridad referencial y carga inicial segura de datos en PostgreSQL.

## Contenido del repositorio

* `script.sql`: Contiene las sentencias **DDL** (`CREATE TABLE`, `PRIMARY KEY`, `FOREIGN KEY`, `CHECK`, `UNIQUE`) y **DML** (`INSERT` dentro de una transacción `BEGIN ... COMMIT`, `UPDATE` y `DELETE` con `WHERE`).

## Cómo ejecutar el script

1. Abrir **pgAdmin** (o **DBeaver**) y conectarse a tu servidor PostgreSQL.
2. Crear una nueva base de datos llamada `retail_project`.
3. Abrir una ventana de consultas (**Query Tool**) conectada a la base de datos `retail_project`.
4. Copiar y pegar todo el contenido de `script.sql` (o abrir el archivo desde el gestor) y ejecutarlo completo (`F5` en pgAdmin).

## Estructura del esquema

* **`clientes`**: Almacena los datos de los clientes con `cliente_id` autoincremental, `email` único y no nulo, y validación de mayoría de edad (`edad >= 18`).
* **`productos`**: Registra el catálogo con validación de `precio > 0` y `stock >= 0`.
* **`ventas`**: Relaciona clientes y productos mediante claves foráneas (`FOREIGN KEY`) y valida que `cantidad > 0` y `total_venta > 0`.
