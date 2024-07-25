SELECT 
    m.MovieID AS ID,
    m.Title,
    m.ReleaseDate,
    m.Duration,
    m.Description,
    JSON_OBJECT(
        'FileID', pf.FileID,
        'FileName', pf.FileName,
        'URL', pf.URL
    ) AS Poster,
    JSON_OBJECT(
        'ID', d.PersonID,
        'FirstName', d.FirstName,
        'LastName', d.LastName,
        'Photo', JSON_OBJECT(
            'FileID', df.FileID,
            'FileName', df.FileName,
            'URL', df.URL
        )
    ) AS Director,
    JSON_ARRAYAGG(
        JSON_OBJECT(
            'ID', a.PersonID,
            'FirstName', a.FirstName,
            'LastName', a.LastName,
            'Photo', JSON_OBJECT(
                'FileID', af.FileID,
                'FileName', af.FileName,
                'URL', af.URL
            )
        )
    ) AS Actors,
    JSON_ARRAYAGG(
        JSON_OBJECT(
            'ID', g.GenreID,
            'Name', g.GenreName
        )
    ) AS Genres
FROM 
    Movie m
LEFT JOIN File pf ON m.PosterFileID = pf.FileID
LEFT JOIN Person d ON m.DirectorID = d.PersonID
LEFT JOIN File df ON d.PrimaryPhotoFileID = df.FileID
LEFT JOIN MovieCharacter mc ON m.MovieID = mc.MovieID
LEFT JOIN Person a ON mc.ActorID = a.PersonID
LEFT JOIN File af ON a.PrimaryPhotoFileID = af.FileID
LEFT JOIN MovieGenre mg ON m.MovieID = mg.MovieID
LEFT JOIN Genre g ON mg.GenreID = g.GenreID
WHERE 
    m.MovieID = 1
GROUP BY 
    m.MovieID;