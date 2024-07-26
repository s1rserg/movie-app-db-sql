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
    Movie ||--o{ FavoriteMovies : "is favorite of"
    Movie ||--o{ MovieCharacter : "has"
    Movie ||--o{ MovieGenre : "has"
    Genre ||--o{ MovieGenre : "belongs to"
    Character ||--o{ MovieCharacter : "is portrayed in"
    Person ||--o{ PersonPhotos : "has"
    File ||--o{ PersonPhotos : "is used in"

    Country {
        int CountryID PK
        varchar(100) CountryName
        char(2) ISOCode
        timestamp createdAt
        timestamp updatedAt
    }

    File {
        int FileID PK
        varchar(100) FileName
        varchar(50) MIMEType
        varchar(255) Key
        varchar(255) URL
        timestamp createdAt
        timestamp updatedAt
    }

    User {
        int UserID PK
        varchar(50) Username
        varchar(50) FirstName
        varchar(50) LastName
        varchar(255) Email
        varchar(255) Password
        int AvatarFileID FK
        timestamp createdAt
        timestamp updatedAt
    }

    Person {
        int PersonID PK
        varchar(50) FirstName
        varchar(50) LastName
        text Biography
        date DateOfBirth
        enum Gender
        int CountryID FK
        int PrimaryPhotoFileID FK
        timestamp createdAt
        timestamp updatedAt
    }

    Movie {
        int MovieID PK
        varchar(100) Title
        text Description
        decimal Budget
        date ReleaseDate
        smallint Duration
        int DirectorID FK
        int CountryID FK
        int PosterFileID FK
        timestamp createdAt
        timestamp updatedAt
    }

    Genre {
        int GenreID PK
        varchar(50) GenreName
        timestamp createdAt
        timestamp updatedAt
    }

    Character {
        int CharacterID PK
        varchar(100) Name
        text Description
        timestamp createdAt
        timestamp updatedAt
    }

    MovieCharacter {
        int MovieCharacterID PK
        int MovieID FK
        int CharacterID FK
        int ActorID FK
        enum Role
        timestamp createdAt
        timestamp updatedAt
    }

    MovieGenre {
        int MovieID FK
        int GenreID FK
        timestamp createdAt
        timestamp updatedAt
    }

    FavoriteMovies {
        int UserID FK
        int MovieID FK
        timestamp createdAt
        timestamp updatedAt
    }

    PersonPhotos {
        int PersonID FK
        int FileID FK
        timestamp createdAt
        timestamp updatedAt
    }
```

## Notes

* Role attribute is in CharacterMovies table. It makes more sense for this schema to put it in here, rather than in Character table: in one movie a character can play leading role and in another play supporting role. So by doing this, I can avoid creating duplicate characters with different role values.
