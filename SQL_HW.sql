
Once you have a complete database, do the following:


### List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no AS EmployeeNo, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

### List employees who were hired in 1986.
SELECT employees.emp_no AS EmployeeID, employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE (( (employees.hire_date) >=#1986/01/01 00:00:00#
and (employees.hire_date) < #1987/01/01 00:00:00#));



### List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT departments.dept_no, departments.dept_name, manager.emp_no, employees.first_name, employees.last_name, employees.hire_date, manager.from_date, manager.to_date
FROM (manager INNER JOIN employees ON manager.[emp_no] = employees.[emp_no]) INNER JOIN departments ON manager.dept_no = departments.dept_no;

### List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments INNER JOIN (employees INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no) ON departments.dept_no = dept_emp.dept_no;

### List all employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.emp_no AS EmployeeID, employees.birth_date, employees.first_name, employees.last_name, employees.gender, employees.hire_date
FROM employees
WHERE (((employees.first_name)="Hercules") 
    AND 
    ( left((employees.last_name),1) = "B") );



### List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees INNER JOIN (departments INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no) ON employees.emp_no = dept_emp.emp_no
WHERE ((departments.dept_name)="Sales");

### List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees INNER JOIN (departments INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no) ON employees.emp_no = dept_emp.emp_no
WHERE ((departments.dept_name)="Sales") OR ((departments.dept_name)="Development");




### In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT DISTINCT employees.last_name AS [Last], Count(employees.last_name) AS [Count]
FROM employees
GROUP BY employees.last_name
ORDER BY Count(employees.last_name) DESC;