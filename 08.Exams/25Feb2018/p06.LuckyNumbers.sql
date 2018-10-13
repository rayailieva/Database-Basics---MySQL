SELECT 
    rc.repository_id, rc.contributor_id
FROM
    repositories_contributors AS rc
WHERE
    rc.repository_id = rc.contributor_id
ORDER BY rc.repository_id;