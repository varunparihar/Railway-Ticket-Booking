import mysql.connector as sql
import json
from encrypt import *
import datetime

db = sql.connect(
  host = "localhost",
  user = "admin",
  password = "admin123",
  database = "railway"
)

def getAll():
    cursor = db.cursor(dictionary = True)
    cursor.execute("SELECT * FROM USER")
    table = cursor.fetchall()
    result = []
    for row in table:
        result.append(row)
    return result

def getWhere(uid):
    cursor = db.cursor(dictionary = True)
    cursor.execute("SELECT * FROM USER WHERE user_id = %s", (uid,))
    table = cursor.fetchall()
    result = []
    for row in table:
        result.append(row)
    return result

def checkUser(uid, passwd):
    cursor = db.cursor(dictionary = True)
    cursor.execute("SELECT * FROM USER WHERE user_id = %s", (uid,))
    table = cursor.fetchall()
    if not table:
        return False
    password = table[0]["user_password"]
    if password == passwd:
        return True
    return False
    # passHash = encrypt(passwd)
    # if password == passHash:
    #     return True
    # return False

def getWeekDay(date_str):
    format = '%Y-%m-%d'
    weekday = datetime.datetime.strptime(date_str, format)
    weekDayNumber = weekday.strftime('%w')
    return weekDayNumber

def getAvailableSeats(train_no, date):
    cursor = db.cursor(dictionary = True)
    cursor.execute("SELECT seat FROM AVAILABLE WHERE train_no = %s", (train_no,))
    row = cursor.fetchone()
    total_seats = row['seat']
    cursor.execute("SELECT count(*) as p FROM TICKET WHERE train_no = %s and d_date = %s", (train_no, date,))
    row = cursor.fetchone()
    booked_seats = row['p']
    availableSeats = total_seats - booked_seats
    return availableSeats

def searchTrain(from_code, to_code, date_s):
    from_code.upper()
    to_code.upper()
    weekday = getWeekDay(date_s)
    wdn = "%" + str(weekday) + "%"
    cursor = db.cursor(dictionary = True)
    cursor.execute("SELECT a.train_no, a.station_code as from_stat, b.station_code as to_stat,a.departure_t, b.arrival_t, %s as date from STATION as a, STATION as b, AVAILABLE as c where a.train_no=b.train_no and a.station_code=%s and b.station_code=%s and c.train_no = a.train_no and c.week_day like %s", (date_s, from_code, to_code, wdn,))

    # cursor.execute("SELECT t1.station_code as from_station, t1.train_no, t2.station_code as to_station from STATION as t1 cross join STATION as t2 where t1.station_code = %s and t2.station_code = %s and t1.train_no = t2.train_no", (from_code, to_code,))
    table = cursor.fetchall()
    result = []
    for row in table:
        result.append(row)
    return result
    # return table

def bookTicket(d):
    cursor = db.cursor(dictionary = True)
    cursor.execute("SELECT MAX(pnr) as p FROM TICKET")
    row = cursor.fetchone()
    pnr = row['p']
    pnr += 1
    train_no = d[0]
    date = d[5]
    cursor.execute("SELECT count(*) as p FROM TICKET where train_no=%s and d_date=%s", (train_no, date,))
    row = cursor.fetchone()
    seat_no = row['p']
    seat_no += 1
    cursor.execute("INSERT INTO TICKET VALUES(%s, %s, %s, %s, %s, %s, %s)", (pnr,d[1],d[2],d[5],d[6],seat_no,d[0],))
    db.commit()
    return pnr,seat_no

def addUser(l):
    cursor = db.cursor(dictionary = True)
    cursor.execute("SELECT * FROM USER WHERE user_id =%s", (l[1],)) # l[0] is user_id
    table = cursor.fetchall()
    if len(table) > 0:
        return False
    #uname, uid, pass, age, dob, gender, phone, email, address
    cursor.execute("INSERT INTO USER VALUES(%s,%s,%s,%s,%s,%s,%s,%s)", (l[0],l[1],l[2],l[3],l[4],l[5],l[6],l[7],))
    db.commit()
    return True

def createTrain(l):
    cursor = db.cursor(dictionary = True)
    cursor.execute("SELECT * FROM STATION WHERE train_no =%s", (l[1],))
    table = cursor.fetchall()
    if len(table) > 0:
        return False
    cursor.execute("INSERT INTO STATION VALUES(%s, %s, %s, %s)", (l[0],l[1],l[2],l[3],))
    db.commit()
    cursor.execute("INSERT INTO AVAILABLE VALUES(%s, %s, %s)", (l[1],l[5],l[4],))
    db.commit()
    return True

def deleteTrain(l):
    cursor = db.cursor(dictionary = True)
    cursor.execute("SELECT * FROM STATION WHERE train_no =%s", (l[0],))
    table = cursor.fetchall()
    if len(table) == 0:
        return False
    cursor.execute("DELETE FROM AVAILABLE WHERE train_no = %s", (l[0],))
    db.commit()
    cursor.execute("DELETE FROM STATION WHERE train_no = %s", (l[0],))
    db.commit()
    return True

def getTrainSeatsAndWeekdays(train_no):
    cursor = db.cursor(dictionary = True)
    cursor.execute("SELECT * FROM AVAILABLE WHERE train_no =%s", (train_no,))
    row = cursor.fetchone()
    l = [row["seat"], row["week_day"]]
    print(l)
    return l

def updateSeatsAndWeekdays(l):
    cursor = db.cursor(dictionary = True)
    #l = [train_no, seat, week_day]
    cursor.execute("UPDATE AVAILABLE SET seat = %s WHERE train_no =%s", (l[1],l[0],))
    db.commit()
    cursor.execute("UPDATE AVAILABLE SET week_day = %s WHERE train_no =%s", (l[2],l[0],))
    db.commit()
    

def getTrainStations(train_no):
    cursor = db.cursor(dictionary = True)
    cursor.execute("SELECT * FROM STATION WHERE train_no =%s", (train_no,))
    table = cursor.fetchall()
    l = []
    for row in table:
        tmp = [row["station_code"], row["train_no"], row["arrival_t"], row["departure_t"]]
        l.append(tmp)
    return l

def updateTrainStations(l):
    pass

#{'station_code': 'CNB', 'train_no': '14006', 'arrival_t': '18:00', 'departure_t': '18:10'}

# getTrainDetails("14006")
# lst = ["989898", 80, "135"]
# updateSeatsAndWeekdays(lst)

# abcd = 
# abcd = search_train("CNB", "DHN", "2022-11-11")
# for e in abcd:
#     print(e)
# bookTicket()
# val = checkUser("IR1122", "IR12")
# print(val)

# print(getAvailableSeats("14006", "2022-11-01"))
# tr = ["555555"]
# print(delete_train(tr))

'''
select a.train_no,a.station_code, b.station_code,a.departure_t, b.arrival_t,"2022-10-28" as date from STATION as a, STATION as b, AVAILABLE as c where a.train_no=b.train_no and a.station_code="CNB" and b.station_code="PNBE" and c.train_no = a.train_no and c.week_day like '%4%'
'''