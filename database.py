
import pymysql

class Database:
    def connect(self):
        return pymysql.connect(host='localhost',
                             user='root',
                             password='root',
                             db='flaskcrud',
                             port=8889,
                             unix_socket='/Applications/MAMP/tmp/mysql/mysql.sock')

    def read(self, id):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            if id == None:
                cursor.execute("SELECT personal.id, personal.name, personal.username, personal.email, personal.phone, personal.website, personal.date_created, addresses.street, addresses.suite, addresses.city, addresses.zipcode, addresses.lat, addresses.lng, company.name AS compname, company.catchphrase, company.bs   FROM `personal` INNER JOIN addresses ON personal.id = addresses.userid INNER JOIN company ON personal.id = company.userid ORDER BY personal.id DESC")
            else:
                cursor.execute("SELECT personal.id, personal.name, personal.username, personal.email, personal.phone, personal.website, personal.date_created, addresses.street, addresses.suite, addresses.city, addresses.zipcode, addresses.lat, addresses.lng, company.name AS compname, company.catchphrase, company.bs FROM `personal` INNER JOIN addresses ON personal.id = addresses.userid INNER JOIN company ON personal.id = company.userid WHERE personal.id = %s ORDER BY personal.id DESC", (id,))

            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()


    def insert(self,data):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            userid = ""
            cursor.execute("INSERT INTO personal (name, username, email, phone, website) VALUES(%s, %s, %s, %s, %s)", (data['name'],data['username'],data['email'],data['phone'],data['website'],))
            con.commit()
            userid = cursor.lastrowid
            cursor.execute("INSERT INTO addresses (userid, street, suite, city, zipcode, lat, lng) VALUES(%s, %s, %s, %s, %s, %s, %s)", (userid,data['street'],data['suite'],data['city'],data['zipcode'],data['lat'],data['lng'],))
            con.commit()
            cursor.execute("INSERT INTO company (userid, name, catchphrase, bs) VALUES(%s, %s, %s, %s)", (userid, data['companyname'],data['catchphrase'],data['bs'],))
            con.commit()

            return True
        except:
            con.rollback()

            return False
        finally:
            con.close()

    def insertFromApi(self,data):
        con = Database.connect(self)
        cursor = con.cursor()
        cursor.execute("TRUNCATE personal")
        con.commit()
        cursor.execute("TRUNCATE addresses")
        con.commit()
        cursor.execute("TRUNCATE company")
        con.commit()

        #print(dict)
        for entry in data:
            #print(entry['id'])
            name = entry['name']
            username = entry['username']
            email = entry['email']
            street = entry['address']['street']
            suite = entry['address']['suite']
            city = entry['address']['city']
            zipcode = entry['address']['zipcode']
            lat = entry['address']['geo']['lat']
            lng = entry['address']['geo']['lng']
            phone = entry['phone']
            website = entry['website']
            compname = entry['company']['name']
            catchphrase = entry['company']['catchPhrase']
            bs = entry['company']['bs']

            userid = ""
            cursor.execute("INSERT INTO personal (name, username, email, phone, website) VALUES(%s, %s, %s, %s, %s)", (name, username, email,phone, website,))
            con.commit()
            userid = cursor.lastrowid
            cursor.execute("INSERT INTO addresses (userid, street, suite, city, zipcode, lat, lng) VALUES(%s, %s, %s, %s, %s, %s, %s)", (userid,street, suite, city, zipcode, lat, lng,))
            con.commit()
            cursor.execute("INSERT INTO company (userid, name, catchphrase, bs) VALUES(%s, %s, %s, %s)", (userid, compname, catchphrase, bs,))
            con.commit()

        return True
      

    def signin(self,data):
        con = Database.connect(self)
        cursor = con.cursor()

        try:

            cursor.execute('SELECT * FROM credentials WHERE username = %s AND password = %s', (data['username'],data['password']))
            account = cursor.fetchone()
    
            if account:
                return True
            else:
                return False 
        except:
            con.rollback()

            return False
        finally:
            con.close()

    def update(self, id, data):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            cursor.execute("UPDATE personal SET name = %s, username= %s,email= %s,phone= %s,website= %s WHERE id = %s", (data['name'],data['username'],data['email'],data['phone'],data['website'],id,))
            con.commit()
            cursor.execute("UPDATE addresses SET street= %s,suite= %s,city= %s,zipcode= %s,lat= %s,lng= %s WHERE userid = %s", (data['street'],data['suite'],data['city'],data['zipcode'],data['lat'],data['lng'],id,))
            con.commit()
            cursor.execute("UPDATE company SET name= %s,catchphrase= %s,bs= %s WHERE userid = %s", (data['companyname'],data['catchphrase'],data['bs'],id,))
            con.commit()

            return True
        except:
            con.rollback()

            return False
        finally:
            con.close()

    def delete(self, id):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            cursor.execute("DELETE FROM personal WHERE id = %s", (id))
            con.commit()
            cursor.execute("DELETE FROM addresses WHERE userid = %s", (id))
            con.commit()
            cursor.execute("DELETE FROM company WHERE userid = %s", (id))
            con.commit()

            return True
        except:
            con.rollback()

            return False
        finally:
            con.close()
