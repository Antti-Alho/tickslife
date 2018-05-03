import mysql.connector
import mysql.connector.errors as err


db = mysql.connector.connect(host="localhost",
					  user="dbuser",
					  password="dbpass",
					  db="tickslife")

def climbDrop():
	#merja
	return

def inspect():
	#merja
	return

def smell():
	#merja
	return

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

def animalMove():
	#antti
	return

#def IsTickInAnimal():
	#antti
	#if asd:
		#return true
	#else:
		#return false

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
		if x == 1 and y == 2 and level == 2:
			sql = "UPDATE tick SET X = 100, Y = 100;"
		if x == 3 and y == 4 and level == 2:
			sql = "UPDATE tick SET X = 200, Y = 100;"
		if x == 4 and y == 2 and level == 2:
			sql = "UPDATE tick SET X = 300, Y = 100;"
		if x == 1 and y == 1 and level == 3:
			sql = "UPDATE tick SET X = 100, Y = 100;"
		if x == 2 and y == 2 and level == 3:
			sql = "UPDATE tick SET X = 200, Y = 100;"
		if x == 3 and y == 3 and level == 3:
			sql = "UPDATE tick SET X = 300, Y = 100;"
		if x == 2 and y == 5 and level == 4:
			sql = "UPDATE tick SET X = 100, Y = 100;"
	try:
		cur.execute(sql)
	except err.IntegrityError:
		print("You can't go there")
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
		elif command[1] == "down":
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
	if command [0] == "climb":
		tickMove("climb")

	print(" --- ")

	endOfTurn()

db.close()
