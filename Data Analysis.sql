
Data Analysis
	1	List the employee number, last name, first name, sex, and salary of each employee.
	2	List the first name, last name, and hire date for the employees who were hired in 1986.
	3	List the manager of each department along with their department number, department name, employee number, last name, and first name.
	4	List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
	5	List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
	6	List each employee in the Sales department, including their employee number, last name, and first name.
	7	List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
	8	List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

To avoid errors, import the data in the same order as the corresponding tables got created. And, remember to account for the headers when doing the imports.








    -- 1. List the employee number, last name, first name, sex, and salary of each employee (2 points)

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
  FROM "Employees" as e
  JOIN "Salaries" as s
	ON e.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)

SELECT e.emp_no, 
	   e.last_name, 
	   e.first_name, 
 	   e.hire_date
  FROM "Employees" as e
 WHERE e.hire_date between '1986-01-01' and '1986-12-31'
 ORDER BY e.hire_date ASC;

-- 3.List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)

 SELECT d.dept_no,
	   d.dept_name,
	   dm.emp_no,
	   e.last_name,
	   e.first_name
  FROM "Departments" as d
  JOIN "department_manager" as dm
    ON d.dept_no = dm.dept_no
  JOIN "Employees" as e
	ON dm.emp_no = e.emp_no;
	
-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)

 SELECT e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
   FROM "Employees" as e
   JOIN "Department_Employee" as de
     ON e.emp_no = de.emp_no
   JOIN "Departments" as d
	 ON de.dept_no = d.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)

 SELECT *
   FROM "Employees" as e
  WHERE first_name = 'Hercules'
    AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name (2 points)

SELECT e.emp_no,
		e.last_name,
		e.first_name
   FROM "Employees" as e
   JOIN "Department_Employee" as de
     ON e.emp_no = de.emp_no
   JOIN "Departments" as d
	 ON de.dept_no = d.dept_no
  WHERE d.dept_name = 'Sales';

-- 7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)

   SELECT e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
   FROM "Employees" as e
   JOIN "Department_Employee" as de
     ON e.emp_no = de.emp_no
   JOIN "Departments" as d
	 ON de.dept_no = d.dept_no
  WHERE d.dept_name = 'Sales' or d.dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) 

SELECT last_name, COUNT(last_name) as "frequency_of_last_name"
  FROM "Employees" as e
 GROUP BY last_name
 ORDER BY "frequency_of_last_name" DESC;