import mysql.connector

db = mysql.connector.connect(host="localhost",
                      user="dbuser",
                      password="dbpass",
                      db="tickslife")
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
		else :
			command[length] = command[length] + cmd[x]

#go command
	if command[0] == "go" or command[0] == "move" or command[0] == "m":
		if len(command) < 2:
			print("you must give direction after go command")
		elif command[1] == "north" or command[1] == "n" or command[1] == "N":
			print("asd")
		elif command[1] == "south" or command[1] == "s" or command[1] == "S":
			print("asd")
		elif command[1] == "west" or command[1] == "w" or command[1] == "W":
			print("asd")
		elif command[1] == "east" or command[1] == "e" or command[1] == "E":
			print("asd")
		else:
			print()
			for i in command:
				print(i)
			print("is not a valid command l2p")

	if command[0] == "":

	print(" --- ")

db.close()