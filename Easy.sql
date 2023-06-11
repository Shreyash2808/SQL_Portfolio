CREATE DATABASE Assignment;

USE assignment;

CREATE TABLE countries (
NAME VARCHAR(70) ,
Population INT,
Capital VARCHAR(70)
);

INSERT INTO countries
VALUES
('China',1382,'Beijing'),
('India',1326,'Delhi'),
('United States',324,'Washington D.C.'),
('Indonesia',		260	, 	'Jakarta'),
('Brazil'	,	209	 ,'Brasilia'),
('Pakistan'	,	193	 	,'Islamabad'),
('Nigeria'	,187	, 	'Abuja'),
('Bangladesh'	,	163	 ,	'Dhaka'),
('Russia'	,	143	 ,	'Moscow'),
('Mexico',	128	 ,	'Mexico City'),
('Japan',	126	 ,	'Tokyo'),
('Philippines'	,102, 	'Manila'),
('Ethiopia'	,	101	 ,	'Addis Ababa'),
('Vietnam' 	,	94	 ,	'Hanoi'),
('Egypt',	93	, 	'Cairo'),
('Germany'	,81	, 	'Berlin'),
('Iran'	,80	 ,	'Tehran'),
('Turkey',	79	, 	'Ankara'),
('Congo',79	 ,	'Kinshasa'),
('France' , 64	, 	'Paris'),
('United Kingdom', 65 ,	 'London'),
('Italy', 60,	'Rome'),
('South Africa', 	55	 ,	'Pretoria'),
('Myanmar'	,54	 ,	'Naypyidaw');



-- Add a couple of countries of your choice
INSERT INTO countries
VALUES
('cuba', 678, 'havana'),
('denmark', 456 , 'copenagen'),
('ghana', 678, 'accra'),
('iraq', 900, 'baghdad'),
('Qatar', 582 , 'Doha');


SELECT  * FROM countries;


SET SQL_safe_updates = 0;


-- Change ‘Delhi' to ‘New Delhi'
UPDATE countries
SET capital = 'new Delhi'
WHERE NAME= 'india';



-- Rename the table countries to big_countries .
RENAME TABLE countries TO Big_countries;


CREATE TABLE product(
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(255) NOT NULL UNIQUE,
Supplier_id INT,
FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id) 
);

CREATE TABLE supplier(
supplier_id INT PRIMARY KEY,
supplier_name VARCHAR(255),
location VARCHAR(255)
);

CREATE TABLE stock(
id INT PRIMARY KEY,
product_id INT,
balance_stock INT,
FOREIGN KEY (Product_id) REFERENCES product(product_id)
);


-- Modify the supplier table to make supplier name unique and not null
ALTER TABLE supplier MODIFY COLUMN supplier_name VARCHAR(255) UNIQUE NOT NULL;



SELECT * FROM emp;


-- a.	Add a column called deptno
ALTER TABLE emp ADD COLUMN deptno INT;



-- b. Set the value of deptno in the following order
UPDATE emp
SET deptno = 
	case 
		WHEN MOD(emp_no,2) = 0 THEN 20
        WHEN MOD(emp_no,3) = 0 THEN 30
        WHEN MOD(emp_no,4) = 0 THEN 40
        WHEN MOD(emp_no,5) = 0 THEN 50
    ELSE 10
    END;
    
    
-- Create a unique index on the emp_id column.
CREATE UNIQUE INDEX emp_no_ID ON emp (emp_no);




CREATE VIEW emp_sal AS
SELECT 
emp_no, first_name, last_name, salary
FROM 
emp
ORDER BY Salary DESC;



SELECT * FROM emp_sal;

