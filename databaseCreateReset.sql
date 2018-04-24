DROP DATABASE IF EXISTS tickslife;
CREATE DATABASE tickslife;
USE tickslife;

CREATE TABLE tile
(
  X INT NOT NULL,
  Y INT NOT NULL,
  level INT NOT NULL,
  distanceToAnimal INT NOT NULL,
  PRIMARY KEY (X, Y, level),
  UNIQUE (X, Y, level)
);

CREATE TABLE animal
(
  animalID INT NOT NULL,
  name CHAR(32) NOT NULL,
  X INT NOT NULL,
  Y INT NOT NULL,
  level INT NOT NULL,
  PRIMARY KEY (animalID),
  FOREIGN KEY (X, Y, level) REFERENCES tile(X, Y, level)
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
  X INT NOT NULL,
  Y INT NOT NULL,
  level INT NOT NULL,
  PRIMARY KEY (descriptionID),
  FOREIGN KEY (X, Y, level) REFERENCES tile(X, Y, level)
);

CREATE TABLE tileObstacle
(
  name INT NOT NULL,
  description INT NOT NULL,
  startX INT NOT NULL,
  startY INT NOT NULL,
  startlevel INT NOT NULL,
  endX INT NOT NULL,
  endY INT NOT NULL,
  endLevel INT NOT NULL,
  PRIMARY KEY (X, Y, level, X, Y, level),
  FOREIGN KEY (startX, startY, startLevel) REFERENCES tile(X, Y, level),
  FOREIGN KEY (endX, endY, endlevel) REFERENCES tile(X, Y, level)
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
  X INT NOT NULL,
  Y INT NOT NULL,
  level INT NOT NULL,
  PRIMARY KEY (tickID),
  FOREIGN KEY (LocationID) REFERENCES locationInAnimal(locationID),
  FOREIGN KEY (X, Y, level) REFERENCES tile(X, Y, level)
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
