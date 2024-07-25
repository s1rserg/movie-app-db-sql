SELECT 
    p.PersonID AS ID,
    p.FirstName,
    p.LastName,
    COALESCE(SUM(m.Budget), 0) AS TotalMoviesBudget
FROM 
    Person p
LEFT JOIN 
    MovieCharacter mc ON p.PersonID = mc.ActorID
LEFT JOIN 
    Movie m ON mc.MovieID = m.MovieID
WHERE
    p.PersonID IN (SELECT DISTINCT ActorID FROM MovieCharacter)
GROUP BY 
    p.PersonID, p.FirstName, p.LastName
ORDER BY 
    TotalMoviesBudget DESC;
    
-- by using 'where' clause I exclude directors who have not been actors from query result