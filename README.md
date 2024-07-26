# movie-app-db-sql

```mermaid
erDiagram
    Country ||--o{ Person : "has"
    Country ||--o{ Movie : "produces"
    File ||--o{ User : "is avatar of"
    File ||--o{ Person : "is primary photo of"
    File ||--o{ Movie : "is poster of"
    User ||--o{ FavoriteMovies : "has"
    Person ||--o{ Movie : "directs"
    Person ||--o{ MovieCharacter : "acts in"
    Movie ||--o{ MovieCharacter : "has"
    Movie ||--o{ MovieGenre : "has"
    Genre ||--o{ MovieGenre : "belongs to"
    Character ||--o{ MovieCharacter : "is portrayed in"
    Person ||--o{ PersonPhotos : "has"
    File ||--o{ PersonPhotos : "is used in"

    Country {
        int CountryID PK
        string CountryName
        string ISOCode
    }

    File {
        int FileID PK
        string FileName
        string MIMEType
        string Key
        string URL
    }

    User {
        int UserID PK
        string Username
        string FirstName
        string LastName
        string Email
        string Password
        int AvatarFileID FK
    }

    Person {
        int PersonID PK
        string FirstName
        string LastName
        text Biography
        date DateOfBirth
        enum Gender
        int CountryID FK
        int PrimaryPhotoFileID FK
    }

    Movie {
        int MovieID PK
        string Title
        text Description
        decimal Budget
        date ReleaseDate
        int Duration
        int DirectorID FK
        int CountryID FK
        int PosterFileID FK
    }

    Genre {
        int GenreID PK
        string GenreName
    }

    Character {
        int CharacterID PK
        string Name
        text Description
    }

    MovieCharacter {
        int MovieCharacterID PK
        int MovieID FK
        int CharacterID FK
        int ActorID FK
        enum Role
    }

    MovieGenre {
        int MovieID FK
        int GenreID FK
    }

    FavoriteMovies {
        int UserID FK
        int MovieID FK
    }

    PersonPhotos {
        int PersonID FK
        int FileID FK
    }
```

## Notes

* Common CreatedAt & UpdatedAt timestamps are present in all sql tables
* Role attribute is in CharacterMovies table. It makes more sense for this schema to put it in here, rather than in Character table: in one movie a character can play leading role and in another play supporting role. So by doing this, I can avoid creating duplicate characters with different role values.
