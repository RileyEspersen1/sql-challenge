CREATE TABLE titles(
emp_title_id varchar, --FK >- employees.emp_title_id
title varchar,
PRIMARY KEY (emp_title_id)
)

CREATE TABLE employees(
emp_no numeric, --FK >- salaries.emp_no FK >- dept_manager.emp_no FK >- dept_emp.emp_no
emp_title_id varchar,
birthdate date,
first_name varchar,
last_name varchar,
sex char,
hire_date date,
PRIMARY KEY (emp_no),
FOREIGN KEY (emp_title_id) REFERENCES titles(emp_title_id)
)

CREATE TABLE departments(
dept_no varchar, --FK >- dept_manager.dept_no FK >- dept_emp.dept_no
dept_name varchar,
PRIMARY KEY (dept_no)
)
	
CREATE TABLE dept_emp(
emp_no numeric,
dept_no varchar,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
PRIMARY KEY (dept_no, emp_no)
)

CREATE TABLE salaries(
emp_no numeric,
salary money,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
PRIMARY KEY (emp_no)
)

CREATE TABLE dept_manager(
dept_no varchar,
emp_no numeric,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
PRIMARY KEY (dept_no, emp_no)
)

SELECT * FROM dept_emp

DELETE FROM departments
DELETE FROM titles
DELETE FROM salaries
DELETE FROM dept_manager
DELETE FROM employees
DELETE FROM dept_emp



