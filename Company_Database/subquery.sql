select * from employee;
select * from department;

-- Question: Find the employees whose salary is more than the average salary earned by all employees.
select avg(salary) from employee; -- 85705.693000
select * from employee where salary > 85705.693000;

select *
  from employee
 where salary > (select avg(salary) 
				   from employee);
                   
-- Scalar Subquery: Returns 1 row and 1 column.
select e.*
  from employee e
  join (select avg(salary) as sal from employee) avg_sal
    on e.salary > avg_sal.sal;
    
-- Multiple row subquery: Returns multiple rows.
-- Subquery returns multiple rows and one column.
-- Question: Find the department details which do not have any employee.

select * 
  from department
 where dept_name not in
(select distinct dept_name from employee);

-- Subquery returns multiple rows and multiple columns.
-- Question: Find the employees who earn hightest salary in each department. 

-- 1. Find the department name and highest salary in each department.
select dept_name, max(salary)
  from employee 
group by dept_name;
 
-- 2. Find the employees comparing the result set in point 1.
select * 
  from employee 
 where (dept_name, salary) in (select dept_name, max(salary)
							  from employee 
							  group by dept_name);
                              
                              
-- Corelated Subquery: The Corelated Subquery is the subquery which is dependent or related to the outer/main query.
-- Question: Find the employee in each department who earn more than the average salary in that department.

select *
  from employee e1 
 where e1.salary > (
 select avg(salary) 
   from employee e2 
  where e2.dept_name = e1.dept_name
 )
 order by e1.dept_name;
 
select avg(salary) 
  from employee e2 
 where e2.dept_name = 'Admin'; -- 103087.411667
  
select * from employee where dept_name = 'Admin';

select * from employee where salary > 103087.411667 and dept_name = 'Admin';
  
-- Question: Find the departments which does not have any employee using coreleted subquery.
  
select * 
  from department d 
where not exists (
 select 1 from employee e where e.dept_name = d.dept_name);
 
-- Nested Subquery: Subquery inside another subquery. 
select * from sales order by store_id;

-- Question: Find the stores from the sales table whose sales is better than the average sales accross all the stores.
-- 1. Find the total sales of each stores. 
select store_name, 
       sum(price_amount) as total_sales 
  from sales
group by store_name
order by store_name;

-- 2. Find the average sales across all the stores.  
select avg(total_sales)
  from (select store_name, 
       sum(price_amount) as total_sales 
  from sales
group by store_name
order by store_name) accumulated_sales;

-- 3. Compare the total sales of each store with the average sales value. 
select *
  from (select store_name, 
       sum(price_amount) as total_sales 
  from sales
group by store_name
order by store_name) accumulated_sales
join (select avg(total_sales) as average_sales
  from (select store_name, 
       sum(price_amount) as total_sales 
  from sales
group by store_name
order by store_name) accumulated_sales) avg_sales
on accumulated_sales.total_sales > avg_sales.average_sales;

-- 4. Rewrite the above query using WITH clause.
-- WITH clause is used to generate temporary table in SQL using subquery. 

with accumulated_sales (store_name, total_sales) as (select store_name, sum(price_amount)
													   from sales group by store_name),
     average_sales (average_sales) as (select avg(total_sales)
										 from accumulated_sales)
select *
  from accumulated_sales ts
  join average_sales av
    on ts.total_sales > av.average_sales;
    
-- Subqueries can be used in following SQL clause:
-- 1. WHERE
-- 2. FROM
-- 3. SELECT
-- 4. HAVING

-- Subqury with SELECT Clause.
-- Question: Find all employees and add remarks to those employees who earn more than average salary. 

-- 1. Get the average salary of employees.
select avg(salary) from employee;

-- 2. Write the final query.
select *,
       (case when salary > (select avg(salary) from employee)
             then 'Earns higher salary than average.'
             else NULL
		end) as Remarks
  from employee;
  
-- In the above query, the subquery is executed for every row in the employee table. 
-- So, we can rewrite the above query using join to improve the performance.

select *,
	   (case when e.salary > avg_salary.sal
			 then 'Earns higher salary than average.'
             else NULL
		end) as Remarks
  from employee e 
  cross join (select avg(salary) as sal from employee) avg_salary;
  
-- Subqury with HAVING Clause.
-- Question: Find the stores from the sales table those have sold more units of product than the average unit sold by all the stores. 

with avg_qty_sales as (
select avg(total.total_qty) as average_qty
  from (select store_name, 
               sum(quantity) as total_qty
		  from sales
         group by store_name) total)
select store_name, 
	   sum(quantity) as total_qty
  from sales
 group by store_name
 having total_qty > (select * from avg_qty_sales)
  order by store_name;
  
  
  
  
  
  
  
  
  
  
  
  
                              
