select * from employee;

-- SQL Window Functions. SQL Analytic Functions. 

-- OVER() function: It creates a window of result sets on which aggregate functions and other analytic functions act.  
-- group by clause is replaced by partition by in OVER(). 

-- Get maximum salary of the employees.

select max(salary) as max_salary from employee;

-- Question: Fetch all the employee details from the employee table along with a column holding maximum salary of all the employee. 

select e.*,
       max(salary) over() as max_salary
  from employee e; 
  
-- Question: Fetch all the employee details from the employee table who earns maximum salary.

select * from (
	select e.*,
		   max(salary) over() as max_salary
	  from employee e) x
 where x.salary = x.max_salary; 
 
 -- Using Subquery.
 select * from employee where salary = (select max(salary) from employee);

-- Get minimum salary for each department.
select dept_name, min(salary)
  from employee
group by dept_name;

-- Question: Fetch all the employee details along with a column holding minimum salary of the employee for each department. 

select e.*,
       min(salary) over(partition by dept_name) as min_salary  
  from employee e;
  
-- If we want to sort by salary.
select e.*,
       min(salary) over(partition by dept_name order by salary) as min_salary  
  from employee e;
  
-- ROW_NUMBER(): It assigns a unique identifiers (like 1,2,3, ..) to the window sepcified by OVER() function.

-- Question: Fetch first 2 employees from each department who joins the company. Assume that emp_id is sorted based on date of joining. 

select e.*,
	   ROW_NUMBER() OVER(PARTITION BY dept_name ORDER BY emp_id) as row_join
  from employee e;
 
 select * from (
	select e.*,
	   ROW_NUMBER() OVER(PARTITION BY dept_name ORDER BY emp_id) as row_join
	from employee e
 ) emp where emp.row_join < 3;
 
-- RANK(): It assigns ranks to the records in the window specified using OVER() function. It may assign same rank value to multiple records
-- in the window if those records satisfy same value/condition. It can skip a rank value if it assign same rank value to multiple records.

update employee
   set salary = 84567.11
 where emp_id = 'EMP008';

-- Question: Fetch top 3 employees in each department who earns top 3 salary packages.

select e.*,
	   RANK() OVER(PARTITION BY dept_name ORDER BY salary desc) as rank_salary
  from employee e;
  
select * from (
	select e.*,
		   RANK() OVER(PARTITION BY dept_name ORDER BY salary desc) as rank_salary
	  from employee e) emp
where emp.rank_salary < 4;

-- DENSE_RANK(): It is same as RANK() function but it does not skip rank value.

select e.*,
	   RANK() OVER(PARTITION BY dept_name ORDER BY salary desc) as rank_salary,
       DENSE_RANK() OVER(PARTITION BY dept_name ORDER BY salary desc) as dense_rank_salary
  from employee e;
  
select * from (
	select e.*,
		   DENSE_RANK() OVER(PARTITION BY dept_name ORDER BY salary desc) as dense_rank_salary
	  from employee e) emp
where emp.dense_rank_salary < 4;

-- LAG(<col>): Get the value of the previous record(s).
-- LEAD(<col>): Get the value of the next record(s).

-- Question: Write a query to display if the salary of an employee is higher, lower or equal to the previous employee for each department.

-- Demo of LAG().
select e.*,
       LAG(salary) OVER(PARTITION BY dept_name ORDER BY emp_id) as previous_emp_salary 
  from employee e;
  
-- LAG(salary, 2, 0) - col_name, how many lagging records, replace null value with.
  select e.*,
       LAG(salary, 2, 0) OVER(PARTITION BY dept_name ORDER BY emp_id) as previous_emp_salary 
  from employee e;
  
-- DEMO of LEAD().
select e.*,
       LEAD(salary) OVER(PARTITION BY dept_name ORDER BY emp_id) as next_emp_salary 
  from employee e;
  
-- Solution to the question.

select e.*,
       -- LAG(salary) OVER(PARTITION BY dept_name ORDER BY emp_id) as previous_emp_salary, 
       case when salary > LAG(salary) OVER(PARTITION BY dept_name ORDER BY emp_id) 
            then 'Higher than the previous employee salary.'
	        when salary < LAG(salary) OVER(PARTITION BY dept_name ORDER BY emp_id) 
            then 'Lower than the previous employee salary.'
	        when salary = LAG(salary) OVER(PARTITION BY dept_name ORDER BY emp_id) 
            then 'Same as the previous employee salary.'
            else 'Not Applicable.'
		end as salary_remark
  from employee e; 