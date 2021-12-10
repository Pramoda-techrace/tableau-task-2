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



