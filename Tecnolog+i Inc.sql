--TABLA CLIENTES
CREATE TABLE customers(
 customer_id NUMBER PRIMARY KEY,
 nombre VARCHAR2(50),
 apellido VARCHAR2(50),
 fecha_registro DATE,
 email VARCHAR2(100),
 telefono VARCHAR2(15)
 );
 
 --TABLA PRODUCTOS
CREATE TABLE products(
product_id NUMBER PRIMARY KEY,
nombre_producto VARCHAR2(100),
categoria VARCHAR2(50),
precio NUMBER(10,2),
stock NUMBER
);

-- Tabla Ventas
CREATE TABLE sales (
    sale_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    product_id NUMBER,
    cantidad NUMBER,
    fecha_venta DATE,
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(product_id)
);

--TABLA PERSONAL DE VENTAS
CREATE TABLE sales_staff(
staff_id NUMBER PRIMARY KEY,
nombre VARCHAR2(50),
apellido VARCHAR(50),
email VARCHAR2(100),
telefono VARCHAR2(15),
total_venta NUMBER(10,2)
);

--Insertar datos en mi tabla customers
INSERT INTO customers(customer_id,nombre,apellido,fecha_registro, email,telefono)
VALUES(1,'césar','fuentes',TO_DATE('2024-10-26','yyyy-MM-DD'),'fuentescamus@gmail.com','56977991026');

INSERT INTO customers(customer_id,nombre,apellido,fecha_registro, email,telefono)
VALUES(2,'michel','argandoña',TO_DATE('2024-10-25','yyyy-MM-DD'),'michargandoña@gmail.com','56955121123');

INSERT INTO customers(customer_id,nombre,apellido,fecha_registro, email,telefono)
VALUES(3,'javiera','valeria',TO_DATE('2024-10-23','yyyy-MM-DD'),'javieritaxox@gmail.com','56967983322');

INSERT INTO customers(customer_id,nombre,apellido,fecha_registro, email,telefono)
VALUES(4,'gabriel','veron',TO_DATE('2024-10-22','yyyy-MM-DD'),'gabitoveroncito@gmail.com','56912121126');

INSERT INTO customers(customer_id,nombre,apellido,fecha_registro, email,telefono)
VALUES(5,'linda','leigton',TO_DATE('2024-10-18','yyyy-MM-DD'),'lindiwawi@gmail.com','56997881010');

--insertar datos en mi tabla products
INSERT INTO products(product_id,nombre_producto, categoria,precio, stock)
VALUES(1,'Laptop Lenovo','computadoras',1200.00,20);

INSERT INTO products(product_id,nombre_producto, categoria,precio, stock)
VALUES(2,'Mouse Logitech','Accesorios',25.00,50);

INSERT INTO products(product_id,nombre_producto, categoria,precio, stock)
VALUES(3,'Teclado Microsoft','Accesorios',45.00,35);

INSERT INTO products(product_id,nombre_producto, categoria,precio, stock)
VALUES(4,'Monitor Samsung','Monitores',300.00,15);

INSERT INTO products(product_id,nombre_producto, categoria,precio, stock)
VALUES(5,'Impresora HP','Impresoras',150.00,25);

--insertar datos en mi tabla sales
INSERT INTO sales(sale_id,customer_id,product_id,cantidad,fecha_venta)
VALUES(1,1,1,1,TO_DATE('2024-10-27','yyyy-MM-DD'));

INSERT INTO sales(sale_id,customer_id,product_id,cantidad,fecha_venta)
VALUES(2,2,2,2,TO_DATE('2024-10-28','yyyy-MM-DD'));

INSERT INTO sales(sale_id,customer_id,product_id,cantidad,fecha_venta)
VALUES(3,3,3,1,TO_DATE('2024-10-27','yyyy-MM-DD'));

INSERT INTO sales(sale_id,customer_id,product_id,cantidad,fecha_venta)
VALUES(4,4,4,1,TO_DATE('2024-10-28','yyyy-MM-DD'));

INSERT INTO sales(sale_id,customer_id,product_id,cantidad,fecha_venta)
VALUES(5,5,5,1,TO_DATE('2024-10-27','yyyy-MM-DD'));

--insertar datos en mi tabla sale_staff
INSERT INTO sales_staff (staff_id, nombre, apellido, email, telefono, total_venta)
VALUES (1, 'Carlos', 'Mora', 'carlos.mora@mail.com', '123456789', 5000.00);

INSERT INTO sales_staff (staff_id, nombre, apellido, email, telefono, total_venta)
VALUES (2, 'Lucía', 'Rojas', 'lucia.rojas@mail.com', '987654321', 3000.00);

INSERT INTO sales_staff (staff_id, nombre, apellido, email, telefono, total_venta)
VALUES (3, 'José', 'Díaz', 'jose.diaz@mail.com', '5647382910', 2500.00);

INSERT INTO sales_staff (staff_id, nombre, apellido, email, telefono, total_venta)
VALUES (4, 'Ana', 'Martínez', 'ana.martinez@mail.com', '0912345678', 4500.00);

INSERT INTO sales_staff (staff_id, nombre, apellido, email, telefono, total_venta)
VALUES (5, 'Marcos', 'Ramírez', 'marcos.ramirez@mail.com', '0789456123', 6000.00);

--visualización de mis cuatro tablas creadas
SELECT*FROM customers;
SELECT*FROM products;
SELECT*FROM sales;
SELECT*FROM sales_staff;

--DESAFIOS
--primer desafio:
SELECT nombre || ' ' || apellido AS "Nombre Completo", 
       fecha_registro AS "Fecha de Registro"
FROM customers
WHERE fecha_registro >= ADD_MONTHS(SYSDATE, -1)
ORDER BY fecha_registro DESC;

--Segundo desafio:
SELECT nombre_producto, 
       ROUND(precio + (precio * 0.15), 1) AS "Precio Incrementado", 
       precio AS "Precio Original"
FROM products
WHERE nombre_producto LIKE '%A'
  AND stock > 10
ORDER BY "Precio Incrementado" ASC;

--tercer desafio.
SELECT 
    nombre || ' ' || apellido AS "Nombre Completo", 
    email AS "Correo Electrónico",
    SUBSTR(nombre, 1, 4) || LENGTH(email) || SUBSTR(apellido, -3) AS "Contraseña por Defecto"
FROM sales_staff
ORDER BY apellido DESC, nombre ASC;

