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