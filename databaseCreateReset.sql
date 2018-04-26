DROP DATABASE IF EXISTS tickslife;
CREATE DATABASE tickslife;
USE tickslife;

CREATE USER 'dbuser' IDENTIFIED BY 'dbpass';
GRANT ALL PRIVILEGES ON *.* TO 'dbuser';

CREATE TABLE tile
(
  X INT NOT NULL,
  Y INT NOT NULL,
  level INT NOT NULL,
  distanceToAnimal INT NOT NULL,
  directionToAnimal INT NOT NULL,
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

CREATE TABLE description
(
  descriptionID INT NOT NULL,
  description VARCHAR(255) NOT NULL,
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
INSERT INTO tile VALUES (2,1,1,0,0);
INSERT INTO tile VALUES (3,1,1,0,0);
INSERT INTO tile VALUES (4,1,1,0,0);
INSERT INTO tile VALUES (5,1,1,0,0);

INSERT INTO tile VALUES (1,2,1,0,0);
INSERT INTO tile VALUES (2,2,1,0,0);
INSERT INTO tile VALUES (3,2,1,0,0);
INSERT INTO tile VALUES (4,2,1,0,0);
INSERT INTO tile VALUES (5,2,1,0,0);

INSERT INTO tile VALUES (1,3,1,0,0);
INSERT INTO tile VALUES (2,3,1,0,0);
INSERT INTO tile VALUES (3,3,1,0,0);
INSERT INTO tile VALUES (4,3,1,0,0);
INSERT INTO tile VALUES (5,3,1,0,0);

INSERT INTO tile VALUES (1,4,1,0,0);
INSERT INTO tile VALUES (2,4,1,0,0);
INSERT INTO tile VALUES (3,4,1,0,0);
INSERT INTO tile VALUES (4,4,1,0,0);
INSERT INTO tile VALUES (5,4,1,0,0);

INSERT INTO tile VALUES (1,5,1,0,0);
INSERT INTO tile VALUES (2,5,1,0,0);
INSERT INTO tile VALUES (3,5,1,0,0);
INSERT INTO tile VALUES (4,5,1,0,0);
INSERT INTO tile VALUES (5,5,1,0,0);


#lvl2
INSERT INTO tile VALUES (1,1,2,0,0);
INSERT INTO tile VALUES (2,1,2,0,0);
INSERT INTO tile VALUES (3,1,2,0,0);
INSERT INTO tile VALUES (4,1,2,0,0);

INSERT INTO tile VALUES (1,2,2,0,0);
INSERT INTO tile VALUES (2,2,2,0,0);
INSERT INTO tile VALUES (3,2,2,0,0);
INSERT INTO tile VALUES (4,2,2,0,0);

INSERT INTO tile VALUES (1,3,2,0,0);
INSERT INTO tile VALUES (2,3,2,0,0);
INSERT INTO tile VALUES (3,3,2,0,0);
INSERT INTO tile VALUES (4,3,2,0,0);

INSERT INTO tile VALUES (1,4,2,0,0);
INSERT INTO tile VALUES (2,4,2,0,0);
INSERT INTO tile VALUES (3,4,2,0,0);
INSERT INTO tile VALUES (4,4,2,0,0);

INSERT INTO tile VALUES (1,5,2,0,0);
INSERT INTO tile VALUES (2,5,2,0,0);
INSERT INTO tile VALUES (3,5,2,0,0);
INSERT INTO tile VALUES (4,5,2,0,0);

#lvl3
INSERT INTO tile VALUES (1,1,3,0,0);
INSERT INTO tile VALUES (2,1,3,0,0);
INSERT INTO tile VALUES (3,1,3,0,0);

INSERT INTO tile VALUES (1,2,3,0,0);
INSERT INTO tile VALUES (2,2,3,0,0);
INSERT INTO tile VALUES (3,2,3,0,0);

INSERT INTO tile VALUES (1,3,3,0,0);
INSERT INTO tile VALUES (2,3,3,0,0);
INSERT INTO tile VALUES (3,3,3,0,0);

#lvl4
INSERT INTO tile VALUES (1,1,4,0,0);
INSERT INTO tile VALUES (2,1,4,0,0);
INSERT INTO tile VALUES (3,1,4,0,0);
INSERT INTO tile VALUES (4,1,4,0,0);
INSERT INTO tile VALUES (5,1,4,0,0);
INSERT INTO tile VALUES (6,1,4,0,0);

INSERT INTO tile VALUES (1,2,4,0,0);
INSERT INTO tile VALUES (2,2,4,0,0);
INSERT INTO tile VALUES (3,2,4,0,0);
INSERT INTO tile VALUES (4,2,4,0,0);
INSERT INTO tile VALUES (5,2,4,0,0);
INSERT INTO tile VALUES (6,2,4,0,0);

INSERT INTO tile VALUES (1,3,4,0,0);
INSERT INTO tile VALUES (2,3,4,0,0);
INSERT INTO tile VALUES (3,3,4,0,0);
INSERT INTO tile VALUES (4,3,4,0,0);
INSERT INTO tile VALUES (5,3,4,0,0);
INSERT INTO tile VALUES (6,3,4,0,0);

INSERT INTO tile VALUES (1,4,4,0,0);
INSERT INTO tile VALUES (2,4,4,0,0);
INSERT INTO tile VALUES (3,4,4,0,0);
INSERT INTO tile VALUES (4,4,4,0,0);
INSERT INTO tile VALUES (5,4,4,0,0);
INSERT INTO tile VALUES (6,4,4,0,0);

INSERT INTO tile VALUES (1,5,4,0,0);
INSERT INTO tile VALUES (2,5,4,0,0);
INSERT INTO tile VALUES (3,5,4,0,0);
INSERT INTO tile VALUES (4,5,4,0,0);
INSERT INTO tile VALUES (5,5,4,0,0);
INSERT INTO tile VALUES (6,5,4,0,0);

INSERT INTO tile VALUES (1,6,4,0,0);
INSERT INTO tile VALUES (2,6,4,0,0);
INSERT INTO tile VALUES (3,6,4,0,0);
INSERT INTO tile VALUES (4,6,4,0,0);
INSERT INTO tile VALUES (5,6,4,0,0);
INSERT INTO tile VALUES (6,6,4,0,0);

#animals id,name,x,y,lvl
INSERT INTO animal VALUES (1,"Squirrel",1,5,1);
INSERT INTO animal VALUES (2,"Mole",3,1,1);

INSERT INTO animal VALUES (3,"Dog",2,4,2);
INSERT INTO animal VALUES (4,"Man",1,5,2);

INSERT INTO animal VALUES (5,"Man",1,3,3);

INSERT INTO animal VALUES (6,"Jogger",1,5,4);
INSERT INTO animal VALUES (7,"Child",1,5,4);

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

#lvl1 descriptions id, string, x, y, lvl
INSERT INTO description VALUES (1,"",1,1,1);
INSERT INTO description VALUES (2,"",2,1,1);
INSERT INTO description VALUES (3,"",3,1,1);
INSERT INTO description VALUES (4,"",4,1,1);
INSERT INTO description VALUES (5,"",5,1,1);

INSERT INTO description VALUES (6,"",1,2,1);
INSERT INTO description VALUES (7,"",2,2,1);
INSERT INTO description VALUES (8,"",3,2,1);
INSERT INTO description VALUES (9,"",4,2,1);
INSERT INTO description VALUES (10,"",5,2,1);

INSERT INTO description VALUES (11,"",1,2,1);
INSERT INTO description VALUES (12,"",2,2,1);
INSERT INTO description VALUES (13,"",3,2,1);
INSERT INTO description VALUES (14,"",4,2,1);
INSERT INTO description VALUES (15,"",5,2,1);

INSERT INTO description VALUES (16,"",1,2,1);
INSERT INTO description VALUES (17,"",2,2,1);
INSERT INTO description VALUES (18,"",3,2,1);
INSERT INTO description VALUES (19,"",4,2,1);
INSERT INTO description VALUES (20,"",5,2,1);

INSERT INTO description VALUES (21,"",1,2,1);
INSERT INTO description VALUES (22,"",2,2,1);
INSERT INTO description VALUES (23,"",3,2,1);
INSERT INTO description VALUES (24,"",4,2,1);
INSERT INTO description VALUES (25,"",5,2,1);

















