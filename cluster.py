#python3 cluster.py http://admin:admin@localhost:2001/,http://admin:admin@localhost:2001/
from pymongo import MongoClient
import sys

client = MongoClient() 
client = MongoClient("mongodb://127.0.0.1:27017/") 

dbs = client.list_database_names()

print(f"Updating cluster to {[sys.argv[1]]}")

db = client['test'] 
collection = db['accounts']
collection.update_one({'_id':'admin'}, {"$set": {"clusters": [sys.argv[1]]}}, upsert=False)