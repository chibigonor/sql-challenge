drop table if exists departments; 
CREATE TABLE departments (
    dept_no VARCHAR(30),
    dept_name VARCHAR(30)
);
drop table if exists dept_emp; 
CREATE TABLE dept_emp (
    emp_no VARCHAR(30),
	dept_no VARCHAR(30)
);
drop table if exists dept_manager; 
CREATE TABLE dept_manager (
	dept_no VARCHAR(30),
	emp_no VARCHAR(30)
);
drop table if exists employees; 
CREATE TABLE employees (
    emp_no VARCHAR(30),
    emp_title_id VARCHAR(30),
	birth_date Date,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(30),
	hire_date date
);
drop table if exists salaries; 
CREATE TABLE salaries (
    emp_no VARCHAR(30),
    salary VARCHAR(30)
);
drop table if exists titles; 
CREATE TABLE titles (
    title_id VARCHAR(30),
    title VARCHAR(30)
);

SELECT * FROM departments;

SELECT * FROM dept_emp;

SELECT * FROM dept_manager;

SELECT * FROM employees;

SELECT * FROM salaries;

SELECT * FROM titles;

#1
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON e.emp_no = s.emp_no;
#2
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;
#3
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
INNER JOIN departments AS d ON dm.dept_no = d.dept_no
INNER JOIN employees AS e ON dm.emp_no = e.emp_no;
#4
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
INNER JOIN employees AS e ON de.emp_no = e.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no;

#5
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
#6
SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';
#7
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');
#8
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;




