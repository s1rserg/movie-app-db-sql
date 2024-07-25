SELECT 
    u.UserID AS ID,
    u.Username,
    JSON_ARRAYAGG(fm.MovieID) AS FavoriteMovieIDs
FROM 
    User u
LEFT JOIN 
    FavoriteMovies fm ON u.UserID = fm.UserID
GROUP BY 
    u.UserID, u.Username;