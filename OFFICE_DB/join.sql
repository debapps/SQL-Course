select * from employee;
select * from department;
select * from project;

-- Get all the employee name, salary and their corresponding department names.
select e.emp_name,
       e.emp_salary,
	   d.dept_name
  from employee e
inner join department d
on e.dept_id = d.dept_id;

-- Get all the employee name, salary, their corresponding department and project names.
select e.emp_name,
       e.emp_salary,
	   d.dept_name,
       p.project_name
  from employee e
inner join department d
on e.dept_id = d.dept_id
inner join project p
on e.project_id = p.project_id;

-- Left Join.

select d.dept_name,
	   e.emp_name
  from department d 
  left join employee e 
  on d.dept_id = e.dept_id;
  
-- Get the department names where no employee is deputed yet.
select d.dept_name
  from department d 
  left join employee e 
  on d.dept_id = e.dept_id
where e.emp_name is null;

-- Get the all projects with the deputed employee names.
select e.emp_name,
	   p.project_name,
       p.project_start_date,
       p.project_end_date
  from employee e 
  right join project p
  on e.project_id = p.project_id;
  
-- Full Join
select e.emp_name,
	   p.project_name,
       p.project_start_date,
       p.project_end_date
  from employee e 
  left join project p
  on e.project_id = p.project_id
  union
  select e.emp_name,
	   p.project_name,
       p.project_start_date,
       p.project_end_date
  from employee e 
  right join project p
  on e.project_id = p.project_id;
  
-- Self Join
-- Get all the employee name with there manager names.

select * from employee;

select e2.emp_name as 'Employee Name',
	   e1.emp_name as 'Manager Name'
  from employee e1, employee e2
 where e1.emp_id = e2.manager_id
order by e1.emp_id;
