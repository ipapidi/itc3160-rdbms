SELECT
    firstname
    || ' '
    || lastname AS "FULLNAME"
FROM
    worker   w
    INNER JOIN dept     d ON w.departmentid = d.departmentid
WHERE
    d.departmentname = 'Development'
    AND w.salary > (
        SELECT
            AVG(salary)
        FROM
            worker
        WHERE
            departmentid = d.departmentid
    );