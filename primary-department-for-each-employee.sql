SELECT 
    employee_id,
    department_id
FROM Employee
WHERE primary_flag = 'Y'
UNION
SELECT 
    e.employee_id,
    e.department_id
FROM Employee e
LEFT JOIN Employee e2 ON e.employee_id = e2.employee_id AND e2.primary_flag = 'Y'
WHERE e2.employee_id IS NULL
GROUP BY e.employee_id, e.department_id
HAVING COUNT(*) = 1;