-- Drop table if exists

-- Create new table to import data
CREATE TABLE departments (
	dept_no VARCHAR(4) primary key,
	dept_name VARCHAR(50)
);

CREATE TABLE employees (
	emp_no int primary key,
	birth_date date,
	firts_nme VARCHAR(50),
	last_name VARCHAR(50),
	gender VARCHAR(1),
	hire_date date
);

CREATE TABLE dept_emp (
	dept_emp_id serial primary key,
	emp_no int,	
	dept_no VARCHAR(4),
	from_date date,
	to_date date,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);


CREATE TABLE dept_manager (
	dept_mgr_id serial primary key,
	dept_no VARCHAR(4),
	emp_no int,
	from_date date,
	to_date date,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);



CREATE TABLE titles (
	emp_title_id serial primary key,
	emp_no int,
	title VARCHAR(50),
	from_date date,
	to_date date,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);


CREATE TABLE salaries(
	emp_salary_id serial primary key,
	emp_no int,
	salary money,
	from_date date,
	to_date date,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

