use dbname
db.getCollectionNames()
db.collection.find().pretty()
db.collection.remove # Removes documents from a collection

#rename database (only copy is available, so the trick is used)
db.copyDatabase('old_name', 'new_name');
use old_name
db.dropDatabase();