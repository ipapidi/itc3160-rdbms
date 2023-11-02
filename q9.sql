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