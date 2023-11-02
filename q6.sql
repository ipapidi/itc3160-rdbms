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