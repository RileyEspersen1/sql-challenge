--List the following details of each employee: 
--employee number, last name, first name, sex, and salary.
SELECT
employees.emp_no AS "Employee Number", 
employees.first_name "First Name",
employees.last_name "Last Name", 
employees.sex AS "Sex", 
salaries.salary AS "Salary"
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT 
employees.first_name AS "First Name",
employees.last_name "Last Name",
employees.hire_date AS "Hire Date"
FROM employees
WHERE employees.hire_date BETWEEN '1/1/1986' AND '12/31/1986';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number,
--last name, first name.
SELECT 
departments.dept_no AS "Department Number",
departments.dept_name AS "Department Name",
dept_manager.emp_no AS "Employee Number",
employees.first_name AS "First Name",
employees.last_name AS "Last Name"
FROM dept_manager
INNER JOIN employees ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON departments.dept_no = dept_manager.dept_no;

--List the department of each employee with the following 
--information: employee number, last name, first name, and department name.
SELECT
employees.emp_no AS "Employee Number",
employees.first_name AS "First Name",
employees.last_name AS "Last Name",
departments.dept_name AS "Department Name"
FROM dept_emp
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no;

--List first name, last name, and sex for employees whose first name
--is "Hercules" and last names begin with "B."
SELECT
employees.first_name AS "First Name",
employees.last_name AS "Last Name",
employees.sex AS "Sex"
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE  'B%'

--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT
employees.emp_no AS "Employee Number",
employees.first_name AS "First Name",
employees.last_name AS "Last Name",
departments.dept_name AS "Department Name"
FROM departments 
INNER JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no
WHERE departments.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
SELECT
employees.emp_no AS "Employee Number",
employees.first_name AS "First Name",
employees.last_name AS "Last Name",
departments.dept_name AS "Department Name"
FROM departments 
INNER JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT employees.last_name, COUNT(employees.last_name) AS "Last Name Count"
FROM employees
GROUP BY employees.last_name
ORDER BY "Last Name Count" DESC;

SELECT employees.first_name, employees.last_name, salaries.salary
FROM employees
INNER JOIN salaries ON salaries.emp_no = employees.emp_no
WHERE employees.emp_no = '499942'
--I like the joke about my ID number :)
