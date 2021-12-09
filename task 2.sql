use employees_mod;
SELECT 
    de.dept_name,
    e.emp_no,
    YEAR(d.from_date) calender,
    e.gender,
    d.from_date,
    d.to_date,
    case 
		when year(d.from_date)>= year(d.from_date) <= year(d.to_date) then 1
        else 0
        end as active
    
FROM 
    t_dept_manager d
        JOIN
    t_departments de ON de.dept_no = d.dept_no
        JOIN
    t_employees e ON e.emp_no = d.emp_no
where year(d.from_date) >=1990
ORDER BY calender ASC;





