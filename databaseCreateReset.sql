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

INSERT INTO route VALUES(2,1);
INSERT INTO route VALUES(1,2);
INSERT INTO route VALUES(3,2);
INSERT INTO route VALUES(4,2);
INSERT INTO route VALUES(2,3);
INSERT INTO route VALUES(5,3);
INSERT INTO route VALUES(9,3);
INSERT INTO route VALUES(2,4);
INSERT INTO route VALUES(6,4);
INSERT INTO route VALUES(9,4);
INSERT INTO route VALUES(3,5);
INSERT INTO route VALUES(7,5);
INSERT INTO route VALUES(4,6);
INSERT INTO route VALUES(8,6);
INSERT INTO route VALUES(5,7);
INSERT INTO route VALUES(6,8);
INSERT INTO route VALUES(3,9);
INSERT INTO route VALUES(4,9);
INSERT INTO route VALUES(10,9);
INSERT INTO route VALUES(11,9);
INSERT INTO route VALUES(9,11);
INSERT INTO route VALUES(12,11);
INSERT INTO route VALUES(13,11);
INSERT INTO route VALUES(9,10);
INSERT INTO route VALUES(12,10);
INSERT INTO route VALUES(13,10);
INSERT INTO route VALUES(14,10);
INSERT INTO route VALUES(10,12);
INSERT INTO route VALUES(11,12);
INSERT INTO route VALUES(15,12);
INSERT INTO route VALUES(10,13);
INSERT INTO route VALUES(11,13);
INSERT INTO route VALUES(16,13);
INSERT INTO route VALUES(10,14);
INSERT INTO route VALUES(15,14);
INSERT INTO route VALUES(16,14);
INSERT INTO route VALUES(12,15);
INSERT INTO route VALUES(14,15);
INSERT INTO route VALUES(17,15);
INSERT INTO route VALUES(19,15);
INSERT INTO route VALUES(13,16);
INSERT INTO route VALUES(14,16);
INSERT INTO route VALUES(18,16);
INSERT INTO route VALUES(20,16);
INSERT INTO route VALUES(15,17);
INSERT INTO route VALUES(21,17);
INSERT INTO route VALUES(16,18);
INSERT INTO route VALUES(22,18);
INSERT INTO route VALUES(15,19);
INSERT INTO route VALUES(21,19);
INSERT INTO route VALUES(16,20);
INSERT INTO route VALUES(22,20);
INSERT INTO route VALUES(17,21);
INSERT INTO route VALUES(19,21);
INSERT INTO route VALUES(23,21);
INSERT INTO route VALUES(18,22);
INSERT INTO route VALUES(20,22);
INSERT INTO route VALUES(24,22);
INSERT INTO route VALUES(21,23);
INSERT INTO route VALUES(22,24);




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
INSERT INTO description VALUES (1,"color.GREEN + 'You are in a forest near a shore. A few leafy trees are growing around. If you look to the right, the forest looks grassy.' + color.END",1,1,1);
INSERT INTO description VALUES (2,"color.BROWN + 'You are on a path near a shore. Thick grass is growing along the path.' + color.END",2,1,1);
INSERT INTO description VALUES (3,"color.GREEN + 'You are in a forest near a shore. Many kinds of trees are growing around and some pine cones can be seen on the ground.' + color.END",3,1,1);
INSERT INTO description VALUES (4,"color.GREEN + 'There is a shore nearby. The ground looks rocky. Leafy trees and a few pines are growing around and you can see some cones on the ground.' + color.END",4,1,1);
INSERT INTO description VALUES (5,"color.GREEN + 'There are leafy trees growing around you. If you look through the gaps between the leaves you can see the sea. Also a tall old spruce is standing nearby and some cones can be seen on the ground.' + color.END",5,1,1);

INSERT INTO description VALUES (6,"color.GREEN + 'You are in a leafy forest near a shore. The ground is pretty rocky. If you look to the right, you can see long thick grass growing.' + color.END",1,2,1);
INSERT INTO description VALUES (7,"color.BROWN +'You are on a path near a shore. The grass along the path is long and green.' + color.END",2,2,1);
INSERT INTO description VALUES (8,"color.BROWN +'There is a path with lots of spruce cones on the ground. A tall spruce is growing nearby.' + color.END",3,2,1);
INSERT INTO description VALUES (9,"color.GREEN + 'You are in a forest nearby a shore. A lot of grass is growing around and several leafy trees as well. The flower buds of a spruce nearby, have been eaten by a squirrel.' + color.END",4,2,1);
INSERT INTO description VALUES (10,"color.GREEN + 'This part of a forest is located near a shore. There are some leafy trees and a spruce growing around. On a branch of the spruce there is a squirrel’s nest.' + color.END",5,2,1);

INSERT INTO description VALUES (11,"color.GREEN + 'The forest around you is leafy and grassy, but some damage can be seen on the plants: they have been badly chewed.' + color.END",1,3,1);
INSERT INTO description VALUES (12,"color.GREEN + 'This forest nearby a shore is pretty grassy. There are both, leafy trees, and pines growing here. Dead grass and thatch throughout the lawn can be seen.' + color.END" ,2,3,1);
INSERT INTO description VALUES (13,"color.BROWN + 'There is a windy path here. Leafy trees are growing along the path. If you look carefully you can see some vole holes on the ground.' + color.END",3,3,1);
INSERT INTO description VALUES (14,"color.GREEN + 'You are in a leafy forest near a shore. The ground is pretty rocky. If you look to the left you can see long thick grass growing there.' + color.END",4,3,1);
INSERT INTO description VALUES (15,"color.GREEN + 'You are in a forest near a shore. Many kinds of trees are growing around. The ground is rocky.' + color.END",5,3,1);

INSERT INTO description VALUES (16,"color.GREEN + 'The landscape is rocky and grassy. If you look carefully you can see vole tunnels in the lawn.' + color.END",1,4,1);
INSERT INTO description VALUES (17,"color.BROWN + 'You are on a grassy path. Several kinds of trees are growing along the path. Looks like a tiny animal has eaten buds and bark of the trees.' + color.END",2,4,1);
INSERT INTO description VALUES (18,"color.BROWN + 'There is a wandering path here, with trees along it. Some damage can be seen on the roots and there is a mole nest at the base of a leafy tree.' + color.END",3,4,1);
INSERT INTO description VALUES (19,"color.GREEN + 'There is a shore nearby. The ground looks rocky. Leafy trees are growing around.' + color.END",4,4,1);
INSERT INTO description VALUES (20,"color.GREEN + 'You are in a forest. This forest is located near a sea. Pale naked rocks can be seen around.' + color.END",5,4,1);

INSERT INTO description VALUES (21,"color.GREEN + 'This forest nearby a shore is pretty grassy. There are both leafy trees and pines growing here.' + color.END",1,5,1);
INSERT INTO description VALUES (22,"color.BROWN + 'You are on a path nearby a shore. The landscape is rocky and grassy. There are leafy trees are growing around.' + color.END",2,5,1);
INSERT INTO description VALUES (23,"color.GREEN + 'You are in an insular landscape, lots of grass around, rocky ground and low leafy trees.' + color.END",3,5,1);
INSERT INTO description VALUES (24,"color.GREEN + 'This part of a forest is near a shore. The nature is leafy and grassy.' + color.END",4,5,1);
INSERT INTO description VALUES (25,"color.GREEN + 'You are now in an insular landscape. You can see the shore. The ground is rocky and grassy. Several leafy trees growing around.' + color.END",5,5,1);
