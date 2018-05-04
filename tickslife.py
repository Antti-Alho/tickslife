import mysql.connector
import mysql.connector.errors as err
from enum import Enum

class direction(Enum):
	NORTH = 0
	SOUTH = 1
	WEST = 2
	EAST = 3

class node:
	neighbors = []
	def __init__(self, X, Y, lvl, routeToMe):
		self.X = X
		self.Y = Y
		self.lvl = lvl
		self.routeToMe = routeToMe # if this is null im the first one

	def __str__(self):
		return str(self.__dict__)

	def __eq__(self, other):
		return self.__dict__ == other.__dict__

db = mysql.connector.connect(
	host="localhost",
	user="dbuser",
	password="dbpass",
	db="tickslife"
)

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

def fillOpenSetA(X,Y,lvl):
	cur = db.cursor()
	openSet = []
	sql = "SELECT X,Y,level FROM tick WHERE X = "+str(X)+" and Y ="+str(Y)" and level = "+str(lvl)";"
	cur.execute(sql)
	for row in cur.fetchall():
		x = row[0]
		y = row[1]
		level = row[2]
	openSet.append(node(x,y,level,none))
	return openSet

def containsAnimal(X,Y,lvl): #returns true or false if 
	cur = db.cursor()
	openSet = []
	sql = "SELECT X,Y,level FROM tick WHERE X = "+str(X)+" and Y ="+str(Y)" and level = "+str(lvl)";"
	cur.execute(sql)
	for row in cur.fetchall():
		x = row[0]
		y = row[1]
		level = row[2]
	if 
		return true
	else: 
		return false

def getNeighboursA(closedSet, nodeFrom):
	cur = db.cursor()
	neighbors = []
	sql = "SELECT X,Y,level FROM tick WHERE X = "+str(nodeFrom.X-1)+" and Y ="+str(nodeFrom.Y)" and level = "+str(lvl)";"
	try:
		cur.execute(sql)
		for row in cur.fetchall():
			x = row[0]
			y = row[1]
			level = row[2]
		newNode = node(x,y,nodeFrom.lvl,nodeFrom)
		if newNode not in closedSet:
			neighbors.append(newNode)
		else 
			continue

	except err.IntegrityError:
		continue
	sql = "SELECT X,Y,level FROM tick WHERE X = "+str(nodeFrom.X+1)+" and Y ="+str(nodeFrom.Y)" and level = "+str(lvl)";"
	try:
		cur.execute(sql)
		for row in cur.fetchall():
			x = row[0]
			y = row[1]
			level = row[2]
		newNode = node(x,y,nodeFrom.lvl,nodeFrom)
		if newNode not in closedSet:
			neighbors.append(newNode)
		else 
			continue

	except err.IntegrityError:
		continue
	sql = "SELECT X,Y,level FROM tick WHERE X = "+str(nodeFrom.X)+" and Y ="+str(nodeFrom.Y-1)" and level = "+str(lvl)";"	try:
		cur.execute(sql)
		for row in cur.fetchall():
			x = row[0]
			y = row[1]
			level = row[2]
		newNode = node(x,y,nodeFrom.lvl,nodeFrom)
		if newNode not in closedSet:
			neighbors.append(newNode)
		else 
			continue

	except err.IntegrityError:
		continue
	sql = "SELECT X,Y,level FROM tick WHERE X = "+str(nodeFrom.X)+" and Y ="+str(nodeFrom.Y+1)" and level = "+str(lvl)";"
	try:
		cur.execute(sql)
		for row in cur.fetchall():
			x = row[0]
			y = row[1]
			level = row[2]
		newNode = node(x,y,nodeFrom.lvl,nodeFrom)
		if newNode not in closedSet:
			neighbors.append(newNode)
		else 
			continue

	except err.IntegrityError:
		continue
	return neighbors

def distanceToAnimalA(X,Y,lvl): # return integer value of how many steps it takes to find nearest animal
	return

def pathReconstructA(closedSet):
	for X in closedSet
		X.
	return route[]

def directionToAnimal(X,Y,lvl):
	#antti
	return 

def printNextStory():
	#joonatan
	return

def bite():
	#joonatan
	return

def moveInAnimal(direction):
	#antti
	return

#
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

def isTickVulnerable():
	cur = db.cursor()
	sql = "SELECT description.color FROM tick INNER JOIN tile\
	ON tick.X = tile.X AND tick.Y = tile.Y AND tick.level = tile.level\
	INNER JOIN description\
	ON description.X = tick.X AND description.Y = tick.Y AND description.level = tick.level;"
	cur.execute(sql)
	for row in cur.fetchall():

	if asd:
		return true
	else:
		return false

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
