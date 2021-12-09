use employees_mod;

SELECT 
    YEAR(d.from_date) calender,
    e.gender gender,
    COUNT(d.from_date) num_of_employees
FROM
    t_employees e
        JOIN
    t_dept_emp d ON e.emp_no = d.emp_no
GROUP BY calender , gender
HAVING calender >= 1990
ORDER BY calender ASC;



SELECT 
    YEAR(from_date) calender,
    e.gender gender,
    COUNT(from_date) num_of_employees
FROM
    t_dept_emp
        JOIN
    t_employees e ON e.emp_no = t_dept_emp.emp_no
GROUP BY calender , gender
HAVING calender >= 1990
ORDER BY calender ASC; 
    

SELECT 
    YEAR(from_date) calender,
    e.gender gender,
    COUNT(from_date) num_of_employees
FROM
    t_dept_emp
        JOIN
    t_employees e ON e.emp_no = t_dept_emp.emp_no
WHERE
    YEAR(t_dept_emp.from_date) >= 1990
GROUP BY calender , e.gender
ORDER BY calender ASC; 
    

    
  use employees_mod;
    




SELECT 
    d.dept_name,
    ee.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.calender_year,
    case 
		when year(dm.to_date) >= e.calender_year and year(dm.from_date) <= e.calender_year then 1 
        else 0
        end as active
FROM
    (SELECT 
        YEAR(e.hire_date) AS calender_year
    FROM
        t_employees e
    GROUP BY calender_year) e
        CROSS JOIN
    t_dept_manager dm
        JOIN
    t_departments d ON d.dept_no = dm.dept_no
        JOIN
    t_employees ee ON ee.emp_no = dm.emp_no
ORDER BY dm.emp_no , calender_year;


