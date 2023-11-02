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