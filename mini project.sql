create database company_management;
use company_management;
create table departments(
dept_id int primary key,
dept_name varchar(50) unique,
location varchar(50) default 'Hyderabad'
);

create table employees(
emp_id	INT primary key,
emp_name VARCHAR(50) not null,
email VARCHAR(100) unique,
age	INT check(age>=18),
salary	DECIMAL(10,2),
city	VARCHAR(50) default 'Hyderabad',
dept_id	INT ,
joining_date DATE 
);
insert into departments values 
( 1 , 'IT' , 'Hyderabad');
INSERT INTO departments VALUES
(2,'HR','Bangalore'),
(3,'Finance','Chennai'),
(4,'Marketing','Mumbai'),
(5,'Operations','Pune');
INSERT INTO employees VALUES
(101, 'Ajay' , 'Ajay@gmail.com', 22, 45000.75 , 'Hyderabad' , 1 , '2024-01-18');
INSERT INTO employees VALUES
(102,'John','john@gmail.com',25,48000.50,'Bangalore',2,'2024-02-10'),
(103,'David','david@gmail.com',28,60000.00,'Chennai',3,'2023-11-20'),
(104,'Sarah','sarah@gmail.com',24,52000.75,'Mumbai',4,'2024-03-05'),
(105,'Emma','emma@gmail.com',26,47000.25,'Pune',5,'2024-04-12'),
(106,'Ravi','ravi@gmail.com',29,65000.00,'Hyderabad',1,'2023-09-18'),
(107,'Priya','priya@gmail.com',23,43000.00,'Delhi',2,'2024-05-01'),
(108,'Kiran','kiran@gmail.com',31,72000.50,'Bangalore',3,'2022-08-25'),
(109,'Sneha','sneha@gmail.com',27,54000.75,'Chennai',4,'2023-12-10'),
(110,'Arjun','arjun@gmail.com',30,58000.00,'Mumbai',5,'2022-11-15'),
(111,'Rahul','rahul@gmail.com',24,49500.25,'Pune',1,'2024-01-08'),
(112,'Anjali','anjali@gmail.com',26,46000.00,'Hyderabad',2,'2023-10-20'),
(113,'Vikram','vikram@gmail.com',32,76000.50,'Delhi',3,'2021-07-12'),
(114,'Pooja','pooja@gmail.com',25,51500.75,'Bangalore',4,'2024-06-01'),
(115,'Naveen','naveen@gmail.com',28,55000.00,'Chennai',5,'2023-05-17'),
(116,'Ramesh',NULL,29,67000.25,'Mumbai',1,'2022-03-21'),
(117,'Keerthi','keerthi@gmail.com',22,42500.00,'Pune',2,'2024-02-28'),
(118,'Suresh','suresh@gmail.com',33,79000.75,'Hyderabad',3,'2020-09-14'),
(119,'Divya',NULL,27,53500.50,'Delhi',4,'2023-07-30'),
(120,'Mahesh','mahesh@gmail.com',30,57500.00,'Bangalore',5,'2022-12-05');
select * from employees;
select emp_name , salary from employees;
select * from employees where city = 'Hyderabad';
select * from employees where salary > 50000.00;
select * from employees where dept_id = 1;
SELECT *
FROM employees
WHERE city = 'Hyderabad'
AND salary > 50000;

SELECT *
FROM employees
WHERE dept_id IN (2, 3);
SELECT * FROM employees where city <> 'Bangalore';
select * from employees where emp_name like 'A%';
select * from employees where emp_name like '%a';
SELECT *
FROM employees
WHERE city IN ('Hyderabad', 'Bangalore', 'Chennai');
select * 
from employees
where salary between 40000.00 and 70000.00;
select * from employees order by salary asc;
select * from employees order by salary desc;
select * from employees order by city , salary;
select count(*) as Total_employees from employees;
select sum(salary)  as total_salary_expenditure from employees;
select sum(salary)/count(*) as Average_salary from employees;
select max(salary) as Highest_salary from employees;
select min(salary) as Lowest_salary from employees;
SELECT dept_id, COUNT(*) AS total_employees
FROM employees
GROUP BY dept_id;
SELECT dept_id, sum(salary) / COUNT(*) AS Average_Salary
FROM employees
GROUP BY dept_id;
SELECT dept_id, max(salary) AS highest_salary
FROM employees
GROUP BY dept_id;
SELECT city ,sum(salary) AS Total_salary
FROM employees
GROUP BY city;
SELECT dept_id, COUNT(*) AS total_employees
FROM employees
GROUP BY dept_id having dept_id > 3;
SELECT dept_id, sum(salary) / COUNT(*) AS Average_Salary
FROM employees
GROUP BY dept_id having sum(salary) / COUNT(*) > 50000.00;
SELECT city ,count(*) AS Total_employees
FROM employees
GROUP BY city having count(*) > 2;

CREATE INDEX idx_emp_name
ON employees(emp_name);


CREATE UNIQUE INDEX idx_email
ON employees(email);

SHOW INDEXES FROM employees;

CREATE USER 'hr_user'@'localhost' IDENTIFIED BY 'hr123';


GRANT SELECT, UPDATE
ON employees.*
TO 'hr_user'@'localhost';


CREATE USER 'viewer_user'@'localhost' IDENTIFIED BY 'viewer123';

GRANT SELECT
ON employees.*
TO 'viewer_user'@'localhost';

SHOW GRANTS FOR 'hr_user'@'localhost';

SHOW GRANTS FOR 'viewer_user'@'localhost';
-- CHALLENGE 1
SELECT dept_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY dept_id
ORDER BY avg_salary DESC
LIMIT 1;
-- CHALLENGE 2
SELECT city, SUM(salary) AS total_salary
FROM employees
GROUP BY city
ORDER BY total_salary DESC
LIMIT 1;
-- CHALLENGE 3

SELECT dept_id, SUM(salary) AS total_salary
FROM employees
GROUP BY dept_id
HAVING SUM(salary) > 200000;
-- CHALLENGE 4
SELECT
    dept_id,
    COUNT(*) AS employee_count,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM employees
GROUP BY dept_id;

