from robot.api.deco import keyword
from pymongo import MongoClient
import certifi
import bcrypt

#client = MongoClient('mongodb+srv://qa:123@cluster0.dahiksh.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0')

connection = 'mongodb+srv://qa:123@cluster0.dahiksh.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0'
client = MongoClient(connection, tlsCAFile=certifi.where())

db = client['Mark855']

@keyword('Remove user from database')
def remove_user(email):
    users = db['users']
    users.delete_many({'email': email})
    print('removing user by' + email)

@keyword('insert user from database')
def insert_user(user):

    hash_pass = bcrypt.hashpw(user['password'].encode('utf-8'), bcrypt.gensalt(8))
    
    doc = {
        'name': user['name'],
        'email':user['email'],
        'password': hash_pass
    }

    users = db['users']
    users.insert_one(doc)
    print( user)

  