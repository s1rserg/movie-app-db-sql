SELECT 
    m.MovieID AS ID,
    m.Title,
    m.ReleaseDate,
    m.Duration,
    m.Description,
    JSON_OBJECT(
        'FileID', f.FileID,
        'FileName', f.FileName,
        'URL', f.URL
    ) AS Poster,
    JSON_OBJECT(
        'ID', p.PersonID,
        'FirstName', p.FirstName,
        'LastName', p.LastName
    ) AS Director
FROM 
    Movie m
JOIN 
    MovieGenre mg ON m.MovieID = mg.MovieID
JOIN 
    Genre g ON mg.GenreID = g.GenreID
LEFT JOIN 
    File f ON m.PosterFileID = f.FileID
LEFT JOIN 
    Person p ON m.DirectorID = p.PersonID
WHERE 
    m.CountryID = 1
    AND m.ReleaseDate >= '2022-01-01'
    AND m.Duration > 135
    AND g.GenreName IN ('Action', 'Drama')
GROUP BY 
    m.MovieID;