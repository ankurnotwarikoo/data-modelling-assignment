
-- Creating Theatre table
CREATE TABLE Theatre (
    TheatreID INT PRIMARY KEY,
    TheatreName VARCHAR(255),
    TheatreLocation VARCHAR(255)
);

-- Creating Film table
CREATE TABLE Film (
    FilmID INT PRIMARY KEY,
    FilmTitle VARCHAR(255),
    FilmLanguage VARCHAR(50),
    FilmFormat VARCHAR(50)
);

-- Creating Screening table
CREATE TABLE Screening (
    ScreeningID INT PRIMARY KEY,
    TheatreID INT,
    FilmID INT,
    ScreeningDate DATE,
    ScreeningTime TIME,
    ScreenType VARCHAR(50),
    FOREIGN KEY (TheatreID) REFERENCES Theatre(TheatreID),
    FOREIGN KEY (FilmID) REFERENCES Film(FilmID)
);

-- Inserting sample data into Theatre table
INSERT INTO Theatre (TheatreID, TheatreName, TheatreLocation)
VALUES (1, 'PVR: Nexus', 'Forum Mall');

-- Inserting sample data into Film table
INSERT INTO Film (FilmID, FilmTitle, FilmLanguage, FilmFormat)
VALUES 
(1, 'Dasara', 'Telugu', '2D'),
(2, 'Kisi Ka Bhai Kisi Ki Jaan', 'Hindi', '2D'),
(3, 'Tu Jhoothi Main Makkaar', 'Hindi', '2D'),
(4, 'Avatar: The Way of Water', 'English', '3D');

-- Inserting sample data into Screening table
INSERT INTO Screening (ScreeningID, TheatreID, FilmID, ScreeningDate, ScreeningTime, ScreenType)
VALUES 
(1, 1, 1, '2023-04-25', '12:10:00', '4K Dolby 7.1'),
(2, 1, 2, '2023-04-25', '13:00:00', '4K ATMOS 2D'),
(3, 1, 2, '2023-04-25', '16:10:00', '4K ATMOS 2D'),
(4, 1, 2, '2023-04-25', '20:20:00', '4K Dolby 7.1'),
(5, 1, 3, '2023-04-25', '13:15:00', '4K 2D'),
(6, 1, 4, '2023-04-25', '13:20:00', 'Playhouse 3D');

-- Query to list all shows on a given date at a given theatre along with their respective show timings
SELECT 
    f.FilmTitle AS MovieTitle, 
    s.ScreeningTime AS ShowTime, 
    s.ScreenType 
FROM 
    Screening s 
    JOIN Film f ON s.FilmID = f.FilmID 
    JOIN Theatre t ON s.TheatreID = t.TheatreID 
WHERE 
    s.ScreeningDate = '2023-04-25' 
    AND t.TheatreName = 'PVR: Nexus';
