SELECT
    *
FROM
    worker   w
    INNER JOIN dept     d ON w.departmentid = d.departmentid
WHERE
    d.departmentname = 'Development'
    AND w.salary > 30000;