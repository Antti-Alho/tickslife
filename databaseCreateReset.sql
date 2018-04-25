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

INSERT INTO locationInAnimal(name, locationID, skinThickness, animalID)
VALUES ("Head", 1, 0, 1)
INSERT INTO locationInAnimal VALUES ("neck", 2, 1, 1)
INSERT INTO locationInAnimal VALUES ("right armpit", 3, 1, 1)
INSERT INTO locationInAnimal VALUES ("left armpit", 4, 1, 1)
INSERT INTO locationInAnimal VALUES ("right arm", 5, 0, 1)
INSERT INTO locationInAnimal VALUES ("left arm", 6, 0, 1)
INSERT INTO locationInAnimal VALUES ("right hand", 7, 0, 1)
INSERT INTO locationInAnimal VALUES ("left hand", 8, 0, 1)
INSERT INTO locationInAnimal VALUES ("chest", 9, 0, 1)
INSERT INTO locationInAnimal VALUES ("stomach", 10, 0, 1)
INSERT INTO locationInAnimal VALUES ("back", 11, 0, 1)
INSERT INTO locationInAnimal VALUES ("right side", 12, 1, 1,)
INSERT INTO locationInAnimal VALUES ("left side", 13, 1, 1)
INSERT INTO locationInAnimal VALUES ("groin", 14, 1, 1)
INSERT INTO locationInAnimal VALUES ("right thig", 15, 0, 1)
INSERT INTO locationInAnimal VALUES ("left thig", 16, 0, 1)
INSERT INTO locationInAnimal VALUES ("right knee", 17, 0, 1) 
INSERT INTO locationInAnimal VALUES ("left knee", 18, 0, 1)
INSERT INTO locationInAnimal VALUES ("right ham", 19, 1, 1)
INSERT INTO locationInAnimal VALUES ("left ham", 20, 1, 1)
INSERT INTO locationInAnimal VALUES ("right calf", 21, 0, 1)
INSERT INTO locationInAnimal VALUES ("left calf", 22, 0, 1)
INSERT INTO locationInAnimal VALUES ("right foot", 23, 0, 1)
INSERT INTO locationInAnimal VALUES ("left foot", 24, 0, 1)

INSERT INTO locationInAnimal VALUES ("Head", 1, 0, 2)
INSERT INTO locationInAnimal VALUES ("neck", 2, 1, 2)
INSERT INTO locationInAnimal VALUES ("right armpit", 3, 1, 2)
INSERT INTO locationInAnimal VALUES ("left armpit", 4, 1, 2)
INSERT INTO locationInAnimal VALUES ("right arm", 5, 0, 2)
INSERT INTO locationInAnimal VALUES ("left arm", 6, 0, 2)
INSERT INTO locationInAnimal VALUES ("right hand", 7, 0, 2)
INSERT INTO locationInAnimal VALUES ("left hand", 8, 0, 2)
INSERT INTO locationInAnimal VALUES ("chest", 9, 0, 2)
INSERT INTO locationInAnimal VALUES ("stomach", 10, 0, 2)
INSERT INTO locationInAnimal VALUES ("back", 11, 0, 2)
INSERT INTO locationInAnimal VALUES ("right side", 12, 1, 2)
INSERT INTO locationInAnimal VALUES ("left side", 13, 1, 2)
INSERT INTO locationInAnimal VALUES ("groin", 14, 1, 2)
INSERT INTO locationInAnimal VALUES ("right thig", 15, 0, 2)
INSERT INTO locationInAnimal VALUES ("left thig", 16, 0, 2)
INSERT INTO locationInAnimal VALUES ("right knee", 17, 0, 2) 
INSERT INTO locationInAnimal VALUES ("left knee", 18, 0, 2)
INSERT INTO locationInAnimal VALUES ("right ham", 19, 1, 2)
INSERT INTO locationInAnimal VALUES ("left ham", 20, 1, 2)
INSERT INTO locationInAnimal VALUES ("right calf", 21, 0, 2)
INSERT INTO locationInAnimal VALUES ("left calf", 22, 0, 2)
INSERT INTO locationInAnimal VALUES ("right foot", 23, 0, 2)
INSERT INTO locationInAnimal VALUES ("left foot", 24, 0, 2)

INSERT INTO locationInAnimal VALUES ("Head", 1, 0, 3)
INSERT INTO locationInAnimal VALUES ("neck", 2, 1, 3)
INSERT INTO locationInAnimal VALUES ("right armpit", 3, 1, 3)
INSERT INTO locationInAnimal VALUES ("left armpit", 4, 1, 3)
INSERT INTO locationInAnimal VALUES ("right arm", 5, 0, 3)
INSERT INTO locationInAnimal VALUES ("left arm", 6, 0, 3)
INSERT INTO locationInAnimal VALUES ("right hand", 7, 0, 3)
INSERT INTO locationInAnimal VALUES ("left hand", 8, 0, 3)
INSERT INTO locationInAnimal VALUES ("chest", 9, 0 3)
INSERT INTO locationInAnimal VALUES ("stomach", 10, 0, 3)
INSERT INTO locationInAnimal VALUES ("back", 11, 0, 3)
INSERT INTO locationInAnimal VALUES ("right side", 12, 1, 3)
INSERT INTO locationInAnimal VALUES ("left side", 13, 1, 3)
INSERT INTO locationInAnimal VALUES ("groin", 14, 1, 3)
INSERT INTO locationInAnimal VALUES ("right thig", 15, 0, 3)
INSERT INTO locationInAnimal VALUES ("left thig", 16, 0, 3)
INSERT INTO locationInAnimal VALUES ("right knee", 17, 0, 3) 
INSERT INTO locationInAnimal VALUES ("left knee", 18, 0, 3)
INSERT INTO locationInAnimal VALUES ("right ham", 19, 1, 3)
INSERT INTO locationInAnimal VALUES ("left ham", 20, 1, 3)
INSERT INTO locationInAnimal VALUES ("right calf", 21, 0, 3)
INSERT INTO locationInAnimal VALUES ("left calf", 22, 0, 3)
INSERT INTO locationInAnimal VALUES ("right foot", 23, 0, 3)
INSERT INTO locationInAnimal VALUES ("left foot", 24, 0, 3)

INSERT INTO locationInAnimal VALUES ("Head", 1, 0, 4)
INSERT INTO locationInAnimal VALUES ("neck", 2, 1, 4)
INSERT INTO locationInAnimal VALUES ("right armpit", 3, 1, 4)
INSERT INTO locationInAnimal VALUES ("left armpit", 4, 1, 4)
INSERT INTO locationInAnimal VALUES ("right arm", 5, 0, 4)
INSERT INTO locationInAnimal VALUES ("left arm", 6, 0, 4)
INSERT INTO locationInAnimal VALUES ("right hand", 7, 0, 4)
INSERT INTO locationInAnimal VALUES ("left hand", 8, 0, 4)
INSERT INTO locationInAnimal VALUES ("chest", 9, 0, 4)
INSERT INTO locationInAnimal VALUES ("stomach", 10, 0, 4)
INSERT INTO locationInAnimal VALUES ("back", 11, 0, 4)
INSERT INTO locationInAnimal VALUES ("right side", 12, 1, 4)
INSERT INTO locationInAnimal VALUES ("left side", 13, 1, 4)
INSERT INTO locationInAnimal VALUES ("groin", 14, 1, 4)
INSERT INTO locationInAnimal VALUES ("right thig", 15, 0, 4)
INSERT INTO locationInAnimal VALUES ("left thig", 16, 0, 4)
INSERT INTO locationInAnimal VALUES ("right knee", 17, 0, 4) 
INSERT INTO locationInAnimal VALUES ("left knee", 18, 0, 4)
INSERT INTO locationInAnimal VALUES ("right ham", 19, 1, 4)
INSERT INTO locationInAnimal VALUES ("left ham", 20, 1, 4)
INSERT INTO locationInAnimal VALUES ("right calf", 21, 0, 4)
INSERT INTO locationInAnimal VALUES ("left calf", 22, 0, 4)
INSERT INTO locationInAnimal VALUES ("right foot", 23, 0, 4)
INSERT INTO locationInAnimal VALUES ("left foot", 24, 0, 4)

INSERT INTO locationInAnimal VALUES ("Head", 1, 0, 5)
INSERT INTO locationInAnimal VALUES ("neck", 2, 1, 5)
INSERT INTO locationInAnimal VALUES ("right armpit", 3, 1, 5)
INSERT INTO locationInAnimal VALUES ("left armpit", 4, 1, 5)
INSERT INTO locationInAnimal VALUES ("right arm", 5, 0, 5)
INSERT INTO locationInAnimal VALUES ("left arm", 6, 0, 5)
INSERT INTO locationInAnimal VALUES ("right hand", 7, 0, 5)
INSERT INTO locationInAnimal VALUES ("left hand", 8, 0, 5)
INSERT INTO locationInAnimal VALUES ("chest", 9, 0, 5)
INSERT INTO locationInAnimal VALUES ("stomach", 10, 0, 5)
INSERT INTO locationInAnimal VALUES ("back", 11, 0, 5)
INSERT INTO locationInAnimal VALUES ("right side", 12, 1, 5)
INSERT INTO locationInAnimal VALUES ("left side", 13, 1, 5)
INSERT INTO locationInAnimal VALUES ("groin", 14, 1, 5)
INSERT INTO locationInAnimal VALUES ("right thig", 15, 0, 5)
INSERT INTO locationInAnimal VALUES ("left thig", 16, 0, 5)
INSERT INTO locationInAnimal VALUES ("right knee", 17, 0, 5) 
INSERT INTO locationInAnimal VALUES ("left knee", 18, 0, 5)
INSERT INTO locationInAnimal VALUES ("right ham", 19, 1, 5)
INSERT INTO locationInAnimal VALUES ("left ham", 20, 1, 5)
INSERT INTO locationInAnimal VALUES ("right calf", 21, 0, 5)
INSERT INTO locationInAnimal VALUES ("left calf", 22, 0, 5)
INSERT INTO locationInAnimal VALUES ("right foot", 23, 0, 5)
INSERT INTO locationInAnimal VALUES ("left foot", 24, 0, 5)

INSERT INTO locationInAnimal VALUES ("Head", 1, 0, 6)
INSERT INTO locationInAnimal VALUES ("neck", 2, 1, 6)
INSERT INTO locationInAnimal VALUES ("right armpit", 3, 1, 6)
INSERT INTO locationInAnimal VALUES ("left armpit", 4, 1, 6)
INSERT INTO locationInAnimal VALUES ("right arm", 5, 0, 6)
INSERT INTO locationInAnimal VALUES ("left arm", 6, 0, 6)
INSERT INTO locationInAnimal VALUES ("right hand", 7, 0, 6)
INSERT INTO locationInAnimal VALUES ("left hand", 8, 0, 6)
INSERT INTO locationInAnimal VALUES ("chest", 9, 0, 6)
INSERT INTO locationInAnimal VALUES ("stomach", 10, 0, 6)
INSERT INTO locationInAnimal VALUES ("back", 11, 0, 6)
INSERT INTO locationInAnimal VALUES ("right side", 12, 1, 6)
INSERT INTO locationInAnimal VALUES ("left side", 13, 1, 6)
INSERT INTO locationInAnimal VALUES ("groin", 14, 1, 6)
INSERT INTO locationInAnimal VALUES ("right thig", 15, 0, 6)
INSERT INTO locationInAnimal VALUES ("left thig", 16, 0, 6)
INSERT INTO locationInAnimal VALUES ("right knee", 17, 0, 6) 
INSERT INTO locationInAnimal VALUES ("left knee", 18, 0, 6)
INSERT INTO locationInAnimal VALUES ("right ham", 19, 1, 6)
INSERT INTO locationInAnimal VALUES ("left ham", 20, 1, 6)
INSERT INTO locationInAnimal VALUES ("right calf", 21, 0, 6)
INSERT INTO locationInAnimal VALUES ("left calf", 22, 0, 6)
INSERT INTO locationInAnimal VALUES ("right foot", 23, 0, 6)
INSERT INTO locationInAnimal VALUES ("left foot", 24, 0, 6)

INSERT INTO locationInAnimal VALUES ("Head", 1, 0, 7)
INSERT INTO locationInAnimal VALUES ("neck", 2, 1, 7)
INSERT INTO locationInAnimal VALUES ("right armpit", 3, 1, 7)
INSERT INTO locationInAnimal VALUES ("left armpit", 4, 1, 7)
INSERT INTO locationInAnimal VALUES ("right arm", 5, 0, 7)
INSERT INTO locationInAnimal VALUES ("left arm", 6, 0, 7)
INSERT INTO locationInAnimal VALUES ("right hand", 7, 0, 7)
INSERT INTO locationInAnimal VALUES ("left hand", 8, 0, 7)
INSERT INTO locationInAnimal VALUES ("chest", 9, 0, 7)
INSERT INTO locationInAnimal VALUES ("stomach", 10, 0, 7)
INSERT INTO locationInAnimal VALUES ("back", 11, 0, 7)
INSERT INTO locationInAnimal VALUES ("right side", 12, 1, 7)
INSERT INTO locationInAnimal VALUES ("left side", 13, 1, 7)
INSERT INTO locationInAnimal VALUES ("groin", 14, 1, 7)
INSERT INTO locationInAnimal VALUES ("right thig", 15, 0, 7)
INSERT INTO locationInAnimal VALUES ("left thig", 16, 0, 7)
INSERT INTO locationInAnimal VALUES ("right knee", 17, 0, 7) 
INSERT INTO locationInAnimal VALUES ("left knee", 18, 0, 7)
INSERT INTO locationInAnimal VALUES ("right ham", 19, 1, 7)
INSERT INTO locationInAnimal VALUES ("left ham", 20, 1, 7)
INSERT INTO locationInAnimal VALUES ("right calf", 21, 0, 7)
INSERT INTO locationInAnimal VALUES ("left calf", 22, 0, 7)
INSERT INTO locationInAnimal VALUES ("right foot", 23, 0, 7)
INSERT INTO locationInAnimal VALUES ("left foot", 24, 0, 7)

INSERT INTO route(locationToID, locationFromID) VALUES (2,1)
INSERT INTO route VALUES (1,2)
INSERT INTO route VALUES(3,2)
INSERT INTO route VALUES(4,2)
INSERT INTO route VALUES(2,3)
INSERT INTO route VALUES (5,3)
INSERT INTO route VALUES(9,3)
INSERT INTO route VALUES(2,4)
INSERT INTO route VALUES(6,4)
INSERT INTO route VALUES (9,4)
INSERT INTO route VALUES(3,5)
INSERT INTO route VALUES(7,5)
INSERT INTO route VALUES(4,6)
INSERT INTO route VALUES (8,6)
INSERT INTO route VALUES(5,7)
INSERT INTO route VALUES(6,8)
INSERT INTO route VALUES(3,9)
INSERT INTO route VALUES (4,9)
INSERT INTO route VALUES(10,9)
INSERT INTO route VALUES(11,9)
INSERT INTO route VALUES(9,11)
INSERT INTO route VALUES (12,11)
INSERT INTO route VALUES(13,11)
INSERT INTO route VALUES(9,10)
INSERT INTO route VALUES(12,10)
INSERT INTO route VALUES(13,10)
INSERT INTO route VALUES(14,10)
INSERT INTO route VALUES(10,12)
INSERT INTO route VALUES(11,12)
INSERT INTO route VALUES(15,12)
INSERT INTO route VALUES(10,13)
INSERT INTO route VALUES(11,13)
INSERT INTO route VALUES(16,13)
INSERT INTO route VALUES(10,14)
INSERT INTO route VALUES(15,14)
INSERT INTO route VALUES(16,14)
INSERT INTO route VALUES(12,15)
INSERT INTO route VALUES(14,15)
INSERT INTO route VALUES(17,15)
INSERT INTO route VALUES(19,15)
INSERT INTO route VALUES(13,16)
INSERT INTO route VALUES(14,16)
INSERT INTO route VALUES(18,16)
INSERT INTO route VALUES(20,16)
INSERT INTO route VALUES(15,17)
INSERT INTO route VALUES(21,17)
INSERT INTO route VALUES(16,18)
INSERT INTO route VALUES(22,18)
INSERT INTO route VALUES(15,19)
INSERT INTO route VALUES(21,19)
INSERT INTO route VALUES(16,20)
INSERT INTO route VALUES(22,20)
INSERT INTO route VALUES(17,21)
INSERT INTO route VALUES(19,21)
INSERT INTO route VALUES(23,21)
INSERT INTO route VALUES(18,22)
INSERT INTO route VALUES(20,22)
INSERT INTO route VALUES(24,22)
INSERT INTO route VALUES(21,23)
INSERT INTO route VALUES(22,24)


