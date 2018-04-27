import mysql.connector

class color:
    BLUE1 = '\033[94m'
    GREEN2 = '\033[92m'
    BROWN3 = '\033[93m'
    ENDC4 = '\033[0m'

db = mysql.connector.connect(host="localhost",
                      user="dbuser",
                      password="dbpass",
                      db="tickslife")

def endOfTurn():
	cur = db.cursor()
	sql = "SELECT description, tileColor FROM description INNER JOIN tick ON description.X = tick.X AND description.Y = tick.Y AND description.level = tick.level;"
	cur.execute(sql)
	for row in cur.fetchall():
		if row[1]:
			print(GREEN2)
		print(row[0])
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
	cur.execute(sql)
	return

def moveInAnimal(direction):
	return

def animalMove():
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
		else:
			print("")
			for i in command:
				print(i)
			print("is not a valid command l2p")

	if command[0] == "wait":
		tickMove("still")


	if command[0] == "help":
		print("possible commands:")
		print("go")


	print(" --- ")

	endOfTurn()

db.close()