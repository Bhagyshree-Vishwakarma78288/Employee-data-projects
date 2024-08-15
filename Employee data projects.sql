-- Employee database
-- create Employee database
create database Employee;
use Employee;

-- create table Employee
drop table if exists Employee;
create table Employee(
emp_id int auto_increment primary key,
emp_name varchar(110) not null,
birth_date date not null,
MGR int not null,
joining_date date not null,
salary int not null,
departent_name varchar(125));

create table incentive(
emp_id int auto_increment primary key,
incentive_date date not null,
incentive_amount decimal (15,2));

-- insert values 
insert into Employee values(
01,"Bhagyshree","1992-10-30",2,"2014-07-05",7500,"structure");

insert into Employee values(
02,"shweta","1993-02-20",1,"2015-01-01",6500,"GA");

insert into Employee values(
03,"neelam","1993-05-16",3,"2016-01-01",5500,"quantity");

insert into Employee values(
04,"shubra","1990-04-27",4,"2012-01-01",5000,"teaching");

insert into Employee values(
05,"phalguni","1992-03-18",1,"2010-01-01",4000,"fesion");

insert into Employee values(
06,"neha","1992-05-18",1,"2011-01-01",4500,"electical");

insert into Employee values(
07,"versha","1989-11-1",1,"2010-01-01",3500,"design");

insert into incentive values(
01,"2015-01-01",10000);

insert into incentive values(
02,"2016-01-01",2000);

insert into incentive values(
03,"2017-01-01",3000);

insert into incentive values(
04,"2013-01-01",2500);

insert into incentive values(
05,"2011-01-01",3000);

insert into incentive values(
06,"2012-01-01",3500);

insert into incentive values(
07,"2011-01-01",4500);

select * from Employee;
select * from incentive;

-- use forign key
alter table Employee add foreign key (emp_id) references incentive(emp_id);

-- Q1 Display all the information of the Employee table
select * from Employee;

-- Q2 Display unique Department names from Employee table.
select distinct departent_name from Employee;

-- Q3 List the details of the employees in ascending order of their salaries.
select * from Employee 
order by salary asc;

-- Q4 List the employees who joined before 2014.
select * from Employee
where joining_date <"2014-01-01";

-- Q5 List the Empno, Ename, Sal, Daily Sal of all Employees in the ASC order of AnnSal.
select emp_id, emp_name, salary, salary/30 Daily_Sal from Employee
order by salary*12 asc;

-- Q6 List the employees who are working for the department name fesion or teaching
select * from Employee
where departent_name in ("fesion","teaching");

-- Q7 List the employees who are joined in the year 2015
select * from Employee
where joining_date = "2015-01-01";

-- Q8 List the employees who does not belong to department name teaching
select * from Employee
where departent_name not in ("teaching");

-- Q9 select employee details from employee table if data exists in incentive table ?
select * from Employee e1 
inner join incentive i 
on e1.emp_id = i.emp_id;

-- Q10 Get Employee ID’s of those employees who didn’t receive incentives
select * from Employee e1
where not exists (select * from incentive);

-- Q11 SQL Query to print the number of employees per department in the organization
select emp_id , count(departent_name) from Employee 
group by emp_id; 

-- Q12 List employees who have not received any incentives.
select * from employee; 
select * from incentive; 
select e.emp_id,e.emp_name from employee e 
join incentive i 
on e.emp_id = i.emp_id 
where i.emp_id is null; 

-- Q13 Calculate the total amount of incentives paid.
select * from incentive; 
select sum(incentive_amount) as total_amount from incentive;

-- Q14 Update the salary of employee with emp_id 7 to 4000.
select * from employee; 
update employee
set salary = 4000
where emp_id = 7;

-- Q15 List all employees along with their incentive 
-- amounts in descending order of incentives.
select * from employee ; 
select * from incentive;
select e.emp_id,e.emp_name,i.incentive_amount from employee e
left join incentive i
on e.emp_id = i.emp_id 
order by i.incentive_amount desc;

-- Q16 Find the number of employees in each department.
select * from employee; 
select departent_name, count(emp_id)as no_of_employee from employee
group by departent_name; 

-- Q17  Find the total salary expense of employees managed by manager with emp_id 2.
select * from employee; 
select sum(salary) as total_expense from employee 
where MGR = 2; 

-- Q18 List employees who have received incentives greater than 3000.
select * from employee; 
select * from incentive; 
select * from employee e 
join incentive i 
on e.emp_id = i.emp_id 
where incentive_amount>3000; 

-- Q19 Retrieve the names of employees and the dates they received their 
-- incentives, ordered by the incentive date.
select * from employee; 
select * from incentive; 
select e.emp_name,i.incentive_date from employee e  
join incentive i 
on e.emp_id = i.emp_id 
order by i.incentive_date ; 

-- Q20 List the names of employees who received an incentive in the 
-- year 2017 but do not work in the 'design' department.
select * from employee ; 
select * from incentive; 
select * from employee e 
join incentive i 
on e.emp_id = i.emp_id 
having departent_name <> 'design' or incentive_date = "2017-01-01" ;  

-- Q21 Find the department with the highest average salary.
select * from employee; 
select * from incentive; 
select departent_name,avg(salary) as highest_salary from employee 
group by departent_name 
order by avg(salary) desc;

-- Q22 Find the total number of employees who have 
-- received an incentive, grouped by their manager.
select * from employee ; 
select * from incentive ; 
select count(e.emp_id) as total_employee from employee e  
join incentive i 
on e.emp_id = i.emp_id 
group by MGR; 

-- Q23 Retrieve the name and salary of employees who have a salary higher 
-- than the average salary of employees in their own department.
select emp_name,e.salary from employee e 
where e.salary > ( select avg(salary) from employee);




































 







































