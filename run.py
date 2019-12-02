import os
import json
import pymysql
from flask import Flask, render_template, redirect, request, url_for, flash
from flask_pymongo import PyMongo
from pymongo import MongoClient
from bson.objectid import ObjectId

app = Flask(__name__)
app.secret_key = 'some_secret'
app.config['MONGO_DBNAME'] = 'myrecipedb'
app.config['MONGO_URI'] = 'mongodb://root:Everton9@ds145881.mlab.com:45881/myrecipedb?retryWrites=false&w=majority'


mongo = PyMongo(app)

# Get username from Cloud9 workspace
# (modify this variable if running on another environment)
username = os.getenv('C9_USER')


@app.route('/')
def index():
    return render_template("index.html")



@app.route('/get_recipes')
def get_recipes():
        return render_template("recipes.html", recipe=mongo.db.recipe.find())


    
    
@app.route('/add_recipe')
def add_recipe():
        return render_template("add.html", recipe = mongo.db.recipe.find())


    

@app.route('/insert_recipe', methods=['POST'])
def insert_recipe():
        recipe = mongo.db.recipe 
        recipe.insert_one(request.form.to_dict())
        flash('Thank you for your recipe!')
        return redirect(url_for('add_recipe'))


    

@app.route('/view_recipe/<recipe_id>')
def view_recipe(recipe_id):
        the_recipe = mongo.db.recipe.find_one({'_id': ObjectId(recipe_id)})
        return render_template('viewrecipe.html', recipe=the_recipe)



@app.route('/find_recipe', methods=['POST'])
def find_recipe():
        if request.method=='POST':
        
            # get search term
            search_term = request.form.get("search_term")
        
            # create the index
            mongo.db.recipe.create_index( [("$**", 'text')] )
        
            # search with the search term that came through the search bar
            cursor = mongo.db.recipe.find({ "$text": { "$search": search_term } })
            recipe = [recipe for recipe in cursor]
            print(search_term)
        
            # send recipes to page
            return render_template('search.html', recipe=recipe, query=search_term)
        
        return render_template('search.html')
      
           
    
        
if __name__ == '__main__':
    app.run(host=os.environ.get('IP'),
            port=int(os.environ.get('PORT')),
            debug=True)
            

    

