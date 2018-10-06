SELECT *
FROM repositories_contributors AS rc
WHERE rc.repository_id = rc.contributor_id
ORDER BY `repository_id`;
