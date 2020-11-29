/* -1-List the following details of each employee: employee number, last name, first name, sex, and salary.*/
SELECT 
    e.emp_no,
	last_name,
	first_name,
	sex,
	salary
FROM employees AS e
LEFT JOIN salaries As s
ON e.emp_no = s.emp_no

/*-2-List first name, last name, and hire date for employees who were hired in 1986.*/

SELECT 
	first_name,
	last_name,
	hire_date
FROM employees 
WHERE hire_date > '1985-12-31'
AND hire_date < '1987-01-01'
ORDER BY hire_date 
;
/*3. List the manager of each department with the following information: department number, 
department name, the manager's employee number, last name, first name.*/

select 
	dm.dept_no,
	d.dept_name,
	dm.emp_no,
	t.title,
	e.last_name,
	e.first_name 
FROM employees AS e
INNER JOIN dept_manager AS dm
ON e.emp_no = dm.emp_no
INNER JOIN departments AS d
ON d.dept_no = dm.dept_no
INNER JOIN titles AS t
ON t.title_id = e.emp_title_id




/*-4-List the department of each employee with the following information: */
--employee number, last name, first name, and department name.
SELECT
   e.emp_no,
   e.last_name,
   e.first_name,
   d.dept_name
 FROM employees AS e
 LEFT JOIN dept_emp as de
 ON e.emp_no = de.emp_no
 LEFT JOIN departments as d
 on d.dept_no =de.dept_no
 
 /* 5--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B." */
 
 
 SELECT 
	last_name,
	first_name,
	sex
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%'

/*6--List all employees in the Sales departments, including their employee number, 
--last name, first name, and department name.*/

SELECT 
    e.emp_no, 
	e.last_name, 
	e.first_name, 
	d.dept_name
FROM employees AS e
LEFT JOIN dept_emp
ON e.emp_no = dept_emp.emp_no
LEFT JOIN departments AS d
ON dept_emp.dept_no = d.dept_no
WHERE dept_name = 'Sales'


/*--7. List all employees in the Sales and Development departments, including their employee number, last name, 
--first name, and department name.*/
SELECT 
    e.emp_no, 
	e.last_name, 
	e.first_name, 
	d.dept_name
FROM employees AS e
LEFT JOIN dept_emp
ON e.emp_no = dept_emp.emp_no
LEFT JOIN departments AS d
ON dept_emp.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'

/*8--In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.*/

SELECT 
last_name, COUNT(last_name) as frequency_count
FROM Employees
GROUP BY last_name
ORDER BY  frequency_count  desc;
