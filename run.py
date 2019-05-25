import os
from flask import Flask, render_template, redirect, request, url_for, flash
from flask_pymongo import PyMongo
from pymongo import MongoClient
from bson.objectid import ObjectId

app = Flask(__name__)
app.secret_key = 'some_secret'
app.config['MONGO_DBNAME'] = 'myrecipedb'
app.config['MONGO_URI'] = 'mongodb://root:Everton9@ds145881.mlab.com:45881/myrecipedb'
#client = MongoClient('mongodb://root:Everton9@localhost:27017/myrecipe')
#db = client['myrecipe']

mongo = PyMongo(app)

# Get username from Cloud9 workspace
# (modify this variable if running on another environment)
username = os.getenv('C9_USER')

@app.route('/')
def index():
    return render_template("index.html")
    

@app.route('/get_recipes')
def get_recipes():
    recipe = mongo.db.recipe.find({"_id": ObjectId()})
    return render_template("recipes.html")
    
    
@app.route('/add_recipe')
def add_recipe():
    categories=mongo.db.categories.find()
    return render_template("add.html") 
    

@app.route('/insert_recipe', methods=['POST'])
def insert_recipe():
     recipes = mongo.db.recipe
     recipes.insert_one(request.form.to_dict())
     return redirect(url_for('get_recipes'))
    

@app.route('/view_recipe/<recipe_id>')
def view_recipe(recipe_id):
    recipe = mongo.db.recipes
    the_recipe = mongo.db.recipe.find_one({"_id":ObjectId(recipe_id)})
    return render_template('viewrecipe.html', recipe=the_recipe)
    
        
if __name__ == '__main__':
    app.run(host=os.environ.get('IP'),
            port=int(os.environ.get('PORT')),
            debug=True)
            
