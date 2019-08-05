-- 1
SELECT 	e.emp_no "Employee Number", last_name "Last Name", 
		first_name "First Name",
		CASE WHEN e.gender = 'M' THEN 'Male' ELSE 
			CASE WHEN e.gender = 'F' THEN 'Female' ELSE 
			'Other' END END "Gender",
		s.salary "Salary"
  FROM employees e, 
  		salaries s
 WHERE e.emp_no = s.emp_no
 
-- 2

SELECT 	e.emp_no "Employee Number", e.birth_date "Birth Date",
		last_name "Last Name", first_name "First Name",
		CASE WHEN e.gender = 'M' THEN 'Male' ELSE 
			CASE WHEN e.gender = 'F' THEN 'Female' ELSE 
			'Other' END END "Gender",
		e.hire_date "Hire Date"
  FROM employees e
 WHERE date_part('year', e.hire_date) = 1986
 
-- 3
select 	d.dept_no "Dept Number", d.dept_name "Department", dm.emp_no "Employee Number",
		e.last_name "Last Name", e.first_name "First Name",
		dm.from_date "Start Date", dm.to_date "End Date",
		CASE WHEN dm.to_date > current_date THEN 'Current' ELSE 'Past' END "Status"
 from dept_manager dm, 
 	  employees e,
	  departments d
 where dm.emp_no = e.emp_no
   and dm.dept_no = d.dept_no
 order by 2, dm.to_date desc
 
--4 all ex-employees are in the last
  select e.emp_no "Employee Number",
		e.last_name "Last Name", e.first_name "First Name",
		cd.dept_name "Department"
  from employees e
  	left outer join  
	   (select de.emp_no, de.dept_no, d.dept_name, max(de.to_date) to_date
		  from dept_emp de,
				departments d
		 where de.to_date > current_date
		   and de.dept_no = d.dept_no
		 group by de.emp_no, de.dept_no, d.dept_name
	   ) cd
 	on e.emp_no = cd.emp_no  
 order by 4, 1
 
-- 5
select 	e.emp_no "Employee Number", last_name "Last Name", 
		first_name "First Name", birth_date "Birth Date",
		CASE WHEN e.gender = 'M' THEN 'Male' ELSE 
			CASE WHEN e.gender = 'F' THEN 'Female' ELSE 
			'Other' END END "Gender",
		hire_date
 from employees e
 where last_name like 'B%'
   and first_name = 'Hercules'
 order by 2, 3
 
-- 6
select e.emp_no "Employee Number", last_name "Last Name", 
		first_name "First Name", dept_name "Department"
   from employees e,
 		dept_emp de,
		departments d
 where de.dept_no = d.dept_no
   and e.emp_no = de.emp_no
   and d.dept_name = 'Sales'
 order by 2, 3
 
--7
select e.emp_no "Employee Number", last_name "Last Name", 
		first_name "First Name", dept_name "Department"
   from employees e,
 		dept_emp de,
		departments d
 where de.dept_no = d.dept_no
   and e.emp_no = de.emp_no
   and d.dept_name in ( 'Development', 'Sales')
 order by 4, 2, 3
 
-- 8 Easy Way
select  last_name "Last Name", count(emp_no)
  from employees e
 group by last_name
 order by 1
-- 8
select e.emp_no "Employee Number", last_name "Last Name", 
		first_name "First Name",
		e.gender "Gender",
		count(1) OVER (PARTITION BY  e.last_name)  "Last Name Frequency"
   from employees e
 order by 2, 3, 1