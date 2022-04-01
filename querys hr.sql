select * from employees

# Write a query to list the number of jobs available in the employees table
select count(distinct job_id) 
from employees

# Write a query to get the total salaries payable to employees
select sum(salary) from employees

# Write a query to get the minimum salary from employees table
select first_name, last_name, min(salary)
from employees
group by employee_id
order by min(salary) asc
limit 1

# Write a query to get the maximum salary of an employee working as a Programmer
select first_name, last_name, max(salary) as salary, job_id
from employees
where job_id = 'it_prog'
group by employee_id
limit 1

# Write a query to get the average salary and number of employees working the department 90
select avg(salary) as AVG_Salary, count(distinct employee_id) as employees
from employees
where department_id = 90

# Write a query to get the highest, lowest, sum, and average salary of all employees.
select max(salary), min(salary), sum(salary), avg(salary)
from employees

#  Write a query to get the number of employees with the same job
select count(*), job_id
from employees
group by job_id

# Write a query to get the difference between the highest and lowest salaries.
select max(salary)-min(salary) as Diff_salary
from employees

# Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id
order by min(salary) desc

# 10 - Write a query to get the department ID and the total salary payable in each department. 
select department_id, sum(salary)
from employees
group by department_id

# Write a query to get the average salary for each job ID excluding programmer.
select job_id, avg(salary) 
from employees
where job_id != 'IT_PROG'
group by job_id

# Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only
select job_id, sum(salary), max(salary), min(salary), avg(salary)
from employees
where department_id = 90
group by job_id

# Write a query to get the department ID and the total salary payable in each department
select department_id, sum(salary) as total_salary
from employees
group by department_id

# Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000
select job_id, max(salary)
from employees
group by job_id
having max(salary) > 4000

# Write a query to display the full name (first and last name), and salary for those employees who earn below 6000
select concat(first_name,' ',last_name) as Full_Name, salary
from employees
where salary < 6000
order by salary desc
limit 10

# Write a query to display the first and last_name, department number and salary for those employees who earn more than 8000
select concat(first_name, ' ', last_name) as Full_Name,
		department_id, salary
from employees
where salary > 8000

# Write a query to display the first and last name, and department number for all employees whose last name is “McEwen”
select first_name, last_name, department_id
from employees
where last_name = 'McEwen'

#  Write a query in SQL to display all the information for all employees without any department number
select * from employees
where department_id is null

# Write a query in SQL to display all the information about the department Marketing.
select *
from departments
where department_name = 'Marketing'

/* Write a query in SQL to display the full name (first and last), hire date, salary,
and department number for those employees whose first name does not containing the letter M 
and make the result set in ascending order by department number */
select concat(first_name,' ',last_name) as full_name, 
	hire_date,
    salary,
    department_id
from employees
where first_name not like '%M%'
order by department_id asc

/* Write a query in SQL to display all the information of employees whose salary
 is in the range of 8000 and 12000 and commission is not null or department number 
 is except the number 40, 120 and 70 and they have been hired before June 5th, 1987 */
select * from employees
where salary between 8000 and 12000
		and commission_pct is not null
        or department_id not in (40,120,70)
        and hire_date < 1987-06-05

# Write a query in SQL to display the full name (first and last name), and salary for all employees who does not earn any commission
select concat(first_name,' ',last_name) as full_name, salary
from employees
where commission_pct = 0

/* Write a query in SQL to display the full name (first and last), the phone number and email separated by hyphen, and salary,
 for those employees whose salary is within the range of 9000 and 17000. The column headings assign with Full_Name, Contact_Details
 and Remuneration respectively */
select concat(first_name,' ',last_name) as full_name, concat(PHONE_NUMBER,' - ',EMAIL) as Contact_Details, salary as Remuneration
from employees
where salary between 9000 and 17000
 
# Write a query in SQL to display the first and last name, and salary for those employees whose first name is ending with the letter m
select first_name, last_name, salary
from employees
where first_name like '%m'

/*  Write a query in SQL to display the full name (first and last) name, and salary,
 for all employees whose salary is out of the range 7000 and 15000 and make the result set in ascending order by the full name. */
 
select concat(first_name,' ', last_name) as Full_Name, salary
from employees
where salary not between 7000 and 15000
order by Full_Name asc

/*  Write a query in SQL to display the full name (first and last), job id and date of hire
for those employees who was hired during November 5th, 2007 and July 5th, 2009 */

select concat(first_name,' ', last_name) as Full_Name, job_id, hire_date
from employees
where hire_date	 between '2007-11-05' and '2009-07-05'

/* Write a query in SQL to display the the full name (first and last name), and department number
for those employees who works either in department 70 or 90. */

select concat(first_name,' ',last_name) as Full_Name, department_id
from employees
where department_id in (70,90)

/* Write a query in SQL to display the full name (first and last name), salary, and manager number
for those employees who is working under a manager */
select concat(first_name,' ',last_name) as Full_Name, salary, manager_id
from employees
where manager_id is not null

/* 15 - Write a query in SQL to display all the information from Employees table for those
employees who was hired before June 21st, 2002 */
select * from employees
where hire_date < '2002-06-21'

/* Write a query to display the name (first_name, last_name) and salary 
for all employees whose salary is not in the range $10,000 through $15,000 */
select concat(first_name,' ',last_name) as full_name, salary
from employees
where salary not between 10000 and 15000 

/* Write a query to display the name (first_name, last_name) and department ID
of all employees in departments 30 or 100 in ascending order */
select concat(first_name,' ',last_name) as full_name, department_id
from employees
where department_id in (30, 100)
order by department_id

/* Write a query to display the name (first_name, last_name) and salary for all employees 
whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100. */
select concat(first_name,' ',last_name) as full_name, salary
from employees
where salary not between 10000 and 15000 and department_id in (30,100)

# Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987.
select concat(first_name,' ',last_name) as full_name, hire_date
from employees
where extract(year from hire_date) = 1987

# Write a query to display the first_name of all employees who have both "b" and "c" in their first name
select first_name
from employees
where first_name like '%b%' and first_name like '%c%'

/* Write a query to find the name (first_name, last_name) and the salary of the employees
who have a higher salary than the employee whose last_name='Bull' */
select first_name, last_name, salary
from employees
where salary > (select salary
				from employees
                where last_name = 'Bull')
order by salary desc

# Write a query to find the name (first_name, last_name) of all employees who works in the IT department.
select first_name, last_name
from employees
where department_id in	
				(select distinct DEPARTMENT_ID
                from employees
                where job_id = 'IT_prog')

# Write a query to find the name (first_name, last_name) of the employees who are managers.
select first_name, last_name 
from employees
where employee_id in (select distinct MANAGER_ID
					from employees)


#  Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary.
select first_name, last_name, salary
from employees
where salary > (
select avg(salary)
from employees)

# Write a query to find the name (first_name, last_name), and salary of the employees whose salary is equal to the minimum salary for their job grade.
select first_name, last_name, salary
from employees
where salary in (select MIN_SALARY
				from jobs
                where job_id = jobs.job_id)

/* Write a query to find the name (first_name, last_name), and salary 
of the employees who earns more than the average salary and works in any of the IT departments */
select first_name, last_name, salary
from employees
where salary > (select avg(salary) from employees)
and department_id = (select department_id
					from employees
                    where job_id like '%it%'
                    group by department_id)

# Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Mr. Bell
select first_name, last_name, salary
from employees
where salary > (select salary
				from employees
                where last_name like '%bell%')

/* Write a query to find the name (first_name, last_name), and salary 
of the employees who earn the same salary as the minimum salary for all departments. */
select first_name, last_name, salary
from employees
where salary in (select min(salary)
				from employees
                group by department_id) 
and department_id in (select DEPARTMENT_ID
					from departments)
                    
/* Write a query to find the name (first_name, last_name), and salary of the 
employees whose salary is greater than the average salary of all departments.*/
select first_name, last_name, salary
from employees
where salary > ALL (select avg(salary)
				from employees
                group by department_id)
                
/* Write a query to find the name (first_name, last_name) and salary of the employees who earn a salary that is
 higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary of the lowest to highest */
 select first_name, last_name, salary
 from employees
 where salary > all (select salary
					from employees
					where job_id = 'SH_CLERK')
order by salary asc

# Write a query to find the name (first_name, last_name) of the employees who are not supervisors.
'You use the 'exists' operator when you want to identify that a relationship exists without regard for the quantity.
Using the 'exists' operator, your subquery can return zero, one, or many rows, and the condition simply checks whether
the subquery returned one or more row.
Using 'not exists' to check for subqueries that return no rows.'

select first_name, last_name
from employees
where employee_id not in (select distinct manager_id
						from employees); 

SELECT b.first_name,b.last_name 
FROM employees b 
WHERE NOT EXISTS (SELECT 'X' FROM employees a WHERE a.manager_id = b.employee_id);

# Write a query to display the employee ID, first name, last name, and department names of all employees
select employee_id, first_name, last_name, (select DEPARTMENT_NAME
											from departments 
                                            where employees.DEPARTMENT_ID = departments.DEPARTMENT_ID) as department_name
from employees
order by department_name

# Write a query to display the employee ID, first name, last name, salary of all employees whose salary is above average for their departments
select employee_id, first_name, last_name, salary
from employees as a
where salary > (select avg(salary)
				from employees
                where DEPARTMENT_ID = a.DEPARTMENT_ID)

# Write a query to find the 5th maximum salary in the employees table.
select distinct salary
from employees as a
where 5 = (select count(distinct salary)
			from employees as b
            where b.salary >= a.salary)
'The reference to a.salary at the very end of the subquery is what makes the
subquery correlated; the containing query must supply values for a.salary for
the subquery to execute. In this case, the containing query retrieves all rows
from the employees table and executes the subquery once for each employee , passing in the
appropriate distinct salary for each execution. If the subquery returns the value 5,
then the filter condition is met, and the row is added to the result set.'

# Write a query to find the 4th minimum salary in the employees table

select distinct salary
from employees as a
where 4 = (select count(distinct salary)
			from employees
            where salary <= a.salary)

# Write a query to select last 10 records from a table
select * from employees as a
where 10 = (select * from employees
			order by employee_id desc
            limit 10)
            
/* Write a query in SQL to display the full name (first and last), the phone number and 
email separated by hyphen, and salary, for those employees whose salary is within the range 
of 9000 and 17000. The column headings assign with Full_Name, Contact_Details and Remuneration respectively */

select concat(first_name, ' ', last_name) as full_name, concat(PHONE_NUMBER,' - ', EMAIL) as contact_details, salary as remuneration
from employees 
where salary between 9000 and 17000
            
/* Write a query in SQL to display the employee Id, first name, job id, and department
 number for those employees whose department number equals 30, 40 or 90. */
 select employee_id, first_name, job_id, department_id
 from employees
 where department_id in (30, 40, 90)
            
# Write a query to get the number of employees with the same job
select job_id, count(distinct employee_id) as numbers
from employees
group by job_id

# Write a SQL statement to get the minimum salary for all jobs and jobs not in IT
select JOB_ID, min(salary) as minimum_salary, max(salary) as maximum_salary, avg(salary) as avg_salary
from employees
where JOB_ID not like '%IT'
group by JOB_ID

# Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
select manager_id, min(salary) as salary_mg
from employees
where manager_id is not null
group by manager_id
order by salary_mg desc

# Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments
select a.LOCATION_ID, a.STREET_ADDRESS, a.CITY, a.STATE_PROVINCE, b.COUNTRY_NAME
from locations as a, countries as b
where b.COUNTRY_ID = a.COUNTRY_ID;

SELECT location_id, street_address, city, state_province, country_name
FROM locations
NATURAL JOIN countries;

# Write a query to find the name (first_name, last name), department ID and name of all the employees
select concat(a.first_name, ' ', a.last_name) as full_name, a.department_id, b.DEPARTMENT_NAME
from employees a
inner join departments b
on a.DEPARTMENT_ID = b.DEPARTMENT_ID

select concat(a.first_name, ' ', a.last_name) as full_name, a.department_id, b.DEPARTMENT_NAME
from employees a, departments b
where a.DEPARTMENT_ID = b.DEPARTMENT_ID

# Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.
select concat(a.first_name, ' ', a.last_name) as full_name, a.job_id, a.department_id, b.DEPARTMENT_NAME
from employees a
inner join departments b
on a.DEPARTMENT_ID = b.DEPARTMENT_ID
where b.location_id = 2400;

select concat(a.first_name, ' ', a.last_name) as full_name, a.job_id, a.department_id, b.DEPARTMENT_NAME
from employees a, departments b
where a.department_id = b.department_id and b.location_id = 2400;

SELECT e.first_name, e.last_name, e.job_id, e.department_id, d.department_name 
FROM employees e 
JOIN departments d 
ON (e.department_id = d.department_id) 
JOIN locations l ON 
(d.location_id = l.location_id) 
WHERE LOWER(l.city) = 'London';

# Write a query to find the name (first_name, last_name) of the employees who are managers.
select first_name, last_name
from employees
where EMPLOYEE_ID in (
select distinct manager_id
from employees)

# Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary.
select first_name, last_name, salary
from employees
where salary > (
select avg(salary)
from employees)

/* Write a query to find the name (first_name, last_name), and salary of the employees who earn
 the same salary as the minimum salary for all departments. */
select first_name, last_name, salary
from employees 
where salary in (
select min(salary)
from employees)
 
# Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
select MANAGER_ID, min(SALARY) as salary
from employees
group by MANAGER_ID
order by salary asc
limit 1

# Write a query to get the department ID and the total salary payable in each department.
select department_id, sum(salary)
from employees
group by department_id

# Write a query to get the average salary for each job ID excluding programmer
select job_id, avg(salary) 
from employees
where job_id not like '%PROG%'
group by job_id

# Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only
select job_id, sum(salary), max(salary), min(salary), avg(salary)
from employees
where department_id = '90'
group by job_id

# Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000
select job_id, max(salary) as salary
from employees
group by job_id
having salary >= 4000

# Write a query to get the average salary for all departments employing more than 10 employees.
select department_id, avg(salary) as salary
from employees
group by department_id
having count(distinct employee_id) > 10;

# Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary.
select FIRST_NAME, LAST_NAME, SALARY
from employees
where salary > (select avg(salary)
				from employees);
                
/* Write a query to find the name (first_name, last_name), and salary of the employees who earns more than
 the average salary and works in any of the IT departments */
select FIRST_NAME, LAST_NAME, SALARY
from employees
where salary > (select avg(SALARY)
				from employees) 
and DEPARTMENT_ID in (select department_id 
					from departments
					where DEPARTMENT_NAME like '%IT%');

# Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Mr. Bell.                    
select FIRST_NAME, LAST_NAME, SALARY
from employees
where salary > (select salary
				from employees
                where LAST_NAME like '%Bell%');

/* Write a query to find the name (first_name, last_name), and salary of the employees
 whose salary is greater than the average salary of all departments. */
select FIRST_NAME, LAST_NAME, SALARY
from employees
where salary > all(select avg(SALARY)
				from employees
                group by DEPARTMENT_ID);
                
# Write a query to display the employee ID, first name, last name, and department names of all employees
select a.employee_id, a.first_name, a.last_name, b.department_name
from employees as a, departments as b
where a.DEPARTMENT_ID = b.DEPARTMENT_ID

select employee_id, first_name, last_name, (select department_name
											from departments as a
											where a.department_id = b.department_id) as department
from employees as b;
                                            
# Write a query to display the employee ID, first name, last name, salary of all employees whose salary is above average for their departments
select employee_id, first_name, last_name, salary
from employees as a
where salary > (select avg(SALARY)
				from employees
                where DEPARTMENT_ID = a.DEPARTMENT_ID);

# Write a query to get 3 maximum salaries.
select distinct salary
from employees as a
where 3 >= (select count(distinct SALARY)
			from employees
            where SALARY >= a.salary);
            
# Write a query in SQL to display the first name, last name, salary, and job grade for all employees.
select a.first_name, a.last_name, a.salary, b.job_title
from employees as a, jobs as b
where a.JOB_ID = b.JOB_ID

select first_name, last_name, salary, job_title
from employees
natural join jobs

/* Write a query in SQL to display the first name, last name, department number and name, for all 
employees who have or have not any department. */
select a.first_name, a.last_name, a.department_id, b.department_name
from employees as a
join departments as b
on a.department_id = b.department_id

/* Write a query in SQL to display the employee Id, first name, job id, and department number for 
those employees whose department number equals 30, 40 or 90*/
select employee_id, first_name, job_id, department_id
from employees
where department_id in (30,40,90);

#  Write a query in SQL to display those departments where any manager is managing 4 or more employees.
select DEPARTMENT_ID
from employees
group by DEPARTMENT_ID
having count(DEPARTMENT_ID) >= 4;

/* Write a query in SQL to display the details of the employees who have no commission percentage and 
salary within the range 7000 to 12000 and works in that department which number is 50. */
select * from employees
where COMMISSION_PCT is null
and SALARY between 7000 and 12000
and DEPARTMENT_ID = 50

# Write a query in SQL to display the details of jobs which minimum salary is greater than 9000.
select * from jobs
where min_salary > 9000;

/* Write a query to display the employee number, name( first name and last name ) and job title
 for all employees whose salary is more than any salary of those employees whose job title is PU_MAN.
 Exclude job title PU_MAN. */
select employee_id, concat(first_name, ' ', last_name) as Complete_Name, job_id
from employees
where salary >= (select salary
				from employees 
                where job_id = 'PU_MAN')
and JOB_ID != 'PU_MAN'			

/* Write a query to display the employee number, name( first name and last name ) and job title for all
 employees whose salary is more than any average salary of any department. */
 select employee_id, concat(first_name,' ',last_name) as Full_Name, job_id
 from employees
 where salary > all(select avg(salary)
				from employees
                group by department_id);

# Write a query to display the department id and the total salary for those departments which contains at least one employee.
select a.DEPARTMENT_ID, b.total_salary
from departments a, (select DEPARTMENT_ID, (salary) as total_salary
					from employees
                    group by DEPARTMENT_ID) b
where b.DEPARTMENT_ID = a.DEPARTMENT_ID

/*  Write a query to display the employee id, name ( first name and last name ) and the job id column with a modified title
 SALESMAN for those employees whose job title is ST_MAN and DEVELOPER for whose job title is IT_PROG. */
select employee_id,
		concat(first_name,' ',last_name) as Full_Name,
		case when job_id = 'ST_MAN' then 'SALESMAN'
			when job_id = 'IT_PROG' then 'DEVELOPER'
            else job_id
        end as designation,
        salary
from employees;

/*  Write a query in SQL to display those employees who contain a letter z to their first name and also 
display their last name, department, city, and state province. */
select a.first_name, a.last_name, b.department_name, c.city, c.state_province
from employees a, departments b, locations c
where a.DEPARTMENT_ID = b.DEPARTMENT_ID and b.LOCATION_ID = c.LOCATION_ID 
and a.FIRST_NAME like '%z%';

select a.first_name, a.last_name, b.department_name, c.city, c.state_province
from employees a
	join departments b
		on a.DEPARTMENT_ID = b.DEPARTMENT_ID
	join locations c
		on b.LOCATION_ID = c.LOCATION_ID
where a.FIRST_NAME like '%z%';

/* Write a query in SQL to display the first and last name and salary for those employees
 who earn less than the employee earn whose number is 182. */
select first_name, last_name, salary 
from employees 
where salary < (select salary
				from employees
                where EMPLOYEE_ID = 182)
 
select a.first_name, a.last_name, a.salary 
from employees a
join employees b
on a.salary < b.salary 
and b.employee_id = 182    

# Write a query in SQL to display the first name of all employees including the first name of their manager
select a.first_name as worker_name , b.first_name as manager_name
from employees a
join employees b
on a.manager_id = b.employee_id

#  Write a query in SQL to display the department name, city, and state province for each department.
select d.department_name, l.city, l.state_province
from departments d, locations l
where d.location_id = l.location_id

select d.department_name, l.city, l.state_province
from departments d
join locations l
on d.location_id = l.location_id 

/* Write a query in SQL to display the first name, last name, department number and
name, for all employees who have or have not any department. */
select e.first_name, e.last_name, e.department_id, d.department_name
from employees e
join departments d
on e.department_id = d.department_id

/*Write a query in SQL to display job title, full name (first and last name ) of employee,
and the difference between maximum salary for the job and salary of the employee */
select j.JOB_TITLE, concat(e.FIRST_NAME,' ',e.LAST_NAME) as full_name, (j.MAX_SALARY - e.SALARY) as difference
from employees e, jobs j
where e.job_id = j.job_id

select j.JOB_TITLE, concat(e.FIRST_NAME,' ',e.LAST_NAME) as full_name, (j.MAX_SALARY - e.SALARY) as difference
from employees e
natural join jobs j

/* Write a query in SQL to display the name of the department, average salary and
 number of employees working in that department who got commission */
 select d.DEPARTMENT_NAME, avg(e.SALARY) as avg_salary, count(e.EMPLOYEE_ID) as n_employees
 from employees e
 join departments d
 on e.DEPARTMENT_ID = d.DEPARTMENT_ID
 group by e.department_id
 
 /* Write a query to display the employee id, name ( first name and last name ), salary
 and the SalaryStatus column with a title HIGH and LOW respectively for those employees
 whose salary is more than and less than the average salary of all employees. */
select employee_id, concat(first_name,' ',last_name) as full_name, salary, 
	case when salary < (select avg(salary) from employees) then 'LOW'
		 else 'HIGH'
	end as Salary_status
from employees

# Write a subquery that returns a set of rows to find all departments that do actually have one or more employees assigned to them
select department_name
from departments
where department_id in (
	select distinct(department_id)
    from employees);
    
#  Write a query which is looking for the names of all employees whose salary is greater than 50% of their department’s total salary bill
select concat(e1.first_name,' ',e1.last_name) as full_name
from employees e1
where salary > (select sum(e2.SALARY)/2 as mid_salary
				from employees e2
                where e2.DEPARTMENT_ID = e1.DEPARTMENT_ID);

# Write a query to display all the information of the employees whose salary is within the range 1000 and 3000.
select * 
from employees
where salary between 1000 and 3000;

# Write a query to display all the information for those employees whose id is any id who earn the second highest salary.
select *
from employees e1
where 2 = (
	select count(distinct e2.salary)
    from employees e2
    where e2.SALARY >= e1.SALARY);  
    
select * from employees
where EMPLOYEE_ID in (
select distinct EMPLOYEE_ID
where salary = (
	select max(salary)
    from employees
    where salary < (select max(salary)
					from employees)));
                    
/* Write a query to display the employee name( first name and last name ) 
and hiredate for all employees in the same department as Clara. Exclude Clara */
select concat(first_name,' ',last_name) as employee_name, hire_date
from employees
where DEPARTMENT_ID in (
					select distinct DEPARTMENT_ID
                    from employees
                    where FIRST_NAME = 'Clara')
and FIRST_NAME != 'Clara'

# Display the employee name( first name and last name ), employee id, and job title for all employees whose department location is Toronto. 
select concat(e.first_name,' ',e.last_name) as employee_name, e.employee_id, j.job_title
from employees e
inner join jobs j
	on e.job_id = j.job_id
inner join departments d
	on e.department_id = d.department_id
inner join locations l
	on d.location_id = l.location_id
where l.city = 'Toronto';

select concat(first_name,' ',last_name) as employee_name, employee_id, job_id
from employees
where DEPARTMENT_ID in (
	select distinct DEPARTMENT_ID
    from departments
    where LOCATION_ID in (
			select distinct LOCATION_ID
            from locations
            where city = 'Toronto'))
		

