-- Employee gender and salary
SELECT  
	A.emp_no
	,A.last_name
	,A.first_name
	,A.sex
	,B.salary
FROM employees as a
    LEFT JOIN salaries as B ON (A.emp_no = B.emp_no)
;

-- List of employees hired in 1986
SELECT 
	first_name
	,last_name
	,hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
;

-- Managers of departments
SELECT  
	A.dept_no
	,B.dept_name
	,A.emp_no
	,C.last_name
	,C.first_name
FROM dept_manager AS a
    INNER JOIN departments AS b ON (A.dept_no = B.dept_no)
    INNER JOIN employees AS c ON (A.emp_no = C.emp_no)
;

-- Department of each employee
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM employees AS e
    INNER JOIN dept_emp AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
ORDER BY e.emp_no;

-- Hercules B%
SELECT 
	first_name
	,last_name
	,birth_date
	,sex
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%'
;

-- Sales department
SELECT  
	A.emp_no
	,A.last_name
	,A.first_name
	,C.dept_name
FROM employees AS a
    INNER JOIN dept_emp AS B ON (A.emp_no = B.emp_no)
    INNER JOIN departments AS c ON (B.dept_no = C.dept_no)
WHERE C.dept_name = 'Sales'
;

-- Sales and development EEs
SELECT  
	A.emp_no
	,A.last_name
	,A.first_name
	,C.dept_name
FROM employees AS a
    INNER JOIN dept_emp AS b ON (A.emp_no = B.emp_no)
    INNER JOIN departments AS c ON (B.dept_no = C.dept_no)
WHERE C.dept_name IN ('Sales', 'Development')
;

-- Freq of last_name
SELECT DISTINCT
	last_name
	,COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC
;
