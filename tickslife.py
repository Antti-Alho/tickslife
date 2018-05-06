import mysql.connector
import mysql.connector.errors as err
import sys
from math import sqrt, pow, fabs
from enum import Enum

db = mysql.connector.connect(
        host="localhost",
        user="dbuser",
        password="dbpass",
        db="tickslife")

command = [""]

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
    head = 1
    neck = 2
    rightarmpit = 3
    leftarmpit = 4
    rightArm = 5
    leftarm = 6
    righthand = 7
    lefthand = 8
    chest = 9
    stomach = 10
    back = 11
    rightside = 12
    leftside = 13
    groin = 14
    rightthig = 15
    leftthig = 16
    rightknee = 17
    leftknee = 18
    rightham = 19
    leftham = 20
    rightcalf = 21
    leftcalf = 22
    rightfoot = 23
    leftfoot = 24

def climbAnimal():
    cur = db.cursor()
    sql = "SELECT animal.animalID FROM animal INNER JOIN tick \
    ON animal.X = tick.X AND animal.Y = tick.Y AND animal.level = tick.level;"
    cur.execute(sql)
    for row in cur.fetchall():
        animalID = row[0]
    if cur.rowcount>=1:
        sql = "UPDATE tick SET tick.locationID = 1, tick.animalID = " + str(animalID) + ";"
        cur.execute(sql)
    return

def inspect():
    cur = db.cursor()
    sql = "SELECT locationInAnimal.skinThickness FROM locationInAnimal INNER JOIN tick ON \
    locationInAnimal.locationID=tick.locationID AND locationInAnimal.animalID = tick.animalID;"
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
    sql = "SELECT animal.X, animal.Y, animal.level FROM animal INNER JOIN tick WHERE tick.level = animal.level;"
    cur.execute(sql)
    animalX = []
    animalY = []
    animalLevel = []
    for row in cur.fetchall():
        animalX.append(row[0])
        animalY.append(row[1])
        animalLevel.append(row[2])
    for i in range(len(animalX)):
        newdist = sqrt(pow(fabs(animalX[i]-tickX),2)+pow(fabs(animalY[i]-tickY),2))
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
    sql = "SELECT animal.X, animal.Y, animal.level FROM animal INNER JOIN tick ON tick.level = animal.level;"
    cur.execute(sql)
    animalX = []
    animalY = []
    animalLevel = []
    for row in cur.fetchall():
        animalX.append(row[0])
        animalY.append(row[1])
        animalLevel.append(row[2])
    for i in range(len(animalX)):
        newdist = sqrt(pow(fabs(animalX[i]-tickX),2)+pow(fabs(animalY[i]-tickY),2))
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
    distance = distanceToNearestAnimal()
    if distance == 2:
        print("The smell of prey is weak.")
        directionToNearestAnimal()
    elif distance == sqrt(2):
        print("the smell of pray is weak.")
        directionToNearestAnimal()
    elif distance == 1:
        print("The smell of prey is medium.")
        directionToNearestAnimal()
    elif distance == 0:
        print("The smell of prey is strong!")
        directionToNearestAnimal()
    else:
        print("There is no smell of prey here.")
    return 

def bite():
    cur = db.cursor()
    sql = "SELECT locationInAnimal.skinThickness, locationInAnimal.animalID FROM locationInAnimal INNER JOIN tick ON locationInAnimal.locationID=tick.locationID AND locationInAnimal.animalID = tick.animalID;"
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
                    sql = "UPDATE tick SET X=3, Y=2, level=2, locationID = NULL, animalID = NULL;"
                elif row[0]==2:
                    sql = "UPDATE tick SET X=1, Y=6, level=4, locationID = NULL, animalID = NULL;"
                elif row[0] ==3:
                    sql = "UPDATE tick SET X=1, Y=6, level=4, locationID = NULL, animalID = NULL;"
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
    cur.execute(sql)
    for row in cur.fetchall():
            print(row[0])
    return

def theEnd():
    global command
    answer = 0
    print("You succeeded in getting your third and final blood meal! Look who is coming, it's your lover, a prince tick!"
    ,"The prince impregnates you. After a while, you give birth to new tick eggs, thousands of them!"
    ,"But we are sorry to tell you that you died while giving birth BUT you successfully completed the game! Congratulations!")
    print("")
    print("---")
    while answer != "yes" and answer != "no":
        answer = input("Do you want to play again?\nType \"yes\" or \"no\"\n")
        print("")
        print("---")
    if answer == "yes":
        sql.connector.rollback()
    else:
        command[0] = 'exit'
            
          
          
def printNextStory():
    cur = db.cursor()
    sql = "SELECT description FROM story INNER JOIN tick ON story.level = tick.level;"
    cur.execute
    for row in cur.fetchall():
        print(row[0])

def death():
    global command
    rollback = False
    cur = db.cursor()
    sql = "SELECT X, Y, level, timeVisible FROM tick"
    cur.execute
    for row in cur.fetchall():
        if row[0] == 200 and row[1] == 101 and row[2] == 2:
            print("GAME OVER\nYou squeeze through the gap and to the sidewalk. Suddenly, you see someone walking towards you."
                  ,"Unfortunately, you have no time to react and a foot crushes you against the pavement...")
            rollback = True
        if row[0] == 199 and row[1] == 101 and row[2] == 2:
            print ("GAME OVER\nThe man starts moving and your grasp ends up not being tight enough."
                   ,"You fall right under the man’s foot and get crushed by its weight...")
            rollback = True
        if row[0] == 198 and row[1] == 101 and row[2] == 2:
            print("GAME OVER\nWhile falling a sudden gust of wind flies you to the driveway."
                  ,"The last thing you hear is a screeching tire when you get crushed by its weight...")
        if row [3] == 4:
            print("GAME OVER\nYou spent too much time in the open."
                  ,"A hungry bird spots you and doesn't waist any time when swallowing you as a whole...")
            rollback = True
        if rollback == True:
            answer = 0
            print("")
            print("---")
            while answer != "yes" and answer != "no":
                answer = input("Do you want to play again?\nType \"yes\" or \"no\"\n")
                print("")
                print("---")
            if answer == "no":
                command[0] = 'exit'
            else:
                mysql.connector.rollback()
                printNextStory()
    return

def moveInAnimal(direction):
    directionOriginal = direction

    cur = db.cursor()
    sql = "SELECT route.locationFromID, route.locationToID, animal.name FROM route INNER JOIN tick \
    ON tick.animalID = route.animalID and tick.locationID = route.locationFromID INNER JOIN animal \
    ON tick.animalID = animal.animalID;"
    cur.execute(sql)
    move = 1000
    for row in cur.fetchall():
        print(row)
        try:
            if row[1] == animalDirection[direction].value:
                print(animalDirection[direction].value)
                move = animalDirection[direction].value
                sql = "UPDATE tick SET locationID = '"+str(move)+"';"
                print("you move to "+direction+" of the "+row[2])
                cur.execute(sql)        
        except KeyError:
            print("psyykeni on paloina lattialla")
            printPossibleMoveCommands()
            break
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
    cur = db.cursor()
    sql = "SELECT animal.X, animal.Y, animal.animalID FROM animal INNER JOIN tick \
    ON animal.level = tick.level"
    cur.execute(sql)
    animalX = []
    animalY = []
    animalIDs = []
    for row in cur.fetchall():
        animalX.append(row[0])
        animalY.append(row[1])
        animalIDs.append(row[2])
    for i in range(len(animalX)):
        sql = "SELECT animalRoute.id, animalRoute.X, animalRoute.Y, animalRoute.animalID FROM animalRoute \
        WHERE animalRoute.animalID = "+str(animalIDs[i])+" ORDER BY animalRoute.id ASC;"
        cur.execute(sql)
        firstX = 0
        firstY = 0
        currentID = 0
        nextID = 1
        nextX = 0
        nextY = 0
        animalID = 0
        n = 1
        for row in cur.fetchall():
            animalID = row[3]
            if row[1] == animalX[i] and row[2] == animalY[i]:
                currentID = row[0]
                nextID = row[0]+1
                if n == 1:
                    firstX = row[1]
                    firstY = row[2]
            if row[0] == nextID:
                nextX = row[1]
                nextY = row[2]
            n += 1

        sql = "UPDATE animal\
        SET X = "+str(nextX)+", Y = "+str(nextY)+" \
        WHERE animalID = "+str(animalID)+";"
        cur.execute(sql)
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
            return True
        else:
            return False

def tickIsNotInAnimal():
    cur = db.cursor()
    sql = "SELECT animalID FROM tick;"
    cur.execute(sql)
    for row in cur.fetchall():
        if row[0] == None:
            return True
        else:
            return False

def endOfTurn():
    BLUE1 = "\033[94m"
    GREEN2 = "\033[92m"
    BROWN3 = "\033[93m"
    ENDC4 = "\033[0m"
    if tickIsNotInAnimal:
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
    #animalMove()
    return

def printCurrentClimbOptions():
    #tan saa tehda jos haluaa!
    print("asd")
    return 

def printPossibleMoveCommands():
    #tan saa myos tehda!
    print("asd")
    return

def printAllPossibleCommands():
    print("")
    return

def printHelp():
    print("wait\nclimb\ndrop\nbite\ninspect\nsmell\ngo + south/west/east/north/up/down\nmove + south/west/east/north/up/down ")
    return

def climbOrDrop():
    cur = db.cursor()
    sql = "SELECT level FROM tick"
    cur.execute(sql)
    for row in cur.fetchall():
        if row[0] == 2 and command[0] == "drop" or row[0] != 2 and command[0] == "climb":
            climbAnimal()
            

def tickMove(direction, command = None):
    cur = db.cursor()
    sql = "SELECT X,Y,level,timeVisible FROM tick"
    cur.execute(sql)
    for row in cur.fetchall():
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
    if direction == "up":
        try :
            if x == 1 and y == 2 and level == 2 and command[1] == "tree":
                sql = "UPDATE tick SET X = 100, Y = 100;"
            if x == 3 and y == 4 and level == 2 and command[1] == "tree":
                sql = "UPDATE tick SET X = 200, Y = 100;"
            if x == 4 and y == 2 and level == 2 and command[1] == "doghouse" or command[1] == "house":
                sql = "UPDATE tick SET X = 300, Y = 100;"
            if x == 1 and y == 1 and level == 3 and command[1] == "window":
                sql = "UPDATE tick SET X = 100, Y = 100;"
            if x == 2 and y == 2 and level == 3 and command[1] == "table":
                sql = "UPDATE tick SET X = 200, Y = 100;"
            if x == 3 and y == 3 and level == 3 and command[1] == "basket":
                sql = "UPDATE tick SET X = 300, Y = 100;"
            if x == 2 and y == 5 and level == 4 and command[1] == "bench":
                sql = "UPDATE tick SET X = 100, Y = 100;"
        except IndexError:
            print("where do you wan't to climb?")
            printCurrentClimbOptions()
    try:
        cur.execute(sql)
    except err.IntegrityError:
        print("You can't go there!")
    
    endOfTurn()
    return

def getCommand():
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
    return command


printNextStory()
while command[0] != 'exit':
    command = getCommand()

    if command[0] == "climb" or command[0] == "drop":
        climbOrDrop()

    elif command[0] == "go" or command[0] == "move" or command[0] == "m":
        if tickIsNotInAnimal():
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

            elif command[1] == "up" or command[1] == "u" or command[1] == "U":
                endOfTurn()
            else:#error message when go commands parameter is wrong
                print("")
                print("--", end="")
                for i in command:
                    print(i, end=" ")
                print("-- is not a valid command l2p")
                printPossibleMoveCommands()
                printCurrentClimbOptions()
        else:
            try:
                moveInAnimal(command[1])
            except IndexError:
                printPossibleMoveCommands()

    elif command[0] == "wait":
        tickMove("still")

    elif command[0] == "help":
        print("possible commands:")
        printPossibleMoveCommands()
        printCurrentClimbOptions()

    elif command[0] == "smell":
        smell()

    elif command[0] == "inspect":
        inspect()

    elif command[0] == "bite":
        bite()

    else:
        printPossibleMoveCommands()
        printCurrentClimbOptions()
        printHelp()

    print(" --- ")

db.close()
