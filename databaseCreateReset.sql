DROP DATABASE IF EXISTS tickslife;
CREATE DATABASE tickslife;
USE tickslife;

CREATE TABLE tile
(
  X INT NOT NULL,
  Y INT NOT NULL,
  level INT NOT NULL,
  PRIMARY KEY (X, Y, level)
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

CREATE TABLE animalRoute
(
  id INT NOT NULL,
  animalID INT NOT NULL,
  X INT NOT NULL,
  Y INT NOT NULL,
  level INT NOT NULL,
  PRIMARY KEY (id ,animalID),
  FOREIGN KEY (X,Y,level) REFERENCES tile(X, Y, level)
);

CREATE TABLE description
(
  color INT NOT NULL,
  descriptionID INT NOT NULL,
  description VARCHAR(400) NOT NULL,
  X INT NOT NULL,
  Y INT NOT NULL,
  level INT NOT NULL,
  PRIMARY KEY (descriptionID, level),
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
  PRIMARY KEY (locationID, animalID),
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
  animalID INT NOT NULL,
  PRIMARY KEY (locationToID, locationFromID, animalID),
  FOREIGN KEY (animalID) REFERENCES animal(animalID),
  FOREIGN KEY (locationToID) REFERENCES locationInAnimal(locationID),
  FOREIGN KEY (locationFromID) REFERENCES locationInAnimal(locationID)
);

CREATE TABLE story
(
  storyID INT NOT NULL,
  description VARCHAR(1000) NOT NULL
); 

#lvl1
INSERT INTO tile VALUES (1,1,1);
INSERT INTO tile VALUES (2,1,1);
INSERT INTO tile VALUES (3,1,1);
INSERT INTO tile VALUES (4,1,1);
INSERT INTO tile VALUES (5,1,1);

INSERT INTO tile VALUES (1,2,1);
INSERT INTO tile VALUES (2,2,1);
INSERT INTO tile VALUES (3,2,1);
INSERT INTO tile VALUES (4,2,1);
INSERT INTO tile VALUES (5,2,1);

INSERT INTO tile VALUES (1,3,1);
INSERT INTO tile VALUES (2,3,1);
INSERT INTO tile VALUES (3,3,1);
INSERT INTO tile VALUES (4,3,1);
INSERT INTO tile VALUES (5,3,1);

INSERT INTO tile VALUES (1,4,1);
INSERT INTO tile VALUES (2,4,1);
INSERT INTO tile VALUES (3,4,1);
INSERT INTO tile VALUES (4,4,1);
INSERT INTO tile VALUES (5,4,1);

INSERT INTO tile VALUES (1,5,1);
INSERT INTO tile VALUES (2,5,1);
INSERT INTO tile VALUES (3,5,1);
INSERT INTO tile VALUES (4,5,1);
INSERT INTO tile VALUES (5,5,1);

#lvl2
INSERT INTO tile VALUES (1,1,2);
INSERT INTO tile VALUES (2,1,2);
INSERT INTO tile VALUES (3,1,2);
INSERT INTO tile VALUES (4,1,2);

INSERT INTO tile VALUES (1,2,2);
INSERT INTO tile VALUES (2,2,2);
INSERT INTO tile VALUES (3,2,2);
INSERT INTO tile VALUES (4,2,2);

INSERT INTO tile VALUES (1,3,2);
INSERT INTO tile VALUES (2,3,2);
INSERT INTO tile VALUES (3,3,2);
INSERT INTO tile VALUES (4,3,2);

INSERT INTO tile VALUES (1,4,2);
INSERT INTO tile VALUES (2,4,2);
INSERT INTO tile VALUES (3,4,2);
INSERT INTO tile VALUES (4,4,2);

INSERT INTO tile VALUES (1,5,2);
INSERT INTO tile VALUES (2,5,2);
INSERT INTO tile VALUES (3,5,2);
INSERT INTO tile VALUES (4,5,2);

#lvl3
INSERT INTO tile VALUES (1,1,3);
INSERT INTO tile VALUES (2,1,3);
INSERT INTO tile VALUES (3,1,3);

INSERT INTO tile VALUES (1,2,3);
INSERT INTO tile VALUES (2,2,3);
INSERT INTO tile VALUES (3,2,3);
INSERT INTO tile VALUES (4,2,3);
INSERT INTO tile VALUES (5,2,3);

INSERT INTO tile VALUES (1,3,3);
INSERT INTO tile VALUES (2,3,3);
INSERT INTO tile VALUES (3,3,3);

#lvl4
INSERT INTO tile VALUES (1,1,4);
INSERT INTO tile VALUES (2,1,4);
INSERT INTO tile VALUES (3,1,4);
INSERT INTO tile VALUES (4,1,4);
INSERT INTO tile VALUES (5,1,4);
INSERT INTO tile VALUES (6,1,4);

INSERT INTO tile VALUES (1,2,4);
INSERT INTO tile VALUES (2,2,4);
INSERT INTO tile VALUES (3,2,4);
INSERT INTO tile VALUES (4,2,4);
INSERT INTO tile VALUES (5,2,4);
INSERT INTO tile VALUES (6,2,4);

INSERT INTO tile VALUES (1,3,4);
INSERT INTO tile VALUES (2,3,4);
INSERT INTO tile VALUES (3,3,4);
INSERT INTO tile VALUES (4,3,4);
INSERT INTO tile VALUES (5,3,4);
INSERT INTO tile VALUES (6,3,4);

INSERT INTO tile VALUES (1,4,4);
INSERT INTO tile VALUES (2,4,4);
INSERT INTO tile VALUES (3,4,4);
INSERT INTO tile VALUES (4,4,4);
INSERT INTO tile VALUES (5,4,4);
INSERT INTO tile VALUES (6,4,4);

INSERT INTO tile VALUES (1,5,4);
INSERT INTO tile VALUES (2,5,4);
INSERT INTO tile VALUES (3,5,4);
INSERT INTO tile VALUES (4,5,4);
INSERT INTO tile VALUES (5,5,4);
INSERT INTO tile VALUES (6,5,4);

INSERT INTO tile VALUES (1,6,4);
INSERT INTO tile VALUES (2,6,4);
INSERT INTO tile VALUES (3,6,4);
INSERT INTO tile VALUES (4,6,4);
INSERT INTO tile VALUES (5,6,4);
INSERT INTO tile VALUES (6,6,4);
INSERT INTO tile VALUES (7,6,4);


#animals id,name,x,y,lvl
INSERT INTO animal VALUES (1,"Squirrel",1,5,1);
INSERT INTO animal VALUES (2,"Mole",3,1,1);

INSERT INTO animal VALUES (3,"Dog",2,4,2);
INSERT INTO animal VALUES (4,"Man",1,5,2);

INSERT INTO animal VALUES (5,"Man",1,3,3);

INSERT INTO animal VALUES (6,"Jogger",1,5,4);
INSERT INTO animal VALUES (7,"Child",1,5,4);

INSERT INTO locationInAnimal VALUES ("Head", 1, 0, 1);
INSERT INTO locationInAnimal VALUES ("neck", 2, 1, 1);
INSERT INTO locationInAnimal VALUES ("right armpit", 3, 1, 1);
INSERT INTO locationInAnimal VALUES ("left armpit", 4, 1, 1);
INSERT INTO locationInAnimal VALUES ("right arm", 5, 0, 1);
INSERT INTO locationInAnimal VALUES ("left arm", 6, 0, 1);
INSERT INTO locationInAnimal VALUES ("right hand", 7, 0, 1);
INSERT INTO locationInAnimal VALUES ("left hand", 8, 0, 1);
INSERT INTO locationInAnimal VALUES ("chest", 9, 0, 1);
INSERT INTO locationInAnimal VALUES ("stomach", 10, 0, 1);
INSERT INTO locationInAnimal VALUES ("back", 11, 0, 1);
INSERT INTO locationInAnimal VALUES ("right side", 12, 1, 1);
INSERT INTO locationInAnimal VALUES ("left side", 13, 1, 1);
INSERT INTO locationInAnimal VALUES ("groin", 14, 1, 1);
INSERT INTO locationInAnimal VALUES ("right thig", 15, 0, 1);
INSERT INTO locationInAnimal VALUES ("left thig", 16, 0, 1);
INSERT INTO locationInAnimal VALUES ("right knee", 17, 0, 1) ;
INSERT INTO locationInAnimal VALUES ("left knee", 18, 0, 1);
INSERT INTO locationInAnimal VALUES ("right ham", 19, 1, 1);
INSERT INTO locationInAnimal VALUES ("left ham", 20, 1, 1);
INSERT INTO locationInAnimal VALUES ("right calf", 21, 0, 1);
INSERT INTO locationInAnimal VALUES ("left calf", 22, 0, 1);
INSERT INTO locationInAnimal VALUES ("right foot", 23, 0, 1);
INSERT INTO locationInAnimal VALUES ("left foot", 24, 0, 1);

INSERT INTO locationInAnimal VALUES ("Head", 1, 0, 2);
INSERT INTO locationInAnimal VALUES ("neck", 2, 1, 2);
INSERT INTO locationInAnimal VALUES ("right armpit", 3, 1, 2);
INSERT INTO locationInAnimal VALUES ("left armpit", 4, 1, 2);
INSERT INTO locationInAnimal VALUES ("right arm", 5, 0, 2);
INSERT INTO locationInAnimal VALUES ("left arm", 6, 0, 2);
INSERT INTO locationInAnimal VALUES ("right hand", 7, 0, 2);
INSERT INTO locationInAnimal VALUES ("left hand", 8, 0, 2);
INSERT INTO locationInAnimal VALUES ("chest", 9, 0, 2);
INSERT INTO locationInAnimal VALUES ("stomach", 10, 0, 2);
INSERT INTO locationInAnimal VALUES ("back", 11, 0, 2);
INSERT INTO locationInAnimal VALUES ("right side", 12, 1, 2);
INSERT INTO locationInAnimal VALUES ("left side", 13, 1, 2);
INSERT INTO locationInAnimal VALUES ("groin", 14, 1, 2);
INSERT INTO locationInAnimal VALUES ("right thig", 15, 0, 2);
INSERT INTO locationInAnimal VALUES ("left thig", 16, 0, 2);
INSERT INTO locationInAnimal VALUES ("right knee", 17, 0, 2);
INSERT INTO locationInAnimal VALUES ("left knee", 18, 0, 2);
INSERT INTO locationInAnimal VALUES ("right ham", 19, 1, 2);
INSERT INTO locationInAnimal VALUES ("left ham", 20, 1, 2);
INSERT INTO locationInAnimal VALUES ("right calf", 21, 0, 2);
INSERT INTO locationInAnimal VALUES ("left calf", 22, 0, 2);
INSERT INTO locationInAnimal VALUES ("right foot", 23, 0, 2);
INSERT INTO locationInAnimal VALUES ("left foot", 24, 0, 2);

INSERT INTO locationInAnimal VALUES ("Head", 1, 0, 3);
INSERT INTO locationInAnimal VALUES ("neck", 2, 1, 3);
INSERT INTO locationInAnimal VALUES ("right armpit", 3, 1, 3);
INSERT INTO locationInAnimal VALUES ("left armpit", 4, 1, 3);
INSERT INTO locationInAnimal VALUES ("right arm", 5, 0, 3);
INSERT INTO locationInAnimal VALUES ("left arm", 6, 0, 3);
INSERT INTO locationInAnimal VALUES ("right hand", 7, 0, 3);
INSERT INTO locationInAnimal VALUES ("left hand", 8, 0, 3);
INSERT INTO locationInAnimal VALUES ("chest", 9, 0, 3);
INSERT INTO locationInAnimal VALUES ("stomach", 10, 0, 3);
INSERT INTO locationInAnimal VALUES ("back", 11, 0, 3);
INSERT INTO locationInAnimal VALUES ("right side", 12, 1, 3);
INSERT INTO locationInAnimal VALUES ("left side", 13, 1, 3);
INSERT INTO locationInAnimal VALUES ("groin", 14, 1, 3);
INSERT INTO locationInAnimal VALUES ("right thig", 15, 0, 3);
INSERT INTO locationInAnimal VALUES ("left thig", 16, 0, 3);
INSERT INTO locationInAnimal VALUES ("right knee", 17, 0, 3);
INSERT INTO locationInAnimal VALUES ("left knee", 18, 0, 3);
INSERT INTO locationInAnimal VALUES ("right ham", 19, 1, 3);
INSERT INTO locationInAnimal VALUES ("left ham", 20, 1, 3);
INSERT INTO locationInAnimal VALUES ("right calf", 21, 0, 3);
INSERT INTO locationInAnimal VALUES ("left calf", 22, 0, 3);
INSERT INTO locationInAnimal VALUES ("right foot", 23, 0, 3);
INSERT INTO locationInAnimal VALUES ("left foot", 24, 0, 3);

INSERT INTO locationInAnimal VALUES ("Head", 1, 0, 4);
INSERT INTO locationInAnimal VALUES ("neck", 2, 1, 4);
INSERT INTO locationInAnimal VALUES ("right armpit", 3, 1, 4);
INSERT INTO locationInAnimal VALUES ("left armpit", 4, 1, 4);
INSERT INTO locationInAnimal VALUES ("right arm", 5, 0, 4);
INSERT INTO locationInAnimal VALUES ("left arm", 6, 0, 4);
INSERT INTO locationInAnimal VALUES ("right hand", 7, 0, 4);
INSERT INTO locationInAnimal VALUES ("left hand", 8, 0, 4);
INSERT INTO locationInAnimal VALUES ("chest", 9, 0, 4);
INSERT INTO locationInAnimal VALUES ("stomach", 10, 0, 4);
INSERT INTO locationInAnimal VALUES ("back", 11, 0, 4);
INSERT INTO locationInAnimal VALUES ("right side", 12, 1, 4);
INSERT INTO locationInAnimal VALUES ("left side", 13, 1, 4);
INSERT INTO locationInAnimal VALUES ("groin", 14, 1, 4);
INSERT INTO locationInAnimal VALUES ("right thig", 15, 0, 4);
INSERT INTO locationInAnimal VALUES ("left thig", 16, 0, 4);
INSERT INTO locationInAnimal VALUES ("right knee", 17, 0, 4);
INSERT INTO locationInAnimal VALUES ("left knee", 18, 0, 4);
INSERT INTO locationInAnimal VALUES ("right ham", 19, 1, 4);
INSERT INTO locationInAnimal VALUES ("left ham", 20, 1, 4);
INSERT INTO locationInAnimal VALUES ("right calf", 21, 0, 4);
INSERT INTO locationInAnimal VALUES ("left calf", 22, 0, 4);
INSERT INTO locationInAnimal VALUES ("right foot", 23, 0, 4);
INSERT INTO locationInAnimal VALUES ("left foot", 24, 0, 4);

INSERT INTO locationInAnimal VALUES ("Head", 1, 0, 5);
INSERT INTO locationInAnimal VALUES ("neck", 2, 1, 5);
INSERT INTO locationInAnimal VALUES ("right armpit", 3, 1, 5);
INSERT INTO locationInAnimal VALUES ("left armpit", 4, 1, 5);
INSERT INTO locationInAnimal VALUES ("right arm", 5, 0, 5);
INSERT INTO locationInAnimal VALUES ("left arm", 6, 0, 5);
INSERT INTO locationInAnimal VALUES ("right hand", 7, 0, 5);
INSERT INTO locationInAnimal VALUES ("left hand", 8, 0, 5);
INSERT INTO locationInAnimal VALUES ("chest", 9, 0, 5);
INSERT INTO locationInAnimal VALUES ("stomach", 10, 0, 5);
INSERT INTO locationInAnimal VALUES ("back", 11, 0, 5);
INSERT INTO locationInAnimal VALUES ("right side", 12, 1, 5);
INSERT INTO locationInAnimal VALUES ("left side", 13, 1, 5);
INSERT INTO locationInAnimal VALUES ("groin", 14, 1, 5);
INSERT INTO locationInAnimal VALUES ("right thig", 15, 0, 5);
INSERT INTO locationInAnimal VALUES ("left thig", 16, 0, 5);
INSERT INTO locationInAnimal VALUES ("right knee", 17, 0, 5);
INSERT INTO locationInAnimal VALUES ("left knee", 18, 0, 5);
INSERT INTO locationInAnimal VALUES ("right ham", 19, 1, 5);
INSERT INTO locationInAnimal VALUES ("left ham", 20, 1, 5);
INSERT INTO locationInAnimal VALUES ("right calf", 21, 0, 5);
INSERT INTO locationInAnimal VALUES ("left calf", 22, 0, 5);
INSERT INTO locationInAnimal VALUES ("right foot", 23, 0, 5);
INSERT INTO locationInAnimal VALUES ("left foot", 24, 0, 5);

INSERT INTO locationInAnimal VALUES ("Head", 1, 0, 6);
INSERT INTO locationInAnimal VALUES ("neck", 2, 1, 6);
INSERT INTO locationInAnimal VALUES ("right armpit", 3, 1, 6);
INSERT INTO locationInAnimal VALUES ("left armpit", 4, 1, 6);
INSERT INTO locationInAnimal VALUES ("right arm", 5, 0, 6);
INSERT INTO locationInAnimal VALUES ("left arm", 6, 0, 6);
INSERT INTO locationInAnimal VALUES ("right hand", 7, 0, 6);
INSERT INTO locationInAnimal VALUES ("left hand", 8, 0, 6);
INSERT INTO locationInAnimal VALUES ("chest", 9, 0, 6);
INSERT INTO locationInAnimal VALUES ("stomach", 10, 0, 6);
INSERT INTO locationInAnimal VALUES ("back", 11, 0, 6);
INSERT INTO locationInAnimal VALUES ("right side", 12, 1, 6);
INSERT INTO locationInAnimal VALUES ("left side", 13, 1, 6);
INSERT INTO locationInAnimal VALUES ("groin", 14, 1, 6);
INSERT INTO locationInAnimal VALUES ("right thig", 15, 0, 6);
INSERT INTO locationInAnimal VALUES ("left thig", 16, 0, 6);
INSERT INTO locationInAnimal VALUES ("right knee", 17, 0, 6);
INSERT INTO locationInAnimal VALUES ("left knee", 18, 0, 6);
INSERT INTO locationInAnimal VALUES ("right ham", 19, 1, 6);
INSERT INTO locationInAnimal VALUES ("left ham", 20, 1, 6);
INSERT INTO locationInAnimal VALUES ("right calf", 21, 0, 6);
INSERT INTO locationInAnimal VALUES ("left calf", 22, 0, 6);
INSERT INTO locationInAnimal VALUES ("right foot", 23, 0, 6);
INSERT INTO locationInAnimal VALUES ("left foot", 24, 0, 6);

INSERT INTO locationInAnimal VALUES ("Head", 1, 0, 7);
INSERT INTO locationInAnimal VALUES ("neck", 2, 1, 7);
INSERT INTO locationInAnimal VALUES ("right armpit", 3, 1, 7);
INSERT INTO locationInAnimal VALUES ("left armpit", 4, 1, 7);
INSERT INTO locationInAnimal VALUES ("right arm", 5, 0, 7);
INSERT INTO locationInAnimal VALUES ("left arm", 6, 0, 7);
INSERT INTO locationInAnimal VALUES ("right hand", 7, 0, 7);
INSERT INTO locationInAnimal VALUES ("left hand", 8, 0, 7);
INSERT INTO locationInAnimal VALUES ("chest", 9, 0, 7);
INSERT INTO locationInAnimal VALUES ("stomach", 10, 0, 7);
INSERT INTO locationInAnimal VALUES ("back", 11, 0, 7);
INSERT INTO locationInAnimal VALUES ("right side", 12, 1, 7);
INSERT INTO locationInAnimal VALUES ("left side", 13, 1, 7);
INSERT INTO locationInAnimal VALUES ("groin", 14, 1, 7);
INSERT INTO locationInAnimal VALUES ("right thig", 15, 0, 7);
INSERT INTO locationInAnimal VALUES ("left thig", 16, 0, 7);
INSERT INTO locationInAnimal VALUES ("right knee", 17, 0, 7);
INSERT INTO locationInAnimal VALUES ("left knee", 18, 0, 7);
INSERT INTO locationInAnimal VALUES ("right ham", 19, 1, 7);
INSERT INTO locationInAnimal VALUES ("left ham", 20, 1, 7);
INSERT INTO locationInAnimal VALUES ("right calf", 21, 0, 7);
INSERT INTO locationInAnimal VALUES ("left calf", 22, 0, 7);
INSERT INTO locationInAnimal VALUES ("right foot", 23, 0, 7);
INSERT INTO locationInAnimal VALUES ("left foot", 24, 0, 7);

INSERT INTO route VALUES(2,1,1);
INSERT INTO route VALUES(1,2,1);
INSERT INTO route VALUES(3,2,1);
INSERT INTO route VALUES(4,2,1);
INSERT INTO route VALUES(2,3,1);
INSERT INTO route VALUES(5,3,1);
INSERT INTO route VALUES(9,3,1);
INSERT INTO route VALUES(2,4,1);
INSERT INTO route VALUES(6,4,1);
INSERT INTO route VALUES(9,4,1);
INSERT INTO route VALUES(3,5,1);
INSERT INTO route VALUES(7,5,1);
INSERT INTO route VALUES(4,6,1);
INSERT INTO route VALUES(8,6,1);
INSERT INTO route VALUES(5,7,1);
INSERT INTO route VALUES(6,8,1);
INSERT INTO route VALUES(3,9,1);
INSERT INTO route VALUES(4,9,1);
INSERT INTO route VALUES(10,9,1);
INSERT INTO route VALUES(11,9,1);
INSERT INTO route VALUES(9,11,1);
INSERT INTO route VALUES(12,11,1);
INSERT INTO route VALUES(13,11,1);
INSERT INTO route VALUES(9,10,1);
INSERT INTO route VALUES(12,10,1);
INSERT INTO route VALUES(13,10,1);
INSERT INTO route VALUES(14,10,1);
INSERT INTO route VALUES(10,12,1);
INSERT INTO route VALUES(11,12,1);
INSERT INTO route VALUES(15,12,1);
INSERT INTO route VALUES(10,13,1);
INSERT INTO route VALUES(11,13,1);
INSERT INTO route VALUES(16,13,1);
INSERT INTO route VALUES(10,14,1);
INSERT INTO route VALUES(15,14,1);
INSERT INTO route VALUES(16,14,1);
INSERT INTO route VALUES(12,15,1);
INSERT INTO route VALUES(14,15,1);
INSERT INTO route VALUES(17,15,1);
INSERT INTO route VALUES(19,15,1);
INSERT INTO route VALUES(13,16,1);
INSERT INTO route VALUES(14,16,1);
INSERT INTO route VALUES(18,16,1);
INSERT INTO route VALUES(20,16,1);
INSERT INTO route VALUES(15,17,1);
INSERT INTO route VALUES(21,17,1);
INSERT INTO route VALUES(16,18,1);
INSERT INTO route VALUES(22,18,1);
INSERT INTO route VALUES(15,19,1);
INSERT INTO route VALUES(21,19,1);
INSERT INTO route VALUES(16,20,1);
INSERT INTO route VALUES(22,20,1);
INSERT INTO route VALUES(17,21,1);
INSERT INTO route VALUES(19,21,1);
INSERT INTO route VALUES(23,21,1);
INSERT INTO route VALUES(18,22,1);
INSERT INTO route VALUES(20,22,1);
INSERT INTO route VALUES(24,22,1);
INSERT INTO route VALUES(21,23,1);
INSERT INTO route VALUES(22,24,1);

INSERT INTO route VALUES(2,1,2);
INSERT INTO route VALUES(1,2,2);
INSERT INTO route VALUES(3,2,2);
INSERT INTO route VALUES(4,2,2);
INSERT INTO route VALUES(2,3,2);
INSERT INTO route VALUES(5,3,2);
INSERT INTO route VALUES(9,3,2);
INSERT INTO route VALUES(2,4,2);
INSERT INTO route VALUES(6,4,2);
INSERT INTO route VALUES(9,4,2);
INSERT INTO route VALUES(3,5,2);
INSERT INTO route VALUES(7,5,2);
INSERT INTO route VALUES(4,6,2);
INSERT INTO route VALUES(8,6,2);
INSERT INTO route VALUES(5,7,2);
INSERT INTO route VALUES(6,8,2);
INSERT INTO route VALUES(3,9,2);
INSERT INTO route VALUES(4,9,2);
INSERT INTO route VALUES(10,9,2);
INSERT INTO route VALUES(11,9,2);
INSERT INTO route VALUES(9,11,2);
INSERT INTO route VALUES(12,11,2);
INSERT INTO route VALUES(13,11,2);
INSERT INTO route VALUES(9,10,2);
INSERT INTO route VALUES(12,10,2);
INSERT INTO route VALUES(13,10,2);
INSERT INTO route VALUES(14,10,2);
INSERT INTO route VALUES(10,12,2);
INSERT INTO route VALUES(11,12,2);
INSERT INTO route VALUES(15,12,2);
INSERT INTO route VALUES(10,13,2);
INSERT INTO route VALUES(11,13,2);
INSERT INTO route VALUES(16,13,2);
INSERT INTO route VALUES(10,14,2);
INSERT INTO route VALUES(15,14,2);
INSERT INTO route VALUES(16,14,2);
INSERT INTO route VALUES(12,15,2);
INSERT INTO route VALUES(14,15,2);
INSERT INTO route VALUES(17,15,2);
INSERT INTO route VALUES(19,15,2);
INSERT INTO route VALUES(13,16,2);
INSERT INTO route VALUES(14,16,2);
INSERT INTO route VALUES(18,16,2);
INSERT INTO route VALUES(20,16,2);
INSERT INTO route VALUES(15,17,2);
INSERT INTO route VALUES(21,17,2);
INSERT INTO route VALUES(16,18,2);
INSERT INTO route VALUES(22,18,2);
INSERT INTO route VALUES(15,19,2);
INSERT INTO route VALUES(21,19,2);
INSERT INTO route VALUES(16,20,2);
INSERT INTO route VALUES(22,20,2);
INSERT INTO route VALUES(17,21,2);
INSERT INTO route VALUES(19,21,2);
INSERT INTO route VALUES(23,21,2);
INSERT INTO route VALUES(18,22,2);
INSERT INTO route VALUES(20,22,2);
INSERT INTO route VALUES(24,22,2);
INSERT INTO route VALUES(21,23,2);
INSERT INTO route VALUES(22,24,2);

INSERT INTO route VALUES(2,1,3);
INSERT INTO route VALUES(1,2,3);
INSERT INTO route VALUES(3,2,3);
INSERT INTO route VALUES(4,2,3);
INSERT INTO route VALUES(2,3,3);
INSERT INTO route VALUES(5,3,3);
INSERT INTO route VALUES(9,3,3);
INSERT INTO route VALUES(2,4,3);
INSERT INTO route VALUES(6,4,3);
INSERT INTO route VALUES(9,4,3);
INSERT INTO route VALUES(3,5,3);
INSERT INTO route VALUES(7,5,3);
INSERT INTO route VALUES(4,6,3);
INSERT INTO route VALUES(8,6,3);
INSERT INTO route VALUES(5,7,3);
INSERT INTO route VALUES(6,8,3);
INSERT INTO route VALUES(3,9,3);
INSERT INTO route VALUES(4,9,3);
INSERT INTO route VALUES(10,9,3);
INSERT INTO route VALUES(11,9,3);
INSERT INTO route VALUES(9,11,3);
INSERT INTO route VALUES(12,11,3);
INSERT INTO route VALUES(13,11,3);
INSERT INTO route VALUES(9,10,3);
INSERT INTO route VALUES(12,10,3);
INSERT INTO route VALUES(13,10,3);
INSERT INTO route VALUES(14,10,3);
INSERT INTO route VALUES(10,12,3);
INSERT INTO route VALUES(11,12,3);
INSERT INTO route VALUES(15,12,3);
INSERT INTO route VALUES(10,13,3);
INSERT INTO route VALUES(11,13,3);
INSERT INTO route VALUES(16,13,3);
INSERT INTO route VALUES(10,14,3);
INSERT INTO route VALUES(15,14,3);
INSERT INTO route VALUES(16,14,3);
INSERT INTO route VALUES(12,15,3);
INSERT INTO route VALUES(14,15,3);
INSERT INTO route VALUES(17,15,3);
INSERT INTO route VALUES(19,15,3);
INSERT INTO route VALUES(13,16,3);
INSERT INTO route VALUES(14,16,3);
INSERT INTO route VALUES(18,16,3);
INSERT INTO route VALUES(20,16,3);
INSERT INTO route VALUES(15,17,3);
INSERT INTO route VALUES(21,17,3);
INSERT INTO route VALUES(16,18,3);
INSERT INTO route VALUES(22,18,3);
INSERT INTO route VALUES(15,19,3);
INSERT INTO route VALUES(21,19,3);
INSERT INTO route VALUES(16,20,3);
INSERT INTO route VALUES(22,20,3);
INSERT INTO route VALUES(17,21,3);
INSERT INTO route VALUES(19,21,3);
INSERT INTO route VALUES(23,21,3);
INSERT INTO route VALUES(18,22,3);
INSERT INTO route VALUES(20,22,3);
INSERT INTO route VALUES(24,22,3);
INSERT INTO route VALUES(21,23,3);
INSERT INTO route VALUES(22,24,3);

INSERT INTO route VALUES(2,1,4);
INSERT INTO route VALUES(1,2,4);
INSERT INTO route VALUES(3,2,4);
INSERT INTO route VALUES(4,2,4);
INSERT INTO route VALUES(2,3,4);
INSERT INTO route VALUES(5,3,4);
INSERT INTO route VALUES(9,3,4);
INSERT INTO route VALUES(2,4,4);
INSERT INTO route VALUES(6,4,4);
INSERT INTO route VALUES(9,4,4);
INSERT INTO route VALUES(3,5,4);
INSERT INTO route VALUES(7,5,4);
INSERT INTO route VALUES(4,6,4);
INSERT INTO route VALUES(8,6,4);
INSERT INTO route VALUES(5,7,4);
INSERT INTO route VALUES(6,8,4);
INSERT INTO route VALUES(3,9,4);
INSERT INTO route VALUES(4,9,4);
INSERT INTO route VALUES(10,9,4);
INSERT INTO route VALUES(11,9,4);
INSERT INTO route VALUES(9,11,4);
INSERT INTO route VALUES(12,11,4);
INSERT INTO route VALUES(13,11,4);
INSERT INTO route VALUES(9,10,4);
INSERT INTO route VALUES(12,10,4);
INSERT INTO route VALUES(13,10,4);
INSERT INTO route VALUES(14,10,4);
INSERT INTO route VALUES(10,12,4);
INSERT INTO route VALUES(11,12,4);
INSERT INTO route VALUES(15,12,4);
INSERT INTO route VALUES(10,13,4);
INSERT INTO route VALUES(11,13,4);
INSERT INTO route VALUES(16,13,4);
INSERT INTO route VALUES(10,14,4);
INSERT INTO route VALUES(15,14,4);
INSERT INTO route VALUES(16,14,4);
INSERT INTO route VALUES(12,15,4);
INSERT INTO route VALUES(14,15,4);
INSERT INTO route VALUES(17,15,4);
INSERT INTO route VALUES(19,15,4);
INSERT INTO route VALUES(13,16,4);
INSERT INTO route VALUES(14,16,4);
INSERT INTO route VALUES(18,16,4);
INSERT INTO route VALUES(20,16,4);
INSERT INTO route VALUES(15,17,4);
INSERT INTO route VALUES(21,17,4);
INSERT INTO route VALUES(16,18,4);
INSERT INTO route VALUES(22,18,4);
INSERT INTO route VALUES(15,19,4);
INSERT INTO route VALUES(21,19,4);
INSERT INTO route VALUES(16,20,4);
INSERT INTO route VALUES(22,20,4);
INSERT INTO route VALUES(17,21,4);
INSERT INTO route VALUES(19,21,4);
INSERT INTO route VALUES(23,21,4);
INSERT INTO route VALUES(18,22,4);
INSERT INTO route VALUES(20,22,4);
INSERT INTO route VALUES(24,22,4);
INSERT INTO route VALUES(21,23,4);
INSERT INTO route VALUES(22,24,4);

INSERT INTO route VALUES(2,1,5);
INSERT INTO route VALUES(1,2,5);
INSERT INTO route VALUES(3,2,5);
INSERT INTO route VALUES(4,2,5);
INSERT INTO route VALUES(2,3,5);
INSERT INTO route VALUES(5,3,5);
INSERT INTO route VALUES(9,3,5);
INSERT INTO route VALUES(2,4,5);
INSERT INTO route VALUES(6,4,5);
INSERT INTO route VALUES(9,4,5);
INSERT INTO route VALUES(3,5,5);
INSERT INTO route VALUES(7,5,5);
INSERT INTO route VALUES(4,6,5);
INSERT INTO route VALUES(8,6,5);
INSERT INTO route VALUES(5,7,5);
INSERT INTO route VALUES(6,8,5);
INSERT INTO route VALUES(3,9,5);
INSERT INTO route VALUES(4,9,5);
INSERT INTO route VALUES(10,9,5);
INSERT INTO route VALUES(11,9,5);
INSERT INTO route VALUES(9,11,5);
INSERT INTO route VALUES(12,11,5);
INSERT INTO route VALUES(13,11,5);
INSERT INTO route VALUES(9,10,5);
INSERT INTO route VALUES(12,10,5);
INSERT INTO route VALUES(13,10,5);
INSERT INTO route VALUES(14,10,5);
INSERT INTO route VALUES(10,12,5);
INSERT INTO route VALUES(11,12,5);
INSERT INTO route VALUES(15,12,5);
INSERT INTO route VALUES(10,13,5);
INSERT INTO route VALUES(11,13,5);
INSERT INTO route VALUES(16,13,5);
INSERT INTO route VALUES(10,14,5);
INSERT INTO route VALUES(15,14,5);
INSERT INTO route VALUES(16,14,5);
INSERT INTO route VALUES(12,15,5);
INSERT INTO route VALUES(14,15,5);
INSERT INTO route VALUES(17,15,5);
INSERT INTO route VALUES(19,15,5);
INSERT INTO route VALUES(13,16,5);
INSERT INTO route VALUES(14,16,5);
INSERT INTO route VALUES(18,16,5);
INSERT INTO route VALUES(20,16,5);
INSERT INTO route VALUES(15,17,5);
INSERT INTO route VALUES(21,17,5);
INSERT INTO route VALUES(16,18,5);
INSERT INTO route VALUES(22,18,5);
INSERT INTO route VALUES(15,19,5);
INSERT INTO route VALUES(21,19,5);
INSERT INTO route VALUES(16,20,5);
INSERT INTO route VALUES(22,20,5);
INSERT INTO route VALUES(17,21,5);
INSERT INTO route VALUES(19,21,5);
INSERT INTO route VALUES(23,21,5);
INSERT INTO route VALUES(18,22,5);
INSERT INTO route VALUES(20,22,5);
INSERT INTO route VALUES(24,22,5);
INSERT INTO route VALUES(21,23,5);
INSERT INTO route VALUES(22,24,5);

INSERT INTO route VALUES(2,1,6);
INSERT INTO route VALUES(1,2,6);
INSERT INTO route VALUES(3,2,6);
INSERT INTO route VALUES(4,2,6);
INSERT INTO route VALUES(2,3,6);
INSERT INTO route VALUES(5,3,6);
INSERT INTO route VALUES(9,3,6);
INSERT INTO route VALUES(2,4,6);
INSERT INTO route VALUES(6,4,6);
INSERT INTO route VALUES(9,4,6);
INSERT INTO route VALUES(3,5,6);
INSERT INTO route VALUES(7,5,6);
INSERT INTO route VALUES(4,6,6);
INSERT INTO route VALUES(8,6,6);
INSERT INTO route VALUES(5,7,6);
INSERT INTO route VALUES(6,8,6);
INSERT INTO route VALUES(3,9,6);
INSERT INTO route VALUES(4,9,6);
INSERT INTO route VALUES(10,9,6);
INSERT INTO route VALUES(11,9,6);
INSERT INTO route VALUES(9,11,6);
INSERT INTO route VALUES(12,11,6);
INSERT INTO route VALUES(13,11,6);
INSERT INTO route VALUES(9,10,6);
INSERT INTO route VALUES(12,10,6);
INSERT INTO route VALUES(13,10,6);
INSERT INTO route VALUES(14,10,6);
INSERT INTO route VALUES(10,12,6);
INSERT INTO route VALUES(11,12,6);
INSERT INTO route VALUES(15,12,6);
INSERT INTO route VALUES(10,13,6);
INSERT INTO route VALUES(11,13,6);
INSERT INTO route VALUES(16,13,6);
INSERT INTO route VALUES(10,14,6);
INSERT INTO route VALUES(15,14,6);
INSERT INTO route VALUES(16,14,6);
INSERT INTO route VALUES(12,15,6);
INSERT INTO route VALUES(14,15,6);
INSERT INTO route VALUES(17,15,6);
INSERT INTO route VALUES(19,15,6);
INSERT INTO route VALUES(13,16,6);
INSERT INTO route VALUES(14,16,6);
INSERT INTO route VALUES(18,16,6);
INSERT INTO route VALUES(20,16,6);
INSERT INTO route VALUES(15,17,6);
INSERT INTO route VALUES(21,17,6);
INSERT INTO route VALUES(16,18,6);
INSERT INTO route VALUES(22,18,6);
INSERT INTO route VALUES(15,19,6);
INSERT INTO route VALUES(21,19,6);
INSERT INTO route VALUES(16,20,6);
INSERT INTO route VALUES(22,20,6);
INSERT INTO route VALUES(17,21,6);
INSERT INTO route VALUES(19,21,6);
INSERT INTO route VALUES(23,21,6);
INSERT INTO route VALUES(18,22,6);
INSERT INTO route VALUES(20,22,6);
INSERT INTO route VALUES(24,22,6);
INSERT INTO route VALUES(21,23,6);
INSERT INTO route VALUES(22,24,6);

INSERT INTO route VALUES(2,1,7);
INSERT INTO route VALUES(1,2,7);
INSERT INTO route VALUES(3,2,7);
INSERT INTO route VALUES(4,2,7);
INSERT INTO route VALUES(2,3,7);
INSERT INTO route VALUES(5,3,7);
INSERT INTO route VALUES(9,3,7);
INSERT INTO route VALUES(2,4,7);
INSERT INTO route VALUES(6,4,7);
INSERT INTO route VALUES(9,4,7);
INSERT INTO route VALUES(3,5,7);
INSERT INTO route VALUES(7,5,7);
INSERT INTO route VALUES(4,6,7);
INSERT INTO route VALUES(8,6,7);
INSERT INTO route VALUES(5,7,7);
INSERT INTO route VALUES(6,8,7);
INSERT INTO route VALUES(3,9,7);
INSERT INTO route VALUES(4,9,7);
INSERT INTO route VALUES(10,9,7);
INSERT INTO route VALUES(11,9,7);
INSERT INTO route VALUES(9,11,7);
INSERT INTO route VALUES(12,11,7);
INSERT INTO route VALUES(13,11,7);
INSERT INTO route VALUES(9,10,7);
INSERT INTO route VALUES(12,10,7);
INSERT INTO route VALUES(13,10,7);
INSERT INTO route VALUES(14,10,7);
INSERT INTO route VALUES(10,12,7);
INSERT INTO route VALUES(11,12,7);
INSERT INTO route VALUES(15,12,7);
INSERT INTO route VALUES(10,13,7);
INSERT INTO route VALUES(11,13,7);
INSERT INTO route VALUES(16,13,7);
INSERT INTO route VALUES(10,14,7);
INSERT INTO route VALUES(15,14,7);
INSERT INTO route VALUES(16,14,7);
INSERT INTO route VALUES(12,15,7);
INSERT INTO route VALUES(14,15,7);
INSERT INTO route VALUES(17,15,7);
INSERT INTO route VALUES(19,15,7);
INSERT INTO route VALUES(13,16,7);
INSERT INTO route VALUES(14,16,7);
INSERT INTO route VALUES(18,16,7);
INSERT INTO route VALUES(20,16,7);
INSERT INTO route VALUES(15,17,7);
INSERT INTO route VALUES(21,17,7);
INSERT INTO route VALUES(16,18,7);
INSERT INTO route VALUES(22,18,7);
INSERT INTO route VALUES(15,19,7);
INSERT INTO route VALUES(21,19,7);
INSERT INTO route VALUES(16,20,7);
INSERT INTO route VALUES(22,20,7);
INSERT INTO route VALUES(17,21,7);
INSERT INTO route VALUES(19,21,7);
INSERT INTO route VALUES(23,21,7);
INSERT INTO route VALUES(18,22,7);
INSERT INTO route VALUES(20,22,7);
INSERT INTO route VALUES(24,22,7);
INSERT INTO route VALUES(21,23,7);
INSERT INTO route VALUES(22,24,7);

#tileObstacle description, startx, starty, startlvl, endx, endy, endlvl
INSERT INTO tileObstacle VALUES ("You decide not to climb over the stone in your way. It would take too much effort.",2,4,2,3,4,2);
INSERT INTO tileObstacle VALUES ("You decide not to climb over the stone in your way. It would take too much effort.",3,4,2,2,4,2);

INSERT INTO tileObstacle VALUES ("There is a anthill on your way and you don't want to get eaten by ants",2,3,2,2,4,2);
INSERT INTO tileObstacle VALUES ("There is a anthill on your way and you don't want to get eaten by ants",2,4,2,2,3,2);

INSERT INTO tileObstacle VALUES ("There is a banana peel on the ground! it's so slippery you can't take the risk and go this way!",1,2,2,1,3,2);
INSERT INTO tileObstacle VALUES ("There is a banana peel on the ground! it's so slippery you can't take the risk and go this way!",1,3,2,1,2,2);

INSERT INTO tileObstacle VALUES ("don't go into the doghouse",4,1,2,4,2,2);
INSERT INTO tileObstacle VALUES ("you can't jump from the roof of the doghouse its too highdon't go into the doghouse",4,2,2,4,1,2);

INSERT INTO tick VALUES (1,0,NULL,NULL,5,5,1);


#lvl1 color, descriptions id, string, x, y, lvl
INSERT INTO description VALUES (2,1,"You are in a forest near a shore. A few leafy trees are growing around. If you look to the right, the forest looks grassy.",1,1,1);
INSERT INTO description VALUES (3,2,"You are on a path near a shore. Thick grass is growing along the path.",2,1,1);
INSERT INTO description VALUES (2,3,"You are in a forest near a shore. Many kinds of trees are growing around and some pine cones can be seen on the ground.",3,1,1);
INSERT INTO description VALUES (2,4,"There is a shore nearby. The ground looks rocky. Leafy trees and a few pines are growing around and you can see some cones on the ground.",4,1,1);
INSERT INTO description VALUES (2,5,"There are leafy trees growing around you. If you look through the gaps between the leaves you can see the sea. Also a tall old spruce is standing nearby and some cones can be seen on the ground.",5,1,1);

INSERT INTO description VALUES (2,6,"You are in a leafy forest near a shore. The ground is pretty rocky. If you look to the right, you can see long thick grass growing.",1,2,1);
INSERT INTO description VALUES (3,7,"You are on a path near a shore. The grass along the path is long and green.",2,2,1);
INSERT INTO description VALUES (3,8,"There is a path with lots of spruce cones on the ground. A tall spruce is growing nearby.",3,2,1);
INSERT INTO description VALUES (2,9,"You are in a forest nearby a shore. A lot of grass is growing around and several leafy trees as well. The flower buds of a spruce nearby, have been eaten by a squirrel.",4,2,1);
INSERT INTO description VALUES (2,10,"This part of a forest is located near a shore. There are some leafy trees and a spruce growing around. On a branch of the spruce there is a squirrel’s nest.",5,2,1);

INSERT INTO description VALUES (2,11,"The forest around you is leafy and grassy, but some damage can be seen on the plants: they have been badly chewed.",1,3,1);
INSERT INTO description VALUES (2,12,"This forest nearby a shore is pretty grassy. There are both, leafy trees, and pines growing here. Dead grass and thatch throughout the lawn can be seen." ,2,3,1);
INSERT INTO description VALUES (3,13,"There is a windy path here. Leafy trees are growing along the path. If you look carefully you can see some vole holes on the ground.",3,3,1);
INSERT INTO description VALUES (2,14,"You are in a leafy forest near a shore. The ground is pretty rocky. If you look to the left you can see long thick grass growing there.",4,3,1);
INSERT INTO description VALUES (2,15,"You are in a forest near a shore. Many kinds of trees are growing around. The ground is rocky.",5,3,1);

INSERT INTO description VALUES (2,16,"The landscape is rocky and grassy. If you look carefully you can see vole tunnels in the lawn.",1,4,1);
INSERT INTO description VALUES (3,17,"You are on a grassy path. Several kinds of trees are growing along the path. Looks like a tiny animal has eaten buds and bark of the trees.",2,4,1);
INSERT INTO description VALUES (3,18,"There is a wandering path here, with trees along it. Some damage can be seen on the roots and there is a mole nest at the base of a leafy tree.",3,4,1);
INSERT INTO description VALUES (2,19,"There is a shore nearby. The ground looks rocky. Leafy trees are growing around.",4,4,1);
INSERT INTO description VALUES (2,20,"You are in a forest. This forest is located near a sea. Pale naked rocks can be seen around.",5,4,1);

INSERT INTO description VALUES (2,21,"This forest nearby a shore is pretty grassy. There are both leafy trees and pines growing here.",1,5,1);
INSERT INTO description VALUES (3,22,"You are on a path nearby a shore. The landscape is rocky and grassy. There are leafy trees are growing around.",2,5,1);
INSERT INTO description VALUES (2,23,"You are in an insular landscape, lots of grass around, rocky ground and low leafy trees.",3,5,1);
INSERT INTO description VALUES (2,24,"This part of a forest is near a shore. The nature is leafy and grassy.",4,5,1);
INSERT INTO description VALUES (2,25,"You are now in an insular landscape. You can see the shore. The ground is rocky and grassy. Several leafy trees growing around.",5,5,1);

# lvl2 descriptions
INSERT INTO description VALUES (1,"color.BOLD + 'North-Western Yard' + color.END + '\nNot much to see in here. The house and fences shade the grass from the sun the entire day. That’s why the grass has remained almost untouched and gleams its natural green colors.'",1,1,2);
INSERT INTO description VALUES (2,"color.BOLD + 'Northern Yard' + color.END + '\nIn front, you can see a moderately large house with a couple windows on the yard side but the sunlight makes it so you can’t see inside. The wall of the house is fully covered in grapevines.'",2,1,2);
INSERT INTO description VALUES (3,"color.BOLD + 'Northern Yard' + color.END + '\nIn front, you can see a moderately large house with a couple windows on the yard side but the sunlight makes it so you can’t see inside. The wall of the house is fully covered in grapevines.'",3,1,2);
INSERT INTO description VALUES (4,"color.BOLD + 'North-Eastern Yard' + color.END + '\nNot much to see in here. The house and fences shade the grass from the sun the entire day. That’s why the grass has remained almost untouched and gleams its natural green colors.'",4,1,2);

INSERT INTO description VALUES (5,"color.BOLD + 'Western Yard' + color.END + '\nResting against the fence there are a few berry bushes which at this time of the summer, are heavy with berries of different shapes and colors. The ground is filled with half-eaten cherries probably eaten by the birds who often rest on the two trees planted in the yard. Close to the fence you can also see a small cherry tree.'",1,2,2);
INSERT INTO description VALUES (6,"color.BOLD + 'Center of the Backyard' + color.END + '\nThe center of the backyard is exposed to the sun from the early morning till the sundown. Compared to the rest of the backyard the grass seems more damaged, and it has replaced its green with more of a brownish color.'",2,2,2);
INSERT INTO description VALUES (7,"color.BOLD + 'Center of the Backyard' + color.END + '\nThe center of the backyard is exposed to the sun from the early morning till the sundown. Compared to the rest of the backyard the grass seems more damaged, and it has replaced its green with more of a brownish color.'",3,2,2);
INSERT INTO description VALUES (8,"color.BOLD + 'Eastern Yard' + color.END + '\nA couple meters forward stands a small building, much smaller than the one to the north-west, that is guarded by a dog napping in the doorway.'",4,2,2);
INSERT INTO description VALUES (9,"color.BOLD + 'Eastern Yard' + color.END + '\nA couple meters forward stands a small building, much smaller than the one to the north-west, that is guarded by a dog. The dog has stood up nervously scanning its surroundings and sniffing the air.'",4,2,2);
INSERT INTO description VALUES (10,"color.BOLD + 'Doghouse Roof' + color.END + '\nYou climb to the top of the small building and look down. Under you, in the doorway, is a sleeping dog bathing in the sun.'",1,5,2);
INSERT INTO description VALUES (11,"color.BOLD + 'Doghouse Roof' + color.END + '\nYou climb to the top of the small building and look down. Under you, in the doorway, stands a dog growling loudly and staring you straight in the eye.'",1,5,2);


INSERT INTO description VALUES (12,"color.BOLD + 'Western Yard' + color.END + '\nResting against fence there are a few berry bushes which at this time of the summer, are heavy with berries of different shapes and colors. The ground is filled with half-eaten cherries probably eaten by the birds who often rest on the two trees planted in the yard.'",1,3,2);
INSERT INTO description VALUES (13,"color.BOLD + 'Center Yard' + color.END + '\nThe center of the backyard is exposed to the sun from the early morning till the sundown. Compared to the rest of the backyard the grass seems more damaged, and it has replaced its green with more of a brownish color.'",2,3,2);
INSERT INTO description VALUES (14,"color.BOLD + 'Center Yard' + color.END + '\nThe center of the backyard is exposed to the sun from the early morning till the sundown. Compared to the rest of the backyard the grass seems more damaged, and it has replaced its green with more of a brownish color.'",3,3,2);
INSERT INTO description VALUES (15,"color.BOLD + 'Eastern Yard' + color.END + '\nThis part of the garden has been turned into a flowerbed with tulips, roses and other flowers in all colors of the rainbow.'",4,3,2);

INSERT INTO description VALUES (16,"color.BOLD + 'South-Western Yard' + color.END + '\nOnly grass and some weeds growing from the gaps in the fence. You can hear some car noises coming from the other side of the fence.'",1,4,2);
INSERT INTO description VALUES (17,"color.BOLD + 'Southern Yard' + color.END + '\nThis is where the fences end on both sides and in front of you, separating backyard from the street , stands a gate. Although the gate itself would be hard to open, under the gate is small gap you just might be able to get through.'",2,4,2);
INSERT INTO description VALUES (18,"color.BOLD + 'Southern Yard' + color.END + '\nAlong the fence rises a large maple whose branches stretch over the yard fences and cover the most of the southern part of the backyard. It has already dropped a lot of its leaves on the ground. This might be its last summer. You can hear some car noises coming from the other side of the fence.'",3,4,2);
INSERT INTO description VALUES (19,"color.BOLD + 'South-Eastern Yard' + color.END + '\nOnly grass and some weeds growing from the gaps in the fence. You can hear some car noises coming from the other side of the fence.'",4,4,2);

INSERT INTO description VALUES (21,"color.BOLD + 'GAME OVER' + color.END + '\nYou squeeze through the gap and to the sidewalk. Suddenly, you see someone walking towards you. Unfortunately, you have no time to react and a foot crushes you against the pavement.'",2,5,2);
INSERT INTO description VALUES (22,"color.BOLD + 'Branch' + color.END + '\nYou proceed to the branch. Even though the rest of the tree seems frail, the branch feels sturdy and well. Under you is a street with a sidewalk on both sides.'",3,5,2);
INSERT INTO description VALUES (23,"color.BOLD + 'GAME OVER' + color.END + '\nThe man starts moving and your grasp ends up not being tight enough. You fall right under the man’s foot and get crushed by its weight.'",4,5,2);

# lvl2.5 description
INSERT INTO description VALUES (12, "color.BOLD + 'Window' + color.END + '\nYou climb on the windowsill and look outside. Through the window, you can barely see the backyard. In the left you see the outline of the doghouse and to the right you can spot the shadow of the cherry tree that the moonlight creates against the fence.'",1,1,3);
INSERT INTO description VALUES (13, "color.BOLD + 'Computer Table' + color.END + '\nYou climb on the computer table and look around. In the table there is a mouse, coffee cup and a monitor. The monitor is open and you can see some writing on the screen: “Tick’s Life”.'",1,1,3);
INSERT INTO description VALUES (1, "color.BOLD + 'Room' + color.END + '\nThis seems to be the corner of the room. Straight above, you can see a window frame. The window frame transforms the moonlight flooding inside into a shape of a cross reflecting on the floor.'",1,2,3);
INSERT INTO description VALUES (2, "color.BOLD + 'Room' + color.END + '\nAbove you, there is a computer table made of glass with wooden legs. The material that the legs are made of, may just be rough enough to climb.'",2,2,3);
INSERT INTO description VALUES (3, "color.BOLD + 'Underneath the Bed' + color.END + '\nUnder the bed, there is an acoustic guitar and some music papers. A few ants have also taken liking to a piece of candy fallen under the bed. The legs are made of some kind of metal.'",3,2,3);

INSERT INTO description VALUES (4, "color.BOLD + 'Room' + color.END + '\nAll the walls of the room have been painted with light blue paint. However, they almost entirely covered with posters of famous artists and game characters.'",1,3,3);
INSERT INTO description VALUES (5, "color.BOLD + 'Room' + color.END + '\nIn the middle of the room there is a furry green carpet. Only if the owner knew how much dirt and bacteria a carpet like that collects over the years.'",2,3,3);
INSERT INTO description VALUES (6, "color.BOLD + 'Room' + color.END + '\nRight beside the bed there is a laundry basket with some clothes spilling out. There is a shirt,  pair of jeans and a couple dirty socks lying on the floor.'",3,3,3);
INSERT INTO description VALUES (7, "color.BOLD + 'Laundry Basket' + color.END + '\nFrom the laundry basket, you are able to see the whole room. The top of it is also in the same level with the bed. From the bed you can hear some loud snoring.'",4,3,3);
INSERT INTO description VALUES (8, "color.BOLD + 'Bed' + color.END + '\nYou jump on the bed. When you keep crawling through the bedsheets, the scent of blood keeps getting stronger. Finally after traveling a while through the blankets, you reach the sleeping man’s foot.'",5,3,3);

INSERT INTO description VALUES (9, "color.BOLD + 'Room' + color.END + '\nBeside you sleeps the dog on a blanket. On the floor there is also the dog’s water cup and two stuffed animals, a teddy bear and an elephant.'",1,4,3);
INSERT INTO description VALUES (10, "color.BOLD + 'Room' + color.END + '\nNothing special here. Only some cabinets probably used for storing clothes.'",2,4,3);
INSERT INTO description VALUES (11, "color.BOLD + 'Room' + color.END + '\nThis is where you entered into the room. In front of you stands a door separating the room from the rest of the house. Unfortunately, the door is closed. The man must have closed it behind him while entering the room.'",3,4,3);



# lvl3 descriptions
INSERT INTO description VALUES (1, "color.BOLD + 'North-Western Park' + color.END + '\nYou are on a dirt road. The road is surrounded with freshly cut grass and coated with sharp gravel.'",1,1,4);
INSERT INTO description VALUES (2, "color.BOLD + 'North-Western Park' + color.END + '\nYou are on a dirt road. The road is surrounded with freshly cut grass and coated with sharp gravel.'",2,1,4);
INSERT INTO description VALUES (3, "color.BOLD + 'Northern Park' + color.END + '\nThe lawn around you is freshly cut and the air is filled with the smell of grass. Some hardwood has been planted in this part of the park creating a natural atmosphere.'",3,1,4);
INSERT INTO description VALUES (4, "color.BOLD + 'Northern Park' + color.END + '\nThe lawn around you is freshly cut and the air is filled with the smell of grass. Some hardwood has been planted in this part of the park creating a natural atmosphere.'",4,1,4);
INSERT INTO description VALUES (5, "color.BOLD + 'North-Eastern Park Park' + color.END + '\nYou are on a dirt road traveling through the lawn. On both sides, you can see ants walking in different directions carrying all sorts of materials probably used to decorate their castles.'",5,1,4);
INSERT INTO description VALUES (6, "color.BOLD + 'North-Eastern Park' + color.END + '\nThe lawn around you is freshly cut and the air is filled with the smell of grass. An ant colony has conquered most of this part of the park. On the face of it, it may look that there are not that many of them, but under grass they’ve created their own little empire.'",6,1,4);

INSERT INTO description VALUES (7, "color.BOLD + 'North-Western Park' + color.END + '\nThe lawn around you is freshly cut and the air is filled with the smell of grass. Dead blades of grass have been left behind. The sunshine has absorbed all of their green and left them with a light brown, almost a gray, color.'",1,2,4);
INSERT INTO description VALUES (8, "color.BOLD + 'North-Western Park' + color.END + '\nYou are on a dirt road. The road is surrounded with freshly cut grass and coated with sharp gravel.'",2,2,4);
INSERT INTO description VALUES (9, "color.BOLD + 'Northern Park' + color.END + '\nThe lawn around you is freshly cut and the air is filled with the smell of grass. Some hardwood has been planted in this part of the park creating a natural atmosphere.'",3,2,4);
INSERT INTO description VALUES (10, "color.BOLD + 'Northern Park' + color.END + '\nThe lawn around you is freshly cut and the air is filled with the smell of grass. Some hardwood has been planted in this part of the park creating a natural atmosphere.'",4,2,4);
INSERT INTO description VALUES (11, "color.BOLD + 'North-Eastern Park' + color.END + '\nYou are on a dirt road traveling through the lawn. On both sides, you can see ants walking in different directions carrying all sorts of materials probably used to decorate their castles.'",5,2,4);
INSERT INTO description VALUES (12, "color.BOLD + 'North-Eastern Park' + color.END + '\nYou are on a dirt road traveling through the lawn. On both sides, you can see ants walking in different directions carrying all sorts of materials probably used to decorate their castles.'",6,2,4);

INSERT INTO description VALUES (13, "color.BOLD + 'Western Park' + color.END + '\nThe grass around you is taller than everywhere else in the park. The grass roots are filled with life. Many different insect species, even some that you’ve never even seen before, have settled in the soil and in microscopic plants under the grass.'",1,3,4);
INSERT INTO description VALUES (14, "color.BOLD + 'Western Park' + color.END + '\nYou are on a dirt road. The road is surrounded with long and thick grass and coated with sharp gravel.'",2,3,4);
INSERT INTO description VALUES (15, "color.BOLD + 'Central Park' + color.END + '\nFrom here it looks like the park never ends. In all directions only thing you see is grass, with the exception of some bald spots in the lawn that look like dirt roads.'",3,3,4);
INSERT INTO description VALUES (16, "color.BOLD + 'Central Park' + color.END + '\nFrom here it looks like the park never ends. In all directions only thing you see is grass, with the exception of some bald spots in the lawn that look like dirt roads.'",4,3,4);
INSERT INTO description VALUES (17, "color.BOLD + 'Eastern Park' + color.END + '\nThe lawn around you is freshly cut and the air is filled with the smell of grass. An ant colony has conquered most of this part of the park. On the face of it, it may look that there are not that many of them, but under grass they’ve created their own little empire.'",5,3,4);
INSERT INTO description VALUES (18, "color.BOLD + 'dEastern Park' + color.END + '\nYou are on a dirt road traveling through the lawn. On both sides, you can see ants walking in different directions carrying all sorts of materials probably used to decorate their castles.'",6,3,4);

INSERT INTO description VALUES (19, "color.BOLD + 'Western Park' + color.END + '\nThe grass around you is taller than everywhere else in the park. The grass roots are filled with life. Many different insect species, even some that you’ve never even seen before, have settled in the soil and in microscopic plants under the grass.'",1,4,4);
INSERT INTO description VALUES (20, "color.BOLD + 'Western Park' + color.END + '\nYou are on a dirt road. The road is surrounded with long and thick grass and coated with sharp gravel.'",2,4,4);
INSERT INTO description VALUES (21, "color.BOLD + 'Central Park' + color.END + '\nYou are on a dirt road. The road is surrounded with long and thick grass and coated with sharp gravel.'",3,4,4);
INSERT INTO description VALUES (22, "color.BOLD + 'Central Park' + color.END + '\nYou are on a dirt road. The road is surrounded with long and thick grass and coated with sharp gravel.'",4,4,4);
INSERT INTO description VALUES (23, "color.BOLD + 'Eastern Park' + color.END + '\nYou are on a dirt road traveling through the lawn. On both sides, you can see ants walking in different directions carrying all sorts of materials probably used to decorate their castles.'",5,4,4);
INSERT INTO description VALUES (24, "color.BOLD + 'Eastern Park' + color.END + '\nYou are on a dirt road traveling through the lawn. On both sides, you can see ants walking in different directions carrying all sorts of materials probably used to decorate their castles.'",6,4,4);

INSERT INTO description VALUES (25, "color.BOLD + 'South-Western Park' + color.END + '\nYou seem to be in the most South-Western part of the park. Around you can see grassfields with a few small flowers sometimes popping through. The air is filled with sound of singing birds.'",1,5,4);
INSERT INTO description VALUES (26, "color.BOLD + 'South-Western Park' + color.END + '\nYou seem to be in the most South-Western part of the park. Around you can see grassfields with a few small flowers sometimes popping through. The air is filled with sound of singing birds.'",2,5,4);
INSERT INTO description VALUES (27, "color.BOLD + 'Southern Park' + color.END + '\nThe air is filled with sound of singing birds. Popping through the grass you can see some clovers. You even spot a four-leafed one. Wonder what that means...'",3,5,4);
INSERT INTO description VALUES (29, "color.BOLD + 'Southern Park' + color.END + '\nYou are on a dirt road. The road is surrounded with long and thick grass and coated with sharp gravel.'",4,5,4);
INSERT INTO description VALUES (30, "color.BOLD + 'South-Eastern Park' + color.END + '\nThe grass in this part of the park seems pretty badly taken care of. The dry ground glares through the lawn. If you listen very closely you can hear a grasshopper.'",5,5,4);
INSERT INTO description VALUES (31, "color.BOLD + 'dSouth-Eastern Park' + color.END + '\nYou are on a dirt road traveling through the lawn. On both sides, you can see ants walking in different directions carrying all sorts of materials probably used to decorate their castles.'",6,5,4);

INSERT INTO description VALUES (32, "color.BOLD + 'South-Western Park' + color.END + '\nYou seem to be in the most South-Western part of the park. Around you can see grassfields with a few small flowers sometimes popping through. The air is filled with sound of singing birds.'",1,6,4);
INSERT INTO description VALUES (33, "color.BOLD + 'South-Western Park' + color.END + '\nYou seem to be in the most South-Western part of the park. Around you can see grassfields with a few small flowers sometimes popping through. The air is filled with sound of singing birds.'",2,6,4);
INSERT INTO description VALUES (34, "color.BOLD + 'Southern Park' + color.END + '\nThe air is filled with sound of singing birds. Popping through the grass you can see some clovers. You even spot a four-leafed one. Wonder what that means...'",3,6,4);
INSERT INTO description VALUES (35, "color.BOLD + 'Southern Park' + color.END + '\nYou are on a dirt road. The road is surrounded with long and thick grass and coated with sharp gravel.'",4,6,4);
INSERT INTO description VALUES (36, "color.BOLD + 'South-Eastern Park' + color.END + '\nThe grass in this part of the park seems pretty badly taken care of. The dry ground glares through the lawn. If you listen very closely you can hear a grasshopper.'",5,6,4);
INSERT INTO description VALUES (37, "color.BOLD + 'South-Eastern Park' + color.END + '\nThe grass in this part of the park seems pretty badly taken care of. The dry ground glares through the lawn. If you listen very closely you can hear a grasshopper.'",6,6,4);
INSERT INTO description VALUES (38, "color.BOLD + 'Bench' + color.END + '\nYou climb on the bench. On the bench you can see someone lying. You recognize the man you bit the last summer. He looks very sick and has sweat dripping all over. You can barely smell his scent. Almost like he would be close to death...'",7,6,4);
INSERT INTO description VALUES (39, "color.BOLD + 'Bench' + color.END + '\nYou climb on the bench. The bench is empty...'",7,6,4);
