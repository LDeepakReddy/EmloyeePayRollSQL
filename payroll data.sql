show databases;
#--UC1--
create database payroll_service;
use payroll_service;

#--UC2--
create table employee_payroll(
ID int not null auto_increment,
NAME varchar(20) not null,
SALARY double not null,
START_DATE date not null,
primary key(ID) 
);
show tables;
desc employee_payroll;


#--UC3--
insert into employee_payroll(NAME,SALARY,START_DATE)
values('lhjfgg',3423578,'2021-02-04');

#--UC4--
select * from employee_payroll;

#--UC5--
select * from employee_payroll where NAME = 'Deepak';
select * from employee_payroll where START_DATE between '2022-02-04' and date(now());

#--UC6--
alter table employee_payroll add Gender char(1);
update employee_payroll set Gender = 'M' where ID  = 1 ;
update employee_payroll set Gender = 'F' where ID in (2,3) ;

#UC7--
select sum(SALARY) from employee_payroll ;
select avg(SALARY) from employee_payroll ;