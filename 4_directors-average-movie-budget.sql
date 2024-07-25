SELECT 
    p.PersonID AS DirectorID,
    CONCAT(p.FirstName, ' ', p.LastName) AS DirectorName,
    COALESCE(AVG(m.Budget), 0) AS AverageBudget
FROM 
    Person p
LEFT JOIN 
    Movie m ON p.PersonID = m.DirectorID
GROUP BY 
    p.PersonID, DirectorName
ORDER BY 
    AverageBudget DESC;