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