UPDATE repositories_contributors AS rc
        JOIN
    (SELECT 
        r.id AS 'repo'
    FROM
        `repositories` AS r
    WHERE
        r.id NOT IN (SELECT 
                repository_id
            FROM
                `repositories_contributors`)
    ORDER BY r.id
    LIMIT 1) AS d 
SET 
    rc.repository_id = d.repo
WHERE
    rc.repository_id = rc.contributor_id;