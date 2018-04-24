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

CREATE TABLE description
(
  descriptionID INT NOT NULL,
  description VARCHAR(255) NOT NULL,
  X INT NOT NULL,
  Y INT NOT NULL,
  level INT NOT NULL,
  PRIMARY KEY (descriptionID),
  FOREIGN KEY (X, Y, level) REFERENCES tile(X, Y, level)
);

CREATE TABLE tileObstacle
(
  description VARCHAR(255) NOT NULL,
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
  name VARCHAR(32) NOT NULL,
  locationID INT NOT NULL,
  skinThickness INT NOT NULL,
  animalID INT NOT NULL,
  PRIMARY KEY (locationID),
  FOREIGN KEY (animalID) REFERENCES animal(animalID)
);

CREATE TABLE tick
(
  tickID INT NOT NULL,
  timeVisible INT NOT NULL,
  LocationID INT,
  disease VARCHAR(255),
  X INT NOT NULL,
  Y INT NOT NULL,
  level INT NOT NULL,
  PRIMARY KEY (tickID),
  FOREIGN KEY (LocationID) REFERENCES locationInAnimal(locationID),
  FOREIGN KEY (X, Y, level) REFERENCES tile(X, Y, level)
);

CREATE TABLE route
(
  description INT NOT NULL,
  locationToID INT NOT NULL,
  locationFromID INT NOT NULL,
  PRIMARY KEY (locationToID, locationFromID),
  FOREIGN KEY (locationToID) REFERENCES locationInAnimal(locationID),
  FOREIGN KEY (locationFromID) REFERENCES locationInAnimal(locationID)
);

CREATE TABLE story
(
  storyID INT NOT NULL,
  description VARCHAR(1000) NOT NULL
);