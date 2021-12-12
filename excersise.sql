select d.dept_name,e.gender,avg(s.salary) from  salaries s
join employees e on s.emp_no = e.emp_no
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no = de.dept_no
group by  d.dept_no,e.gender
limit 100;


use employees;

select  min(dept_no) from dept_emp;

select  max(dept_no) from dept_emp;


SELECT 
    e.emp_no,
    (SELECT 
            min(dept_no)
        FROM
            dept_emp de
            where de.emp_no = e.emp_no ) AS lowest,
	case 
		 when e.emp_no <=10020 then 110022 
         when e.emp_no >=10021 and e.emp_no<=10040 then 110039
         end as assigned
         
FROM
    employees e
    where e.emp_no <=10040;

select *  from employees
having year(hire_date) =2000;

select * from titles
where title = 'senior engineer';

select * from titles
where title = 'senior engineer';


select e.emp_no,d.dept_name, d.dept_no from  employees e
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no = de.dept_no
where e.emp_no =10010 and de.from_date in (select max(from_date) from  dept_emp  where emp_no = 10010) ;
 use employees;

 drop procedure if exists present_status_of_employee;

delimiter $$
create procedure present_status_of_employee(in p_emp_no int)
begin
select e.emp_no,d.dept_name, d.dept_no from  employees e
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no = de.dept_no
where e.emp_no =p_emp_no and de.from_date in (select max(from_date) from  dept_emp  where emp_no = p_emp_no) ;
end $$
delimiter ; 

call present_status_of_employee(10010);


SELECT 
    COUNT(*)
FROM
    salaries s
WHERE
    (- YEAR(s.from_date) + YEAR(s.to_date)) > 1
        AND s.salary >= 100000;
SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= 100000
        AND DATEDIFF(to_date, from_date) > 365;

drop trigger if exists checks_hire_date;

delimiter $$
create trigger checks_hire_date
before insert on employees 
for each row
begin
declare today date;
select date_format(sysdate(),'%y-%m-%d') into today;
 if new.hire_date >today then 
 set new.hire_date = today;
 end if;
end $$
delimiter ;

insert into employees values (111112,'1995-06-11','pramoda','ap','m','2022-11-12');

select * from employees
where emp_no=111112; 
use employees;



delimiter $$
create function highest_salary(f_emp_no integer) returns decimal(10,2)
deterministic no sql reads sql data
begin 
declare out_salary decimal(10,2);
select max(s.salary) into out_salary from salaries s
where f_emp_no = emp_no;
return out_salary;
end $$
delimiter ;

select highest_salary(11356);
delimiter $$
create function lowest_salary(f_emp_no integer) returns decimal(10,2)
deterministic no sql reads sql data
begin 
declare out_salary decimal(10,2);
select min(s.salary) into out_salary from salaries s
where f_emp_no = emp_no;
return out_salary;
end $$
delimiter ;

drop function if exists f_salary;

select lowest_salary(11356);


delimiter $$
create function f_salary(f_emp_no integer,f_min_or_max varchar(3)) returns decimal(10,2)
deterministic no sql reads sql data
begin 
declare out_salary decimal(10,2);
SELECT 
    CASE 
    when f_min_or_max = 'MIN' then min(s.salary)
    when f_min_or_max= 'max' then max(s.salary)
    else max(s.salary) - min(s.salary)
    end as out_salary
INTO out_salary FROM
    salaries s
WHERE
    f_emp_no = emp_no;
return out_salary;
end $$
delimiter ;

select f_salary(11022,'min');






