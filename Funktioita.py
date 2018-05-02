import mysql.connector

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


def drop():
    cur = db.cursor()
    sql = "SELECT animalID FROM animal INNER JOIN tick ON animal.X = tick.X AND animal.Y = tick.Y AND animal.level = tick.level;"
    cur.execute(sql)
    for row in cur.fetchall():
        animalID = row[0]
    if cur.rowcount>=1:
        sql = "UPDATE tick SET locationID = 1, animalID = " + str(animalID) + ";" 
        cur.execute(sql)
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
    else
        print("There is no smell of prey here.")
    return 








    
    
