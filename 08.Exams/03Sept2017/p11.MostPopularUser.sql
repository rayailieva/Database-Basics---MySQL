SELECT 
    u.id,
    u.username,
    COUNT(p.user_id) AS 'posts',
    COUNT(uf.follower_id) AS 'followers'
FROM
    users AS u
        JOIN
    posts AS p ON u.id = p.user_id
        JOIN
    users_followers AS uf ON u.id = uf.user_id
GROUP BY u.id
ORDER BY `followers` DESC LIMIT 1;
    