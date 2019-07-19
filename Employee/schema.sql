--create department table
CREATE TABLE departments(
dept_no VARCHAR(20)NOT NULL PRIMARY KEY,
dept_name VARCHAR(30) NOT NULL
);

--Create dep_emp table
CREATE TABLE dept_emp(
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
dept_no VARCHAR(255)NOT NULL,
from_date date,
to_date date
);
DROP TABLE dept_emp;

--create employees table
CREATE TABLE employees(
emp_no INT NOT NULL PRIMARY KEY,
birth_date date,
first_name VARCHAR(255) NOT NULL ,
last_name VARCHAR(255) NOT NULL,
gender VARCHAR(10) NOT NULL,
hire_date date
);
DROP TABLE emplopyees;
SELECT * FROM dept_emp;

--create dept_manager table
CREATE TABLE dept_manager
(
dept_no VARCHAR(255)NOT NULL,
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
from_date date,
to_date date
);
DROP TABLE dept_manager;
)

--create salary table
CREATE TABLE salaries(
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
salary INT NOT NULL,
from_date date,
to_date date
);

--create titles table
CREATE TABLE titles(
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
title VARCHAR(255) NOT NULL,
from_date date,
to_date date
);

--Details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no,e.first_name,e.last_name,e.gender,s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no=s.emp_no

--Employees who were hired in 1986.
SELECT first_name,last_name,hire_date FROM employees WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

/*manager of each department with the following information: department number, 
department name, the manager's employee number, last name, first name, and start and end employment dates.*/

  
/*SELECT e.first_name,e.last_name,e.emp_no FROM 
(SELECT d.dept_name,d.dept_no,m.emp_no,m.from_date,m.to_date FROM departments AS d
INNER JOIN dept_manager AS m ON
d.dept_no= m.dept_no;) AS tab,employees AS e
WHERE e.emp_no= m.emp_no;


SELECT e.first_name,e.last_name,e.emp_no FROM employees AS e 
INNER JOIN  table ON
e.emp_no=tab.emp_no 
(SELECT d.dept_name,d.dept_no,m.emp_no,m.from_date,m.to_date FROM departments AS d
INNER JOIN dept_manager AS m ON
d.dept_no= m.dept_no) AS tab;*/
 
SELECT m.dept_no,d.dept_name,m.emp_no,e.first_name,e.last_name,m.from_date,m.to_date FROM departments AS d
INNER JOIN dept_manager AS m ON
d.dept_no= m.dept_no 
INNER JOIN employees AS e ON
m.emp_no=e.emp_no;

/* department of each employee with the following information: 
 employee number, last name, first name, and department name.*/
 
 SELECT e.emp_no,e.first_name,e.last_name,m.dept_name FROM employees As e
 INNER JOIN dept_emp AS d ON
 e.emp_no=d.emp_no
 INNER JOIN departments AS m ON
 d.dept_no=m.dept_no;


--List all employees whose first name is "Hercules" and last names begin with "B."

SELECT e.first_name,e.last_name FROM employees AS e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


/*List all employees in the Sales department, including their 
employee number, last name, first name, and department name.*/

--SELECT *  FROM departments;

SELECT e.emp_no,e.first_name,e.last_name,m.dept_name FROM employees As e
 INNER JOIN dept_emp AS d ON
 e.emp_no=d.emp_no
 INNER JOIN departments AS m ON
 d.dept_no=m.dept_no
 WHERE m.dept_name='Sales';
 
/* List all employees in the Sales and Development departments, 
including their employee number, last name, first name, and department name.*/
 
  SELECT e.emp_no,e.first_name,e.last_name , d.dept_name FROM employees AS e
 INNER JOIN dept_emp AS de ON
 e.emp_no=de.emp_no
 INNER JOIN departments AS d ON
 de.dept_no=d.dept_no
 WHERE d.dept_name='Development' OR  d.dept_name='Sales';
 
 --Tried with Subqueries--
 SELECT emp_no,first_name,last_name FROM employees
 WHERE emp_no IN
 ( 
   SELECT emp_no FROM dept_emp 
   WHERE dept_no IN
   (
     SELECT dept_no FROM departments AS d
     WHERE dept_name='Development'
	)
 );
	 
 
 

/*Descending order, list the frequency count of employee last names,
i.e., how many employees share each last name.*/


SELECT last_name, COUNT(*) count_last_name
FROM employees
GROUP BY last_name
HAVING COUNT(*) > 1
ORDER BY last_name DESC;

 
