/*
1. Create a MySQL Database called bamazon . 
2. Then create a Table inside of that database called products . 
3. The products table should have each of the following columns:
	item_id (unique id for each product)
	product_name (Name of product)
	department_name
	price (cost to customer)
	stock_quantity (how much of the product is available in stores)

4. Populate this database with around 10 different products. (i.e. Insert "mock" data rows into this database and table).
*/

DROP DATABASE IF EXISTS bamazon;
CREATE DATABASE bamazon;
USE bamazon;
CREATE TABLE products (item_id int not null auto_increment primary key
						, product_name varchar(100)
						, department_name varchar(100)
						, price decimal(10,2) NULL
						, stock_quantity INT NULL
					);	
INSERT INTO products (product_name, department_name, price, stock_quantity)
	VALUES ('Cavalier King Charles Spaniel', 'Pets', 1000.00, 1);
INSERT INTO products (product_name, department_name, price, stock_quantity)
	VALUES ('Dog Food 20lbs', 'Pets', 50.00, 10);
INSERT INTO products (product_name, department_name, price, stock_quantity)
	VALUES ('Dog Bed', 'Pets', 75.00, 5);
INSERT INTO products (product_name, department_name, price, stock_quantity)
	VALUES ('Leash', 'Pets', 15.00, 25);
INSERT INTO products (product_name, department_name, price, stock_quantity)
	VALUES ('Collar', 'Pets', 10.00, 30);
INSERT INTO products (product_name, department_name, price, stock_quantity)
	VALUES ('Sherry\'s Car', 'Auto', 666.13, 1);
INSERT INTO products (product_name, department_name, price, stock_quantity)
	VALUES ('Car Mat', 'Auto', 20.00, 12);
INSERT INTO products (product_name, department_name, price, stock_quantity)
	VALUES ('Windshield Wiper', 'Auto', 1.17, 17);
INSERT INTO products (product_name, department_name, price, stock_quantity)
	VALUES ('Left Wheel', 'Auto', 1.00, 100);
INSERT INTO products (product_name, department_name, price, stock_quantity)
	VALUES ('Right Wheel', 'Auto', 10000.00, 1);


