 use employees_mod;

delimiter $$
create procedure avg_salary_in_range(in p_first_number decimal(10,3), in p_second_number decimal(10,3))
begin
select 
	d.dept_name,
    e.gender,
    avg(s.salary) 
    from t_salaries s
join t_employees e on e.emp_no = s.emp_no
join t_dept_emp de on de.emp_no = e.emp_no
join t_departments d on d.dept_no = de.dept_no
where s.salary between p_first_number and p_second_number
group by d.dept_name,gender;
end $$
delimiter ;


call  avg_salary_in_range(50000,90000);
drop procedure avg_salary_in_range;

SELECT 
    d.dept_name, e.gender, AVG(s.salary)
FROM
    t_salaries s
        JOIN
    t_employees e ON e.emp_no = s.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
GROUP BY d.dept_name , gender;


