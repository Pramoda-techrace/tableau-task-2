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
ORDER BY calender,gender;




SELECT 
    ee.gender,
    COUNT(dm.from_date) no_of_employees,
    YEAR(dm.from_date) calender
FROM
    (SELECT DISTINCT
        YEAR(hire_date)
    FROM
        t_employees) e
        CROSS JOIN
    t_dept_manager dm
        JOIN
    t_employees ee ON ee.emp_no = dm.emp_no
GROUP BY ee.gender , dm.from_date;

