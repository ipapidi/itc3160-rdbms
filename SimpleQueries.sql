SELECT
    *
FROM
    assign;

SELECT
    *
FROM
    project;

SELECT
    *
FROM
    dept;

SELECT
    *
FROM
    worker;
--1

SELECT
    *
FROM
    worker   w
    INNER JOIN dept     d ON w.departmentid = d.departmentid
WHERE
    d.departmentname = 'Development'
    AND w.salary > 30000;
--2 

SELECT
    *
FROM
    project p
WHERE
    budget > 350000;
--3

SELECT
    projno,
    projname,
    round(budget / 3) AS "ANNUAL BUDGET"
FROM
    project;
--4

SELECT
    *
FROM
    worker   w,
    assign   a
WHERE
    w.empid = a.empid
    AND a.projno = '1040'
ORDER BY
    w.lastname; 
--5

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
--6

SELECT
    *
FROM
    project p
WHERE
    p.expecteddurationweeks = (
        SELECT
            MIN(expecteddurationweeks)
        FROM
            project
    );
--7

SELECT
    w.firstname
    || ' '
    || w.lastname AS "FULLNAME",
    d.departmentname,
    p.projno
FROM
    worker    w
    INNER JOIN dept      d ON w.departmentid = d.departmentid
    INNER JOIN project   p ON w.empid = p.projmgrid
WHERE
    p.projno = (
        SELECT
            projno
        FROM
            project
        WHERE
            projno = '1019'
    );
--8

SELECT
    *
FROM
    worker    w
    INNER JOIN assign    a ON w.empid = a.empid
    INNER JOIN project   p ON p.projno = a.projno
WHERE
    p.projmgrid = (
        SELECT
            empid
        FROM
            worker
        WHERE
            lastname = 'Liu'
            AND firstname = 'Jun-Min'
    );
--9

CREATE VIEW querynine AS
    SELECT
        p.projno,
        p.projname,
        w.firstname
        || ' '
        || w.lastname AS "FULLNAME",
        w.empid
    FROM
        project   p
        INNER JOIN worker    w ON w.empid = p.projmgrid;

SELECT
    *
FROM
    querynine;
--10

SELECT
    *
FROM
    querynine
WHERE
    empid = '103';