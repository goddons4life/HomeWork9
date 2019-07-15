--1.List of employee,last name,first name,gender,salaries--
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees,salaries
WHERE employees.emp_no = salaries.emp_no;

--2.employees hired in 1986--
SELECT employees.last_name, employees.first_name
FROM employees
WHERE employees.hire_date >= '01/01/86'
AND employees.hire_date <= '12/31/86';

--3.Department managers--
SELECT departments.dept_no,departments.dept_name, dept_manager.from_date,dept_manager.to_date,employees.emp_no,employees.first_name,employees.last_name
FROM departments,dept_manager,employees
WHERE Dept_manager.emp_no = employees.emp_no
AND departments.dept_no = dept_manager.dept_no;

--4.Department of each employee with details--
SELECT dept_emp.dept_no, employees.last_name,employees.first_name,departments.dept_name
FROM departments,employees,dept_emp
WHERE dept_emp.emp_no = employees.emp_no
AND departments.dept_no = dept_emp.dept_no;

--5.Emloyee with first name "Hercules" and last name begin with "B."
SELECT employees.last_name, employees.first_name
FROM employees
WHERE employees.first_name = 'Hercules'
AND employees.last_name like 'B%';

--6.Employees in the sales deparment--
SELECT employees.emp_no,employees.last_name,employees.first_name,departments.dept_name,dept_emp.dept_no
FROM employees,departments,dept_emp
WHERE dept_emp.emp_no = employees.emp_no
AND departments.dept_no = dept_emp.dept_no 
AND departments.dept_name = 'Sales';

--7.Employees in the sales and Development deparments--
SELECT employees.emp_no,employees.last_name,employees.first_name,departments.dept_name,dept_emp.dept_no
FROM employees,departments,dept_emp
WHERE dept_emp.emp_no = employees.emp_no
AND departments.dept_no = dept_emp.dept_no 
AND (departments.dept_name like 'D%' 
OR departments.dept_name like 'S%');

--8.Employee last name count in --
SELECT employees.last_name, COUNT(*)
FROM employees
GROUP BY employees.last_name
ORDER BY 2 DESC; 
