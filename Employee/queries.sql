--1.Details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no,e.first_name,e.last_name,e.gender,s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no=s.emp_no

--2.Employees who were hired in 1986.
SELECT first_name,last_name,hire_date FROM employees WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

/*3.manager of each department with the following information: department number, 
department name, the manager's employee number, last name, first name, and start and end employment dates.*/

  
SELECT m.dept_no,d.dept_name,m.emp_no,e.first_name,e.last_name,m.from_date,m.to_date FROM departments AS d
INNER JOIN dept_manager AS m ON
d.dept_no= m.dept_no 
INNER JOIN employees AS e ON
m.emp_no=e.emp_no;

/*4. department of each employee with the following information:
 employee number, last name, first name, and department name.*/
 
 SELECT e.emp_no,e.first_name,e.last_name,m.dept_name FROM employees As e
 INNER JOIN dept_emp AS d ON
 e.emp_no=d.emp_no
 INNER JOIN departments AS m ON
 d.dept_no=m.dept_no;


--5.List all employees whose first name is "Hercules" and last names begin with "B."

SELECT e.first_name,e.last_name FROM employees AS e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


/*6.List all employees in the Sales department, including their 
employee number, last name, first name, and department name.*/

SELECT *  FROM departments;
SELECT * FROM employees;

SELECT e.emp_no,e.first_name,e.last_name,m.dept_name FROM employees As e
 INNER JOIN dept_emp AS d ON
 e.emp_no=d.emp_no
 INNER JOIN departments AS m ON
 d.dept_no=m.dept_no
 WHERE m.dept_name='Sales';
 
 
/*7. List all employees in the Sales and Development departments, 
including their employee number, last name, first name, and department name.*/
 
  SELECT e.emp_no,e.first_name,e.last_name , d.dept_name FROM employees AS e
 INNER JOIN dept_emp AS de ON
 e.emp_no=de.emp_no
 INNER JOIN departments AS d ON
 de.dept_no=d.dept_no
 WHERE d.dept_name='Development' OR  d.dept_name='Sales';
 
  
/*8.Descending order, list the frequency count of employee last names,
i.e., how many employees share each last name.*/


SELECT last_name, COUNT(*) count_last_name
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;



--BONUS-average salary by title.
SELECT  AVG(salary) AS avg_sal,t.title FROM salaries AS s , titles AS t
WHERE s.emp_no=t.emp_no
GROUP BY title;

--Epilogue
SELECT * FROM employees
WHERE emp_no=499942;

