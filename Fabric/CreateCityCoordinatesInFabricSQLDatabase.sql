IF OBJECT_ID('CityCoordinatesNoPK') IS NOT NULL
  DROP TABLE CityCoordinatesNoPK
GO

CREATE TABLE CityCoordinatesNoPK (
    city VARCHAR(25) NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL
)
GO

IF OBJECT_ID('CityCoordinates') IS NOT NULL
  DROP TABLE CityCoordinates
GO

CREATE TABLE CityCoordinates (
    city VARCHAR(25) PRIMARY KEY NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL
)
GO


INSERT INTO CityCoordinatesNoPK (city, latitude, longitude)
VALUES
('Zurich', 47.3769, 8.5417),
('Geneva', 46.2044, 6.1432),
('Bern', 46.9481, 7.4474),
('Basel', 47.5596, 7.5886),
('Lausanne', 46.5197, 6.6323),
('Lucerne', 47.0502, 8.3093),
('St. Gallen', 47.4239, 9.3700),
('Lugano', 46.0037, 8.9511),
('Thun', 46.7512, 7.6216),
('Winterthur', 47.4980, 8.7241);


INSERT INTO CityCoordinates
SELECT * FROM CityCoordinatesNoPK;


SELECT * 
FROM CityCoordinates
