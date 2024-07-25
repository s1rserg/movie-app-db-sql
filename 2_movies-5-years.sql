SELECT 
    m.MovieID AS ID,
    m.Title,
    COUNT(DISTINCT mc.ActorID) AS ActorsCount
FROM 
    Movie m
LEFT JOIN 
    MovieCharacter mc ON m.MovieID = mc.MovieID
WHERE 
    m.ReleaseDate >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
GROUP BY 
    m.MovieID, m.Title
ORDER BY 
    ActorsCount DESC;