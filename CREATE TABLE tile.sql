DROP DATABASE IF EXISTS tickslife;
CREATE DATABASE tickslife;
USE tickslife;

CREATE TABLE tile
(
  coordinateX INT NOT NULL,
  coordinateY INT NOT NULL,
  level INT NOT NULL,
  co2lvl INT NOT NULL,
  PRIMARY KEY (coordinateX, coordinateY, level),
  UNIQUE (coordinateX, coordinateY)
);

CREATE TABLE animal
(
  animalID INT NOT NULL,
  name CHAR(32) NOT NULL,
  coordinateX INT NOT NULL,
  coordinateY INT NOT NULL,
  level INT NOT NULL,
  PRIMARY KEY (animalID),
  FOREIGN KEY (coordinateX, coordinateY, level) REFERENCES tile(coordinateX, coordinateY, level)
);

CREATE TABLE disease
(
  diseaseID INT NOT NULL,
  name INT NOT NULL,
  description INT NOT NULL,
  PRIMARY KEY (diseaseID)
);

CREATE TABLE description
(
  descriptionID INT NOT NULL,
  description CHAR(255) NOT NULL,
  coordinateX INT NOT NULL,
  coordinateY INT NOT NULL,
  level INT NOT NULL,
  PRIMARY KEY (descriptionID),
  FOREIGN KEY (coordinateX, coordinateY, level) REFERENCES tile(coordinateX, coordinateY, level)
);

CREATE TABLE tileObstacle
(
  name INT NOT NULL,
  description INT NOT NULL,
  coordinateX INT NOT NULL,
  coordinateY INT NOT NULL,
  level INT NOT NULL,
  coordinateX INT NOT NULL,
  coordinateY INT NOT NULL,
  level INT NOT NULL,
  PRIMARY KEY (coordinateX, coordinateY, level, coordinateX, coordinateY, level),
  FOREIGN KEY (coordinateX, coordinateY, level) REFERENCES tile(coordinateX, coordinateY, level),
  FOREIGN KEY (coordinateX, coordinateY, level) REFERENCES tile(coordinateX, coordinateY, level)
);

CREATE TABLE locationInAnimal
(
  name CHAR(32) NOT NULL,
  locationID INT NOT NULL,
  skinThickness INT NOT NULL,
  animalID INT NOT NULL,
  PRIMARY KEY (locationID),
  FOREIGN KEY (animalID) REFERENCES animal(animalID)
);

CREATE TABLE tick
(
  tickID INT NOT NULL,
  noMovementCalc INT NOT NULL,
  LocationID INT,
  coordinateX INT NOT NULL,
  coordinateY INT NOT NULL,
  level INT NOT NULL,
  PRIMARY KEY (tickID),
  FOREIGN KEY (LocationID) REFERENCES locationInAnimal(locationID),
  FOREIGN KEY (coordinateX, coordinateY, level) REFERENCES tile(coordinateX, coordinateY, level)
);

CREATE TABLE route
(
  decription INT NOT NULL,
  locationToID INT NOT NULL,
  locationFromID INT NOT NULL,
  PRIMARY KEY (locationToID, locationFromID),
  FOREIGN KEY (locationToID) REFERENCES locationInAnimal(locationID),
  FOREIGN KEY (locationFromID) REFERENCES locationInAnimal(locationID)
);

CREATE TABLE diseased
(
  animalcID INT,
  tickID INT,
  diseaseID INT NOT NULL,
  FOREIGN KEY (animalcID) REFERENCES animal(animalID),
  FOREIGN KEY (tickID) REFERENCES tick(tickID),
  FOREIGN KEY (diseaseID) REFERENCES disease(diseaseID)
);
