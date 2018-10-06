SELECT 
    u.id, u.username
FROM
    users_followers AS uf
        JOIN
    users AS u ON uf.user_id = u.id
WHERE
    u.id = uf.follower_id
ORDER BY u.id;