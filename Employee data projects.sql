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

-- Display all the information of the Employee table
select * from Employee;

-- Display unique Department names from Employee table.
select distinct departent_name from Employee;

-- List the details of the employees in ascending order of their salaries.
select * from Employee 
order by salary asc;

-- List the employees who joined before 2014.
select * from Employee
where joining_date <"2014-01-01";

-- List the Empno, Ename, Sal, Daily Sal of all Employees in the ASC order of AnnSal.
select emp_id, emp_name, salary, salary/30 Daily_Sal from Employee
order by salary*12 asc;

-- List the employees who are working for the department name fesion or teaching
select * from Employee
where departent_name in ("fesion","teaching");

-- List the employees who are joined in the year 2015
select * from Employee
where joining_date = "2015-01-01";

-- List the employees who does not belong to department name teaching
select * from Employee
where departent_name not in ("teaching");

-- select employee details from employee table if data exists in incentive table ?
select * from Employee e1 
inner join incentive i 
on e1.emp_id = i.emp_id;

-- Get Employee ID’s of those employees who didn’t receive incentives
select * from Employee e1
where not exists (select * from incentive);

-- SQL Query to print the number of employees per department in the organization
select emp_id , count(departent_name) from Employee 
group by emp_id; 

-- **********************************************************************************************



































 







































