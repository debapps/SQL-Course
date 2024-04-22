-- Create database
CREATE DATABASE COMPANY;

-- Use the database.
USE COMPANY;

-- Create the employee Table.
CREATE TABLE employee (
  emp_id VARCHAR(10) PRIMARY KEY,
  emp_name VARCHAR(30) NOT NULL,
  dept_name VARCHAR(30) NOT NULL,
  salary DECIMAL(10,2) NOT NULL
);

-- Insert into employee table.
INSERT INTO employee (emp_id, emp_name, dept_name, salary)
VALUES
("EMP001","John Doe","Admin",100000.00),
("EMP002","Jane Smith","IT",85000.75),
("EMP003","Michael Lee","Finance",92456.98),
("EMP004","Amanda Johnson","HR",78921.33),
("EMP005","David Williams","Operations",65487.12),
("EMP006","Olivia Jones","Admin",82145.60),
("EMP007","Noah Brown","IT",98732.41),
("EMP008","Sophia Garcia","Finance",89563.09),
("EMP009","William Miller","HR",72310.54),
("EMP010","Emily Davis","Operations",59874.27),
("EMP011","James Garcia","Admin",112500.78),
("EMP012","Isabella Hernandez","IT",78421.00),
("EMP013","Charles Young","Finance",105236.89),
("EMP014","Ashley Moore","HR",81742.91),
("EMP015","Daniel Johnson","Operations",68315.42),
("EMP016","Sophia Allen","Admin",95123.77),
("EMP017","Christopher Hernandez","IT",82098.33),
("EMP018","Elizabeth Walker","Finance",75421.65),
("EMP019","Matthew Garcia","HR",92874.10),
("EMP020","Jennifer Lopez","Operations",53147.98),
("EMP021","Robert Brown","Admin",120000.00),
("EMP022","Margaret Miller","IT",87345.21),
("EMP023","Joseph Hernandez","Finance",110000.00),
("EMP024","Catherine Jones","HR",79832.55),
("EMP025","Andrew Davis","Operations",62541.89),
("EMP026","Sarah Thomas","Admin",108754.32),
("EMP027","Daniel Garcia","IT",91234.78),
("EMP028","Evelyn Moore","Finance",84567.11),
("EMP029","Richard Garcia","HR",87321.45),
("EMP030","Samantha Lopez","Operations",70198.56);

select * from employee;

-- Create department table.
CREATE TABLE department (
  dept_id VARCHAR(10) PRIMARY KEY,
  dept_name VARCHAR(30) NOT NULL,
  dept_loc VARCHAR(30) NOT NULL
);

-- Populate department table data.
INSERT INTO department (dept_id, dept_name, dept_loc)
VALUES
  ('D001', 'Admin', 'Delhi'),
  ('D002', 'Finance', 'Mumbai'),
  ('D003', 'IT', 'Kolkata'),
  ('D004', 'Operations', 'Bhubaneswar'),
  ('D005', 'HR', 'Pune'),
  ('D006', 'Research & Development', 'Chennai'),
  ('D007', 'Marketing', 'Kochi'),
  ('D008', 'Sales', 'Bangalore')
;
select * from department;

-- Sales Table
CREATE TABLE sales (
  sales_id INT PRIMARY KEY AUTO_INCREMENT,
  sales_date DATE,
  product_name VARCHAR(50) NOT NULL,
  store_id VARCHAR(10) NOT NULL,
  store_name VARCHAR(50) NOT NULL,
  quantity INT NOT NULL,
  price_amount DECIMAL(10,2) NOT NULL
);

INSERT INTO sales (sales_id, sales_date, product_name, store_id, store_name, quantity, price_amount)
VALUES
(1,'2023-05-16','Trousers','S002','Store S002',5,21.57),
(2,'2023-07-28','Jeans','S002','Store S002',5,55.03),
(3,'2024-03-26','Shirt','S004','Store S004',3,88.19),
(4,'2023-05-07','Dress','S001','Store S001',2,63.21),
(5,'2023-05-23','Shirt','S004','Store S004',2,12.94),
(6,'2023-10-23','Trousers','S004','Store S004',4,98.07),
(7,'2023-10-09','Shirt','S005','Store S005',2,47.67),
(8,'2023-05-14','Jeans','S003','Store S003',5,61.99),
(9,'2024-02-12','Bag','S004','Store S004',5,62.54),
(10,'2023-04-21','Trousers','S002','Store S002',3,67.2),
(11,'2023-11-22','Trousers','S005','Store S005',1,60.45),
(12,'2023-10-20','Dress','S005','Store S005',2,11.82),
(13,'2023-08-22','Shoes','S001','Store S001',4,82.49),
(14,'2024-02-29','Shoes','S005','Store S005',4,55.32),
(15,'2023-12-19','Hat','S001','Store S001',2,93.92),
(16,'2024-03-03','Trousers','S003','Store S003',2,88.5),
(17,'2023-12-07','Dress','S002','Store S002',3,88.2),
(18,'2023-12-07','Jeans','S001','Store S001',4,20.15),
(19,'2024-01-10','Shirt','S003','Store S003',3,51.37),
(20,'2023-12-18','Trousers','S005','Store S005',3,97.33),
(21,'2023-12-23','Watch','S002','Store S002',4,23.0),
(22,'2023-06-22','Jeans','S001','Store S001',5,59.52),
(23,'2023-11-03','Hat','S001','Store S001',3,70.55),
(24,'2023-12-01','Bag','S004','Store S004',2,59.83),
(25,'2023-07-03','Trousers','S003','Store S003',1,71.72),
(26,'2024-03-15','Trousers','S003','Store S003',2,95.62),
(27,'2024-03-27','Bag','S005','Store S005',5,40.93),
(28,'2023-10-14','Shoes','S003','Store S003',4,24.74),
(29,'2023-12-31','Hat','S001','Store S001',2,51.7),
(30,'2023-12-16','Hat','S002','Store S002',3,11.9),
(31,'2023-09-10','Dress','S003','Store S003',1,34.31),
(32,'2023-10-10','Dress','S001','Store S001',5,22.36),
(33,'2023-10-02','Trousers','S004','Store S004',4,87.8),
(34,'2023-09-08','Watch','S002','Store S002',3,17.97),
(35,'2023-06-07','Jeans','S003','Store S003',3,86.46),
(36,'2023-11-29','Dress','S003','Store S003',2,90.98),
(37,'2023-10-11','Shirt','S005','Store S005',4,28.55),
(38,'2023-05-19','Dress','S002','Store S002',2,68.4),
(39,'2023-08-19','Trousers','S003','Store S003',1,55.73),
(40,'2023-05-23','Jeans','S005','Store S005',3,82.4),
(41,'2024-02-13','Shoes','S003','Store S003',2,39.25),
(42,'2023-12-16','Jeans','S003','Store S003',1,61.19),
(43,'2023-12-27','Shirt','S004','Store S004',2,59.2),
(44,'2023-05-29','Shoes','S001','Store S001',5,93.87),
(45,'2023-05-04','Shoes','S002','Store S002',3,69.99),
(46,'2023-09-03','Watch','S004','Store S004',2,58.8),
(47,'2023-07-28','Trousers','S003','Store S003',2,27.94),
(48,'2023-12-22','Shirt','S004','Store S004',5,39.65),
(49,'2023-05-21','Jeans','S003','Store S003',1,99.16),
(50,'2023-12-28','Shoes','S001','Store S001',2,16.7)
;

select * from sales 
order by store_id;

CREATE TABLE product (
  product_id VARCHAR(10) PRIMARY KEY,
  product_name VARCHAR(50) NOT NULL,
  product_category VARCHAR(20) NOT NULL,
  brand VARCHAR(20) NOT NULL,
  price DECIMAL(10,2) NOT NULL
);

INSERT INTO product (product_id, product_name, product_category, brand, price)
VALUES
  ('P001', 'iPhone 14 Pro Max', 'Phone', 'Apple', 139900.00),
  ('P002', 'Galaxy S23 Ultra', 'Phone', 'Samsung', 119999.00),
  ('P003', 'Reno 8 Pro', 'Phone', 'Oppo', 45990.00),
  ('P004', 'V25 Pro', 'Phone', 'Vivo', 35990.00),
  ('P005', 'Narzo 50A Prime', 'Phone', 'Realme', 11999.00),
  ('P006', 'XPS 13', 'Laptop', 'Dell', 79990.00),
  ('P007', 'Galaxy Book 2 Pro', 'Laptop', 'Samsung', 98990.00),
  ('P008', 'IdeaPad Slim 3', 'Laptop', 'Lenovo', 25990.00),
  ('P009', 'AirPods Pro', 'Headphone', 'Apple', 24900.00),
  ('P010', 'Galaxy Buds Pro', 'Headphone', 'Samsung', 17990.00),
  ('P011', 'Sony WH-1000XM5', 'Headphone', 'Sony', 32990.00),
  ('P012', 'OnePlus Buds Z2', 'Earphone', 'OnePlus', 1999.00),
  ('P013', 'Samsung Galaxy Buds Live', 'Earphone', 'Samsung', 6990.00),
  ('P014', 'Apple Watch Series 8', 'Smartwatch', 'Apple', 41900.00),
  ('P015', 'Galaxy Watch 5 Pro', 'Smartwatch', 'Samsung', 28990.00),
  ('P016', 'Amazfit Bip 3 Pro', 'Smartwatch', 'Amazfit', 7999.00),
  ('P017', 'iPad Air M1', 'Tablet', 'Apple', 51900.00),
  ('P018', 'Galaxy Tab S8 Ultra', 'Tablet', 'Samsung', 109990.00),
  ('P019', 'Realme Pad Mini', 'Tablet', 'Realme', 8999.00),
  ('P020','Pixel 7 Pro','Phone','Google',84999.00),
  ('P021','Redmi Note 12 Pro+ 5G','Phone','Xiaomi',29999.00),
  ('P022','OnePlus 11 Pro','Phone','OnePlus',64999.00), 
  ('P023','iPhone 13 Mini','Phone','Apple',69900.00),
  ('P024','Galaxy A54 5G','Phone','Samsung',34999.00),
  ('P025','iQOO Neo 7','Phone','Vivo',39990.00),
  ('P026','Narzo 50 Pro 5G','Phone','Realme',15999.00),
  ('P027','Macbook Air (M2 chip)','Laptop','Apple',129900.00),
  ('P028','IdeaPad Gaming 3','Laptop','Lenovo',74990.00),
  ('P029','VivoBook S15','Laptop','ASUS',49990.00),
  ('P030','Xperia 1 IV','Laptop','Sony',189990.00),
  ('P031','Inspiron 15 (Latest Model)','Laptop','Dell',64990.00),
  ('P032','Chromebook Spin 713','Laptop','Acer',32990.00),
  ('P033','Mi Notebook Ultra','Laptop','Xiaomi',79990.00);
  
  select * from product;

