/*
	MySQL script file for creating tables, creating user, and giving user privileges
    @file root_script.sql
    @author Junhui Huang, Yenny Huang
    @version 1.02 May, 2023
*/

USE bodega;

-- Creating tables for Products, Prices, and Purchases
CREATE TABLE Products (
	product_id INT NOT NULL auto_increment,
    product_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (product_id),
    UNIQUE(product_name)
);

CREATE TABLE Prices (
	product_id INT,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Purchases (
	purchase_id INT NOT NULL auto_increment PRIMARY KEY,
    product_id INT NOT NULL,
    purchase_date DATE NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE Prices;
DROP TABLE Purchases;
DROP TABLE Products;

-- Creating user and giving user privileges
CREATE USER 'username'@'localhost' IDENTIFIED BY 'P@33W0rd';
SELECT `user`, `host` FROM `mysql`.`user`;
SHOW grants;

GRANT SELECT ON `bodega`.`Products` TO 'username'@'localhost';
GRANT INSERT ON `bodega`.`Products` TO 'username'@'localhost';
GRANT DELETE ON `bodega`.`Products` TO 'username'@'localhost';
GRANT UPDATE ON `bodega`.`Products` TO 'username'@'localhost';

GRANT SELECT ON `bodega`.`Prices` TO 'username'@'localhost';
GRANT INSERT ON `bodega`.`Prices` TO 'username'@'localhost';
GRANT DELETE ON `bodega`.`Prices` TO 'username'@'localhost';
GRANT UPDATE ON `bodega`.`Prices` TO 'username'@'localhost';
GRANT ALTER ON `bodega`.`Prices` TO 'username'@'localhost';

GRANT SELECT ON `bodega`.`Purchases` TO 'username'@'localhost';
GRANT INSERT ON `bodega`.`Purchases` TO 'username'@'localhost';
GRANT DELETE ON `bodega`.`Purchases` TO 'username'@'localhost';
GRANT UPDATE ON `bodega`.`Purchases` TO 'username'@'localhost';
GRANT ALTER ON `bodega`.`Purchases` TO 'username'@'localhost';

SHOW GRANTS FOR 'username'@'localhost';






