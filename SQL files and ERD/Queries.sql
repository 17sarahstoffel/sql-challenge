-- query for employee number, last name, first name, sex, and salary
select e.emp_id, e.last_name, e.first_name, e.sex, s.salary
from employees as e
inner join salaries as s
on s.emp_id = e.emp_id;

-- query for first name, last name, hire date fro employees hired in 1986
select first_name, last_name, hire_date from employees
where hire_date between '1986-01-01' and '1986-12-31';

-- query for manager of each department with department number, department name, manager's employee number, first name, last name
select d.dept_id, d.dept_name, dm.emp_id, e.first_name, e.last_name
from departments as d
inner join dept_manager as dm
on dm.dept_id = d.dept_id
inner join employees as e
on e.emp_id = dm.emp_id;

-- query for deparment of each employee with employee number, last name, first name, and department name
select e.emp_id, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as de
on de.emp_id = e.emp_id
inner join departments as d
on d.dept_id = de.dept_id;

-- query for employee named Hercules B, list first name, last name, sex
select first_name, last_name, sex from employees
where first_name = 'Hercules' and last_name like 'B%';

-- query for employees in sales with employee number, last name, first name, department name
select e.emp_id, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as de
on de.emp_id = e.emp_id
inner join departments as d
on d.dept_id = de.dept_id
where dept_name = 'Sales';

-- query for employees in sales and developement departments with employee number, last name, first name, department name
select e.emp_id, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as de
on de.emp_id = e.emp_id
inner join departments as d
on d.dept_id = de.dept_id
where dept_name = 'Sales' or dept_name = 'Development';

--query for frequency count of employee last names in descending order
select last_name , count(last_name) as "total"
from employees
group by last_name
order by "total" desc;