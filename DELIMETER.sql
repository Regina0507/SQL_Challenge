--Using the information you have to create a table schema for each of the six CSV files. Remember to specify data types, primary keys, foreign keys, and other constraints.

--For the primary keys check to see if the column is unique, otherwise create a [composite key](https://en.wikipedia.org/wiki/Compound_key). Which takes to primary keys in order to uniquely identify a row.

--* Be sure to create tables in the correct order to handle foreign keys.


-- Departments Table
CREATE TABLE departments (
    dept_no VARCHAR(15)   NOT NULL,
    dept_name VARCHAR(30)   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (dept_no)
);

COPY departments
	FROM 'C:\Users\Regina\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\departments.csv'
	DELIMITER ',' 
	CSV HEADER;
	
	
--Table employees
CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(30) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(10) NOT NULL,
	hire_date DATE, 
    CONSTRAINT pk_employees PRIMARY KEY (emp_no)
);

COPY employees
	FROM 'C:\Users\Regina\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\employees.csv'
	DELIMITER ',' 
	CSV HEADER;


--Table dept_emp
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(15) NOT NULL,
		CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
		CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

COPY dept_emp
	FROM 'C:\Users\Regina\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\dept_emp.csv'
	DELIMITER ',' 
	CSV HEADER;


--Table dept_manager
CREATE TABLE dept_manager (
	dept_no VARCHAR(15) NOT NULL,
	emp_no INT NOT NULL,
		CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
		CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no) REFERENCES departments(dept_no")
);

COPY dept_manager
	FROM 'C:\Users\Regina\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\dept_manager.csv'
	DELIMITER ',' 
	CSV HEADER;
	
	
--Table salaries
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
		CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

COPY salaries
	FROM 'C:\Users\Regina\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\salaries.csv'
	DELIMITER ',' 
	CSV HEADER;


--Table titles
CREATE TABLE titles (
    title_id VARCHAR(15) NOT NULL,
    title VARCHAR(30) NOT NULL,
	CONSTRAINT pk_titles PRIMARY KEY (title_id)
);

COPY titles
	FROM 'C:\Users\Regina\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\titles.csv'
	DELIMITER ',' 
	CSV HEADER;
	
 --List the following details of each employee: employee number, last name, first name, sex, and salary.
 
SELECT 
    e.emp_no,
	last_name,
	first_name,
	sex,
	salary
FROM employees AS e
LEFT JOIN salaries As s
ON e.emp_no = s.emp_no

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT 
	first_name,
	last_name,
	hire_date
FROM employees 
WHERE hire_date > '1985-12-31'
AND hire_date < '1987-01-01'
ORDER BY hire_date 
;

--List the department of each employee with the following information: 
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
 
 --List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
 
 
 SELECT 
	last_name,
	first_name,
	sex
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%'

--List all employees in the Sales departments, including their employee number, 
--last name, first name, and department name.

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


--7. List all employees in the Sales and Development departments, including their employee number, last name, 
--first name, and department name.
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





 







