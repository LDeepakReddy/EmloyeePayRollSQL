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
values('abc',3423578,'2021-02-12');

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

#uc8---

alter table employee_payroll
add phonenum varchar(30),
add department varchar(50) not null,
add address varchar(250) default 'abc';
select * from employee_payroll ;

#Uc9----
alter table employee_payroll rename column SALARY to BasicPay;
alter table employee_payroll 
add Deduction int,
add TaxablePay int,
add IncomeTax int,
add NetPay int;

#UC10---

insert into employee_payroll(NAME,BasicPay,START_DATE,Department)
values('Terissa',3423578,'2021-02-12','Sales');

insert into employee_payroll(NAME,BasicPay,START_DATE,phonenum,Department,Deduction,TaxablePay,IncomeTax,NetPay)
values('Terissa',3423578,'2021-02-12','951553353','Marketing',2000,1500,5454,16165);

#UC11----

create table employee(
ID int not null auto_increment,
NAME varchar(20) not null,
Gender varchar(1),
phonenum varchar(20),
address varchar(100),
START_DATE date not null,
primary key(ID) );

create table payroll(
ID int not null auto_increment primary key,
BasicPay int,
Deduction int,
TaxablePay int,
IncomeTax int,
NetPay int,
Emp_ID int,
foreign key (Emp_ID) references employee(ID)
 );
 
 create table department(
ID int not null auto_increment primary key,
departmentName varchar(20)
 );
 
 create table emp_dept(
 empID int not null,
 deptID int not null,
 foreign key (empID) references employee(ID),
 foreign key(deptID) references department(ID),
 primary key (empID,deptID)
 );
