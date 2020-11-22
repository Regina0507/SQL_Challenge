Create table Departments(
Dept_NO Varchar (30) Primary key,
Dept_Name varchar (30)
)

copy departments from 'C:\Users\Regina\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\departments.csv' with csv header

select * from departments

create table Employees(
emp_no int primary key,
emp_title varchar (30),
birth_date date ,
first_name varchar(30),
last_name varchar(30),
sex varchar(10),
hire_date date 
)

copy Employees from 'C:\Users\Regina\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\Employees.csv' with csv header


create table Dept_Emp(
emp_no int, foreign key(emp_no) references Employees(emp_no) ,
Dept_no varchar (30), foreign key(Dept_no) references departments(Dept_no)
)
copy Dept_Emp from 'C:\Users\Regina\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\Dept_Emp.csv' with csv header


create table salaries(
emp_no int foreign key(emp_no) references Employees(emp_no),
salary int
)
copy salaries from 'C:\Users\Regina\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\salaries.csv' with csv header
drop table titles
create table titles(
title_id varchar(30) primary key,
title varchar (20)
)
copy titles from 'C:\Users\Regina\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\titles.csv' with csv header






