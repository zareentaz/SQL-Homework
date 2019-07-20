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


 
 



 
