DROP DATABASE IF EXISTS tickslife;
CREATE DATABASE tickslife;
USE tickslife;

CREATE TABLE tile
(
  X INT NOT NULL,
  Y INT NOT NULL,
  level INT NOT NULL,
  distanceToAnimal INT NOT NULL,
  directionToAnimal
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
  PRIMARY KEY (startX, startY, startlevel, endX, endY, endlevel),
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

#lvl1
INSERT INTO tile VALUES (1,1,1,0,0);
INSERT INTO tile VALUES (1,2,1,0,0);
INSERT INTO tile VALUES (1,3,1,0,0);
INSERT INTO tile VALUES (1,4,1,0,0);
INSERT INTO tile VALUES (1,5,1,0,0);

INSERT INTO tile VALUES (2,1,1,0,0);
INSERT INTO tile VALUES (2,2,1,0,0);
INSERT INTO tile VALUES (2,3,1,0,0);
INSERT INTO tile VALUES (2,4,1,0,0);
INSERT INTO tile VALUES (2,5,1,0,0);

INSERT INTO tile VALUES (3,1,1,0,0);
INSERT INTO tile VALUES (3,2,1,0,0);
INSERT INTO tile VALUES (3,3,1,0,0);
INSERT INTO tile VALUES (3,4,1,0,0);
INSERT INTO tile VALUES (3,5,1,0,0);

INSERT INTO tile VALUES (4,1,1,0,0);
INSERT INTO tile VALUES (4,2,1,0,0);
INSERT INTO tile VALUES (4,3,1,0,0);
INSERT INTO tile VALUES (4,4,1,0,0);
INSERT INTO tile VALUES (4,5,1,0,0);

INSERT INTO tile VALUES (5,1,1,0,0);
INSERT INTO tile VALUES (5,2,1,0,0);
INSERT INTO tile VALUES (5,3,1,0,0);
INSERT INTO tile VALUES (5,4,1,0,0);
INSERT INTO tile VALUES (5,5,1,0,0);


#lvl2
INSERT INTO tile VALUES (1,1,2,0,0);
INSERT INTO tile VALUES (1,2,2,0,0);
INSERT INTO tile VALUES (1,3,2,0,0);
INSERT INTO tile VALUES (1,4,2,0,0);

INSERT INTO tile VALUES (2,1,2,0,0);
INSERT INTO tile VALUES (2,2,2,0,0);
INSERT INTO tile VALUES (2,3,2,0,0);
INSERT INTO tile VALUES (2,4,2,0,0);

INSERT INTO tile VALUES (3,1,2,0,0);
INSERT INTO tile VALUES (3,2,2,0,0);
INSERT INTO tile VALUES (3,3,2,0,0);
INSERT INTO tile VALUES (3,4,2,0,0);

INSERT INTO tile VALUES (4,1,2,0,0);
INSERT INTO tile VALUES (4,2,2,0,0);
INSERT INTO tile VALUES (4,3,2,0,0);
INSERT INTO tile VALUES (4,4,2,0,0);

INSERT INTO tile VALUES (5,1,2,0,0);
INSERT INTO tile VALUES (5,2,2,0,0);
INSERT INTO tile VALUES (5,3,2,0,0);
INSERT INTO tile VALUES (5,4,2,0,0);

#lvl3
INSERT INTO tile VALUES (1,1,3,0,0);
INSERT INTO tile VALUES (1,2,3,0,0);
INSERT INTO tile VALUES (1,3,3,0,0);

INSERT INTO tile VALUES (2,1,3,0,0);
INSERT INTO tile VALUES (2,2,3,0,0);
INSERT INTO tile VALUES (2,3,3,0,0);

INSERT INTO tile VALUES (3,1,3,0,0);
INSERT INTO tile VALUES (3,2,3,0,0);
INSERT INTO tile VALUES (3,3,3,0,0);

#lvl4
INSERT INTO tile VALUES (1,1,4,0,0);
INSERT INTO tile VALUES (1,2,4,0,0);
INSERT INTO tile VALUES (1,3,4,0,0);
INSERT INTO tile VALUES (1,4,4,0,0);
INSERT INTO tile VALUES (1,5,4,0,0);
INSERT INTO tile VALUES (1,6,4,0,0);

INSERT INTO tile VALUES (2,1,4,0,0);
INSERT INTO tile VALUES (2,2,4,0,0);
INSERT INTO tile VALUES (2,3,4,0,0);
INSERT INTO tile VALUES (2,4,4,0,0);
INSERT INTO tile VALUES (2,5,4,0,0);
INSERT INTO tile VALUES (2,6,4,0,0);

INSERT INTO tile VALUES (3,1,4,0,0);
INSERT INTO tile VALUES (3,2,4,0,0);
INSERT INTO tile VALUES (3,3,4,0,0);
INSERT INTO tile VALUES (3,4,4,0,0);
INSERT INTO tile VALUES (3,5,4,0,0);
INSERT INTO tile VALUES (3,6,4,0,0);

INSERT INTO tile VALUES (4,1,4,0,0);
INSERT INTO tile VALUES (4,2,4,0,0);
INSERT INTO tile VALUES (4,3,4,0,0);
INSERT INTO tile VALUES (4,4,4,0,0);
INSERT INTO tile VALUES (4,5,4,0,0);
INSERT INTO tile VALUES (4,6,4,0,0);

INSERT INTO tile VALUES (5,1,4,0,0);
INSERT INTO tile VALUES (5,2,4,0,0);
INSERT INTO tile VALUES (5,3,4,0,0);
INSERT INTO tile VALUES (5,4,4,0,0);
INSERT INTO tile VALUES (5,5,4,0,0);
INSERT INTO tile VALUES (5,6,4,0,0);

INSERT INTO tile VALUES (6,1,4,0,0);
INSERT INTO tile VALUES (6,2,4,0,0);
INSERT INTO tile VALUES (6,3,4,0,0);
INSERT INTO tile VALUES (6,4,4,0,0);
INSERT INTO tile VALUES (6,5,4,0,0);
INSERT INTO tile VALUES (6,6,4,0,0);

#animals
INSERT INTO animal VALUES (1,"Squirrel",1,5,1);
INSERT INTO animal VALUES (2,"Mole",3,1,1);

INSERT INTO animal VALUES (3,"Dog",2,4,2);
INSERT INTO animal VALUES (4,"Man",5,1,2);

INSERT INTO animal VALUES (5,"Man",1,3,3);

INSERT INTO animal VALUES (6,"Jogger",1,5,4);
INSERT INTO animal VALUES (7,"Child",1,5,1);


INSERT INTO tileObstacle VALUES ("You decide not to climb over the stone in your way. It would take too much effort.",4,2,1,4,3,1);
INSERT INTO tileObstacle VALUES ("You decide not to climb over the stone in your way. It would take too much effort.",4,3,1,4,2,1);

INSERT INTO tileObstacle VALUES ("");


INSERT INTO tileObstacle VALUES ("Stone",);
INSERT INTO tileObstacle VALUES ("Stone",);



















