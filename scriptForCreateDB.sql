CREATE DATABASE IF NOT EXISTS warehousesDB;
USE warehousesDB;
# создание таблиц
CREATE TABLE brands(
  id int(20) NOT NULL AUTO_INCREMENT,
  brand varchar(20) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE categories(
  id int(20) NOT NULL AUTO_INCREMENT,
  category varchar(40) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE suppliers (
  id int(20) NOT NULL AUTO_INCREMENT,
  supplier varchar(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE warehouses (
  id int(20) NOT NULL AUTO_INCREMENT,
  warehouse varchar(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE products (
  id int(20) NOT NULL AUTO_INCREMENT,
  category_id int(20) NOT NULL,
  brand_id int(20) DEFAULT NULL,
  product varchar(45) NOT NULL,
  description varchar(100) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY FK_category_idx (category_id),
  KEY FK_brand_idx (brand_id),
  CONSTRAINT FK_brand FOREIGN KEY (brand_id) REFERENCES brands (id) ON UPDATE CASCADE,
  CONSTRAINT FK_category FOREIGN KEY (category_id) REFERENCES categories (id) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE expense (
  id int(20) NOT NULL AUTO_INCREMENT,
  action_time timestamp default current_timestamp ,
  ex_product_id int(20) NOT NULL,
  qty decimal(10,3) NOT NULL DEFAULT '0.000',
  ex_warehouse_id int(20) NOT NULL,
  ex_supplier_id int(20) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY FK_ex_product_idx (ex_product_id),
  KEY FK_ex_warehouse_idx (ex_warehouse_id),
  KEY FK_ex_supplier_idx (ex_supplier_id),
  CONSTRAINT FK_ex_product FOREIGN KEY (ex_product_id) REFERENCES products (id) ON UPDATE CASCADE,
  CONSTRAINT FK_ex_warehouse FOREIGN KEY (ex_warehouse_id) REFERENCES warehouses (id) ON UPDATE CASCADE,
  CONSTRAINT FK_ex_supplier FOREIGN KEY (ex_supplier_id) REFERENCES suppliers (id) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE coming (
  id int(20) NOT NULL AUTO_INCREMENT,
  coming_time timestamp default current_timestamp ,
  com_product_id int(20) NOT NULL,
  qty decimal(10,3) NOT NULL DEFAULT '0.000',
  com_warehouse_id int(20) NOT NULL,
  com_supplier_id int(20) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY FK_com_product_idx (com_product_id),
  KEY FK_com_warehouse_idx (com_warehouse_id),
  KEY FK_com_supplier_idx (com_supplier_id),
  CONSTRAINT FK_product_com FOREIGN KEY (com_product_id) REFERENCES products(id) ON UPDATE CASCADE,
  CONSTRAINT FK_warehouse_com FOREIGN KEY (com_warehouse_id) REFERENCES warehouses(id) ON UPDATE CASCADE,
  CONSTRAINT FK_supplier_com FOREIGN KEY (com_supplier_id) REFERENCES suppliers(id) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

#add record in table warehouses
INSERT INTO warehouses (warehouse) VALUES ('Склад №1'),('Склад №2'),('Склад №3'),('Склад №4');
#add record in table brands
INSERT INTO brands (brand) VALUES ('MAC'),('ACER'),('ASUS'),('HP'),('LENOVO'),('SAMSUNG');
#add record in table categories
INSERT INTO categories (category) VALUES ('Ультрабук'),('Ноутбук'),('Планшет');
#add record in table suppliers
INSERT INTO suppliers (supplier) VALUES ('Inter.kg'),('Notnik.kg'),('Istore.kg'),('Guangou');

INSERT INTO products (category_id, brand_id, product, description)
VALUES ((SELECT id FROM categories where categories.id=2),
(SELECT id FROM brands where brand='ASUS'),
'Vivibook HDD 1T, 7200 rpm', '');

INSERT INTO products (category_id, brand_id, product, description)
VALUES ((SELECT id FROM categories where categories.id=1),
(SELECT id FROM brands where brand='LENOVO'),
'Хромбук Lenovo Chromebook 300e', '');

INSERT INTO products (category_id, brand_id, product, description)
VALUES ((SELECT id FROM categories where categories.id=1),
(SELECT id FROM brands where brand='ACER'),
'TravelMate NVD118', '');

INSERT INTO products (category_id, brand_id, product, description)
VALUES ((SELECT id FROM categories where categories.id=1),
(SELECT id FROM brands where brand='ASUS'),
'ASUS E140MA', '');

INSERT INTO products (category_id, brand_id, product, description)
VALUES ((SELECT id FROM categories where categories.id=1),
(SELECT id FROM brands where brand='ASUS'),
'Ultrabook ASUS VIVOBOOK L510', '');

INSERT INTO products (category_id, brand_id, product, description)
VALUES ((SELECT id FROM categories where categories.id=1),
(SELECT id FROM brands where brand='HP'),
'PAVILION x360', '');

INSERT INTO products (category_id, brand_id, product, description)
VALUES ((SELECT id FROM categories where categories.id=2),
(SELECT id FROM brands where brand='LENOVO'),
'V14 Celeron', '');

INSERT INTO products (category_id, brand_id, product, description)
VALUES ((SELECT id FROM categories where categories.id=2),
(SELECT id FROM brands where brand='ACER'),
'Extensa Ex2215', '');

INSERT INTO products (category_id, brand_id, product, description)
VALUES ((SELECT id FROM categories where categories.id=2),
(SELECT id FROM brands where brand='LENOVO'),
'V15-82C3', '');

INSERT INTO products (category_id, brand_id, product, description)
VALUES ((SELECT id FROM categories where categories.id=2),
(SELECT id FROM brands where brand='LENOVO'),
'V114-82 Celeron DC', '');

INSERT INTO products (category_id, brand_id, product, description)
VALUES ((SELECT id FROM categories where categories.id=2),
(SELECT id FROM brands where brand='ACER'),
'A315 Intel DualCore', '');

INSERT INTO products (category_id, brand_id, product, description)
VALUES ((SELECT id FROM categories where categories.id=2),
(SELECT id FROM brands where brand='HP'),
'HP 240 G8', '');

INSERT INTO products (category_id, brand_id, product, description)
VALUES ((SELECT id FROM categories where categories.id=2),
(SELECT id FROM brands where brand='MAC'),
'AirMac 15', '');

INSERT INTO products (category_id, brand_id, product, description)
VALUES ((SELECT id FROM categories where categories.id=3),
(SELECT id FROM brands where brand='ASUS'),
'Transformer Book T300', '');

INSERT INTO products (category_id, brand_id, product, description)
VALUES ((SELECT id FROM categories where categories.id=3),
(SELECT id FROM brands where brand='SAMSUNG'),
'Surface Pro 8PV', '');

#add record in table coming
#record1
INSERT INTO coming ( qty,com_product_id,com_warehouse_id)
VALUES ( 150,
(SELECT id FROM products where id=1),
(SELECT id FROM warehouses  where id=1));