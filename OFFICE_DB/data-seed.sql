-- Create the database OFFICE_DB
CREATE DATABASE OFFICE_DB;

-- Use the newly created database
USE OFFICE_DB;

-- Create the project table
CREATE TABLE project (
  project_id CHAR(10) NOT NULL,
  project_name VARCHAR(100) NOT NULL,
  project_start_date DATE NOT NULL,
  project_end_date DATE,
  CONSTRAINT project_pk PRIMARY KEY (project_id)
);

-- Create the department table
CREATE TABLE department (
  dept_id CHAR(10) NOT NULL,
  dept_name VARCHAR(100) NOT NULL,
  CONSTRAINT department_pk PRIMARY KEY (dept_id)
);

-- Create the employee table with foreign key constraints
CREATE TABLE employee (
  emp_id CHAR(10) NOT NULL,
  emp_name VARCHAR(50) NOT NULL,
  emp_salary DECIMAL(10, 2) NOT NULL,
  dept_id CHAR(10) NOT NULL,
  manager_id CHAR(10),
  project_id CHAR(10),
  CONSTRAINT employee_pk PRIMARY KEY (emp_id),
  CONSTRAINT employee_fk_dept FOREIGN KEY (dept_id) REFERENCES department(dept_id),
  CONSTRAINT employee_fk_project FOREIGN KEY (project_id) REFERENCES project(project_id)
);

INSERT INTO department (dept_id, dept_name) VALUES
  ('D001', 'Marketing'),
  ('D002', 'Sales'),
  ('D003', 'Human Resources'),
  ('D004', 'Finance & Accounting'),
  ('D005', 'Information Technology'),
  ('D006', 'Research & Development'),
  ('D007', 'Customer Service'),
  ('D008', 'Operations'),
  ('D009', 'Legal'),
  ('D010', 'Executive Management');
  
  select * from department;

INSERT INTO project (project_id, project_name, project_start_date, project_end_date) VALUES
  ('P001', 'Website Redesign', '2024-01-15', '2024-03-31'),
  ('P002', 'Marketing Campaign - Q2', '2024-02-01', '2024-04-30'),
  ('P003', 'Product Launch - New Widget', '2023-12-01', '2024-02-29'),
  ('P004', 'Server Upgrade Project', '2024-03-01', '2024-05-15'),
  ('P005', 'Internal Training Program', '2024-04-01', '2024-06-30'),
  ('P006', 'New Product Development', '2024-02-10', NULL),
  ('P007', 'Social Media Marketing Strategy', '2024-03-15', '2024-05-31'),
  ('P008', 'Customer Relationship Management System Implementation', '2024-01-30', '2024-07-30'),
  ('P009', 'Legal Compliance Review', '2024-04-05', NULL),
  ('P010', 'Office Relocation Project', '2024-03-20', '2024-06-15');
  
select * from project;

insert into employee (
emp_id,
emp_name,
emp_salary,
dept_id,
manager_id,
project_id
) values 
('E001', 'Debaditya Bhar', 10000.50, 'D005', NULL, 'P001'),
('E002', 'Anuradha Dutta', 5500.70, 'D005', 'E001', 'P001'),
('E003', 'Monami Chatterjee', 4000.50, 'D005', 'E001', 'P001'),
('E004', 'Tania Das', 7500.50, 'D006', NULL, 'P003'),
('E005', 'Anushka Roy', 6500.50, 'D006', 'E004', 'P003'),
('E006', 'Sayak Aman', 8000.75, 'D001', NULL, 'P007'),
('E007', 'Madhurima Maitra', 7000.00, 'D001', 'E006', 'P007'),
('E008', 'Himi Mitra', 6300.00, 'D001', 'E006', 'P007');

insert into employee (
emp_id,
emp_name,
emp_salary,
dept_id,
manager_id,
project_id
) values 
('E009', 'Dipshita Dhar', 2300.00, 'D002', 'E001', NULL),
('E010', 'Malabika Bose', 2500.00, 'D008', 'E001', NULL);

select * from employee;