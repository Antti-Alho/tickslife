import mysql.connector
import mysql.connector.errors as err
from enum import Enum

class direction(Enum):
	NORTH = 0
	SOUTH = 1
	WEST = 2
	EAST = 3

db = mysql.connector.connect(host="localhost",
                      user="dbuser",
                      password="dbpass",
                      db="tickslife")
storycount=1

def drop():
    cur = db.cursor()
    sql = "SELECT animalID FROM animal INNER JOIN tick ON animal.X = tick.X AND animal.Y = tick.Y AND animal.level = tick.level;"
    cur.execute(sql)
    for row in cur.fetchall():
        animalID = row[0]
    if cur.rowcount>=1:
        sql = "UPDATE tick SET locationID = 1, animalID = " + str(animalID) + ";" 
     :   cur.execute(sql)
    return

def inspect():
    cur = db.cursor()
    sql = "SELECT skinThickness FROM locationInAnimal INNER JOIN tick ON locationInAnimal.locationID=tick.locationID;"
    cur.execute(sql)
    for row in cur.fetchall():
        if row[0]==1:
            print("The skin here is thin and smoothy. You can bite!")
        else:
            print("The skin here is too thick. Find another body part for biting!")
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
        print("The smell of prey here is weak.")
    elif distance == 1:
        print("The smell of prey here is medium.")
    elif distance == 0:
        print("The smell of prey is strong!")
    else:
        print("There is no smell of prey here.")
    return 

def distanceToAnimal(X,Y,lvl):
	#antti
	distance = sys.maxint

	return distance

def directionToAnimal(X,Y,lvl):
	#antti
	return 

def printNextStory():
    cur = db.cursor()
    sql = "SELECT storyID, description FROM story;"
    cur.execute
    for row in cur.fetchall():
        storyID = row[0]
        story = row[1]
        if storyID == storycount:
            print(story)
            storycount += 1
            
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
            print("You bit a running dog. Unfortunately you blood meal was too little. But the dog ran into a man's house.")
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

def moveInAnimal(direction):
	#antti
	return

def animalMove():
	#antti	
	return

def IsTickInAnimal():
	#antti
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
	#if x != asd and y != asd and lvl != asd: #joonatan
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
	try:
		cur.execute(sql)
	except err.IntegrityError:
		print("You can't go there")
	return
	#else: #joonatan
	#	if direction == "climb":
	#		sql = "UPDATE tick SET X = ;"
	#	return

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

	print(" --- ")

	endOfTurn()

db.close()
