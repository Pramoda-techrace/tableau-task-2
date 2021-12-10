use employees_mod;

SELECT 
    e.gender,
    ROUND(AVG(s.salary), 2) salary,
    YEAR(s.from_date) calender,
    d.dept_name
FROM
    t_employees e
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
        JOIN
    t_salaries s ON s.emp_no = e.emp_no
GROUP BY d.dept_no , calender , gender
HAVING calender <= 2002
ORDER BY d.dept_no;


SELECT 
    e.gender,
    ROUND(AVG(s.salary), 2) salary,
    d.dept_name,
    YEAR(s.from_date) calender
FROM
    t_salaries s
        JOIN
    t_employees e ON e.emp_no = s.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_name , e.gender , calender
HAVING calender <= 2002
ORDER BY d.dept_name;



