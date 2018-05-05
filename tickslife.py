import mysql.connector
import mysql.connector.errors as err
from math import sqrt, pow
from enum import Enum

db = mysql.connector.connect(
        host="localhost",
        user="dbuser",
        password="dbpass",
        db="tickslife")

class direction(Enum):
    NORTH = 0
    NE = 1
    EAST = 2
    SE = 3
    SOUTH = 4
    SW = 5
    WEST = 6
    NW = 7

class animalDirection(Enum):
    Head = 1
    neck = 2
    rightArmpit = 3
    leftArmpit = 4
    rightArm = 5
    leftArm = 6
    rightHand = 7
    leftHand = 8
    chest = 9
    stomach = 10
    back = 11
    rightSide = 12
    leftSide = 13
    groin = 14
    rightThig = 15
    leftThig = 16
    rightKnee = 17
    leftKnee = 18
    rightHam = 19
    leftHam = 20
    rightCalf = 21
    leftCalf = 22
    rightFoot = 23
    leftFoot = 24

def climbAnimal():
    cur = db.cursor()
    sql = "SELECT animalID FROM animal INNER JOIN tick \
    ON animal.X = tick.X AND animal.Y = tick.Y AND animal.level = tick.level;"
    cur.execute(sql)
    for row in cur.fetchall():
        animalID = row[0]
    if cur.rowcount>=1:
        sql = "UPDATE tick SET locationID = 1, animalID = " + str(animalID) + ";"
        cur.execute(sql)
    return

def inspect():
    cur = db.cursor()
    sql = "SELECT locationInAnimal.skinThickness FROM locationInAnimal INNER JOIN tick ON \
    locationInAnimal.locationID=tick.locationID;"
    cur.execute(sql)
    for row in cur.fetchall():
        if row[0]==1:
            print("The skin here is thin and smoothy. You can bite!")
        else:
            print("The skin here is too thick. Find another body part for biting!")
    return

def distanceToNearestAnimal(): 
    distance = sys.maxsize
    cur = db.cursor()
    sql = "SELECT tick.X, tick.Y, tick.level FROM tick;"
    cur.execute(sql)
    for row in cur.fetchall():
        tickX = row[0]
        tickY = row[1]
        tickLevel = row[2]
    sql = "SELECT animal.X, animal.Y, animal.level FROM animal WHERE tick.level = animal.level;"
    animalX = []
    animalY = []
    animalLevel = []
    n = 0
    for row in cur.fetchall():
        animalX[n] = row[0]
        animalY[n] = row[1]
        animalLevel[n] = row[2]
        n += n
    for i in range(len(animalX)):
        newdist = sqrt(pow(animalX[i])+pow(animalY[i]))
        if distance > newdist:
            distance = newdist

    return distance

def nearestAnimal():
    distance = sys.maxsize
    nearestX = sys.maxsize
    nearestY = sys.maxsize
    cur = db.cursor()
    sql = "SELECT tick.X, tick.Y, tick.level FROM tick;"
    cur.execute(sql)
    for row in cur.fetchall():
        tickX = row[0]
        tickY = row[1]
        tickLevel = row[2]
    sql = "SELECT animal.X, animal.Y, animal.level FROM animal WHERE tick.level = animal.level;"
    animalX = []
    animalY = []
    animalLevel = []
    n = 0
    for row in cur.fetchall():
        animalX[n] = row[0]
        animalY[n] = row[1]
        animalLevel[n] = row[2]
        n += n
    for i in range(len(animalX)):
        newdist = sqrt(pow(animalX[i])+pow(animalY[i]))
        if distance > newdist:
            distance = newdist
            nearestY = animalY[i]
            nearestX = animalX[i]
    tulos = [nearestX,nearestY]
    return tulos

def directionToNearestAnimal():
    distance = distanceToNearestAnimal()
    nearestAnimalXY = nearestAnimal()
    cur = db.cursor()
    sql = "SELECT tick.X, tick.Y, tick.level FROM tick;"
    cur.execute(sql)
    for row in cur.fetchall():
        tickX = row[0]
        tickY = row[1]
        tickLevel = row[2]
    animalX = nearestAnimalXY[0]
    animalY = nearestAnimalXY[1]
    for i in range(len(animalX)):
        if tickX == animalX and tickY < animalY:
            print("and comes from north")
        if tickX < animalX and tickY < animalY:
            print("and comes from northeast")
        if tickX < animalX and tickY == animalY:
            print("and comes from east")
        if tickX < animalX and tickY > animalY:
            print("and comes from southeast")
        if tickX == animalX and tickY > animalY:
            print("and comes from south")
        if tickX > animalX and tickY > animalY:
            print("and comes from southwest")
        if tickX > animalX and tickY == animalY:
            print("and comes from west")
        if tickX > animalX and tickY < animalY:
            print("and comes from northwest")
        if tickX == animalX and tickY == animalY:
            print("and you are pretty sure you could try to grab the animal")
    return 

def smell():
    cur = db.cursor()
    sql = "SELECT X, Y, level FROM tick;"
    cur.execute(sql)
    for row in cur.fetchall():
        X = row[0]
        Y = row[1]
        level = row[2]
    distance = distanceToAnimal(X, Y, level)
    if distance == 2:
        print("The smell of prey is weak.")
    elif distance == sqrt(2):
        print("the smell of pray is weak.")
    elif distance == 1:
        print("The smell of prey is medium.")
    elif distance == 0:
        print("The smell of prey is strong!")
    else:
        print("There is no smell of prey here.")
    directionToNearestAnimal()
    return 

def bite():
    cur = db.cursor()
    sql = "SELECT locationInAnimal.skinThickness, animal.animalID FROM locationInAnimal INNER JOIN tick ON locationInAnimal.locationID=tick.locationID;"
    cur.execute(sql)
    for row in cur.fetchall():
    if row[0]==1:
        print("Yess! Excellent spot for biting. You become filled with blood just now.")
        if row[1]==2:
            sql = "UPDATE tick SET disease = 'lyme disease';"
            cur.execute(sql)
            print("The vole you just bit had lyme disease. You now carry this useful 'gun' with you")
        if row[0]==3:
            sql = "UPDATE tick SET X=1, Y=3, level = 3,;"
            cur.execute(sql)
        sql = "SELECT level FROM tick;"
        cur.execute(sql)
        for row in cur.fetchall():
        if row[0]==1:
            sql = "UPDATE tick SET X=3, Y=2, level=2;"
        elif row[0]==2:
            sql = "UPDATE tick SET X=1, Y=6, level=4;"
        elif row[0] ==3:
            sql = "UPDATE tick SET X=1, Y06, level=4;"
        cur.execute(sql)    
        printNextStory() 
    else:
        print("The skin was too thick, you couldn't bite here. You fell off.")
        sql="UPDATE tick SET locationID = NULL, animalID = NULL;" 
        cur.execute(sql)
    return

def containsAnimal(): 
    cur = db.cursor()
    sql = "SELECT animal.level FROM animal INNER JOIN tick \
    ON animal.X = tick.X AND animal.Y = tick.Y AND animal.level = tick.level;"
    cur.execute(sql)
    if cur.rowcount > 0:
        return true
    else: 
        return false

def printNextStory():
    cur = db.cursor()
    sql = "SELECT description FROM story INNER JOIN tick ON story.level = tick.level;"
    cur.execute
    for row in cur.fetchall():
            print(row[0])
    return
  
def moveInAnimal(direction):
    #antti
    return
  
def possibleMovementsInAnimal():
    possibleMovements = []
    cur = db.cursor()
    sql = "SELECT locationInAnimal.name FROM tick INNER JOIN route \
    ON tick.locationID = route.locationID AND tick.animalID = route.animalID\
    INNER JOIN locationInAnimal ON locationInAnimal.locationID = route.locationToID;"
    cur.execute(sql)
    for row in cur.fetchall():
        possibleMovements.append(row[0])
    return possibleMovements

def animalMove():
    #antti
    return

def isTickVisible():
    cur = db.cursor()
    sql = "SELECT description.color FROM tick INNER JOIN tile\
    ON tick.X = tile.X AND tick.Y = tile.Y AND tick.level = tile.level\
    INNER JOIN description\
    ON description.X = tick.X AND description.Y = tick.Y AND description.level = tick.level;"
    cur.execute(sql)
    for row in cur.fetchall():
        if row[0] == 3:
            return true
        else:
            return false

def IsTickInAnimal():
    if asd:
        return true
    else:
        return false

def endOfTurn():
    BLUE1 = "\033[94m"
    GREEN2 = "\033[92m"
    BROWN3 = "\033[93m"
    ENDC4 = "\033[0m"

    cur = db.cursor()
    sql = "SELECT description, color FROM description INNER JOIN tick ON description.X = tick.X AND description.Y = tick.Y AND description.level = tick.level;"
    cur.execute(sql)
    for row in cur.fetchall():
        if row[1] == 2:
            print(GREEN2)
        elif row[1] == 3:
            print(BROWN3)
        print(row[0])
    print(ENDC4)
    return

def tickMove(direction):
    cur = db.cursor()
    sql = "SELECT X,Y,level,timeVisible FROM tick"
    cur.execute(sql)
    for row in cur.fetchall():
        print(row)
        x = row[0]
        y = row[1]
        level = row[2]
        time = row[3]
    if direction == "north":
        sql = "UPDATE tick SET Y = "+str(y-1)+";"
    if direction == "south":
        sql = "UPDATE tick SET Y = "+str(y+1)+";"
    if direction == "west":
        sql = "UPDATE tick SET X = "+str(x-1)+";"
    if direction == "east":
        sql = "UPDATE tick SET X = "+str(x+1)+";"
    if direction == "still":
        sql = "UPDATE tick SET timeVisible = "+str(time+1)+";"
    if direction == "down" and y == 100:
        if x == 100 and level == 2:
            sql = "UPDATE tick SET X = 1, Y = 2;"
        if x == 200 and level == 2:
            sql = "UPDATE tick SET X = 3, Y = 4;"
        if x == 300 and level == 2:
            sql = "UPDATE tick SET X = 4, Y = 2;"
        if x == 100 and level == 3:
            sql = "UPDATE tick SET X = 1, Y = 1;"
        if x == 200 and level == 3:
            sql = "UPDATE tick SET X = 2, Y = 2;"
        if x == 300 and level == 3:
            sql = "UPDATE tick SET X = 3, Y = 3;"
        if x == 100 and level == 4:
            sql = "UPDATE tick SET X = 5, Y = 4;"
    if direction == "climb":
        if x == 1 and y == 2 and level == 2 and command [1] == "tree":
            sql = "UPDATE tick SET X = 100, Y = 100;"
        if x == 3 and y == 4 and level == 2 and command [1] == "tree":
            sql = "UPDATE tick SET X = 200, Y = 100;"
        if x == 4 and y == 2 and level == 2 and command [1] == "doghouse" or command [1] == "house":
            sql = "UPDATE tick SET X = 300, Y = 100;"
        if x == 1 and y == 1 and level == 3 and command [1] == "window":
            sql = "UPDATE tick SET X = 100, Y = 100;"
        if x == 2 and y == 2 and level == 3 and command [1] == "table" or command [1] == "computer":
            sql = "UPDATE tick SET X = 200, Y = 100;"
        if x == 3 and y == 3 and level == 3 and command [1] == "basket" or command [1] == "laundry":
            sql = "UPDATE tick SET X = 300, Y = 100;"
        if x == 2 and y == 5 and level == 4 and command [1] == "bench":
            sql = "UPDATE tick SET X = 100, Y = 100;"
    try:
        cur.execute(sql)
    except err.IntegrityError:
        print("You can't go there!")
    return
  
cmd = ""

while cmd != 'exit':
    cmd = input()
    command = []
    length = 0
    command.append("")
    for x in range(len(cmd)):
        if cmd[x] == " ":
            length += 1
            command.append("")
        else:
            command[length] = command[length] + cmd[x]

#go command
    if command[0] == "go" or command[0] == "move" or command[0] == "m":
        if len(command) < 2:
            print("you must give direction after go command")
        elif command[1] == "north" or command[1] == "n" or command[1] == "N":
            tickMove("north")
        elif command[1] == "south" or command[1] == "s" or command[1] == "S":
            tickMove("south")
        elif command[1] == "west" or command[1] == "w" or command[1] == "W":
            tickMove("west")
        elif command[1] == "east" or command[1] == "e" or command[1] == "E":
            tickMove("east")
        elif command[1] == "down" or command[1] == "d" or command[1] == "D":
            tickMove("down")
        else:#error message when go commands parameter is wrong
            print("")
            print("-- ", end = "")
            for i in command:
                print(i, end = " ")
            print("-- is not a valid command l2p")

    if command[0] == "wait":
        tickMove("still")

    if command[0] == "help":
        print("possible commands:")
        print("go")

    if command[0] == "climb" or command[0] == "c" or command[0] == "C":
        tickMove("climb")

    print(" --- ")

    endOfTurn()

db.close()
