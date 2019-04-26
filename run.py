import os
from flask import Flask, render_template, redirect, request, url_for, flash
from flask_pymongo import PyMongo
from bson.objectid import ObjectId

app = Flask(__name__)
app.secret_key = 'some_secret'
app.config['MONGO_DBNAME'] = 'myrecipe'
app.config['MONGO_URI'] = 'mongodb://<dbuser>:<dbpassword>@ds145881.mlab.com:45881/myrecipedb'

mongo = PyMongo(app)

# Get username from Cloud9 workspace
# (modify this variable if running on another environment)
username = os.getenv('C9_USER')

@app.route('/')
def index():
    return render_template("index.html")
    

@app.route('/get_recipes')
def get_recipes():
    print(mongo.db.myrecipe.find())
    return render_template("recipes.html", recipes=mongo.db.myrecipe.find())
    
    
@app.route('/add_recipe')
def add_recipe():
    return render_template("add.html", categories=mongo.db.categories.find())
    

@app.route('/insert_recipe')
def insert_recipe():
    recipes = mongo.db.myrecipe
    recipes.insert_one(request.form.to_dict())
    return redirect(url_for('get_recipes'))
    
    
@app.route('/edit_recipes/<recipe_id>')
def edit_recipes(recipe_id):
    the_recipes = mongo.db.myrecipe.find_one({"_id": ObjectId(recipe_id)})
    all_categories = mongo.db.categories.find()
    return render_template('edit.html', recipes=the_recipes, categories=all_categories)
    

@app.route('/recipes/<myrecipe_id>')
def view_recipe(myrecipe_id):
    the_recipe = mongo.db.myrecipe.find_one({"_id": ObjectId(myrecipe_id)})
    return render_template('recipes.html', recipe=the_recipe)
    
    
#@app.route('/add', methods=["GET", "POST"])
#def add():
#    cursor=connection.cursor()
#    if request.method == "POST":
#        Name=request.form['name']
#        Country=request.form['country']
#        Cuisine=request.form['recipe']
#        Item=request.form['item']
#        Quantity=request.form['quantity']
#        Allergen=request.form['allergen']
        
        # Create a new record
#    Query = "INSERT INTO Authors (Name, Recipe, CountryID) VALUES(%s,%s,%s)"
    #"INSERT INTO `CountryOrigin` (`Name`, `Country`, `AuthorId`) VALUES (%s,%s,%s);"
    #"INSERT INTO `Cuisines` (`Food`, `ItemId`, `AllergenId`) VALUES ('recipe.cuisine', 11, 11);"
    #"INSERT INTO `Ingredients` (`Item`, `Quantity`, `CuisineId`) VALUES ('recipe.item', 'recipe.quantity', 11);"
    #"INSERT INTO `Allergens` (`Recipe`, `Allergen`, `ItemId`) VALUES ('recipe.name', 'recipe.allergen', 11);"
#    cursor.execute(Query,(Name,Country,Cuisine,Item,Quantity,Allergen))
        
        # connection is not autocommit by default, so you must commit so save your changes.
#    connection.commit()
#    print(request.data)
#    flash("Thanks we have received your recipe!")
    #result = cursor.fetchall()
    #print(result)
#    cursor.close()

    # Close the connection, regardless of whether the above was successful
#   connection.close()
#   return render_template("add.html", page_title="Add recipe")

    
#@app.route('/get_recipes')
#def get_recipes():
#    print(mysql.db.recipes.find())
#    return render_template("view.html", page_title="View recipes")
#    recipes = mysql.db.recipes.find()
    
#    recipes_dict = []
    
#    for i, recipe in enumerate(recipes):
#        recipe.pop('_id', None)
#        recipes_dict[i] = recipe
        
#    recipes_dict = json.dumps(recipes_dict)
    
#    return render_template('view.html',
#                           recipes=recipes_dict)
    

#@app.route('/view_recipe/', methods=['GET', 'POST'])
#def view_recipe():
#"""
    #Get recipes from selection
    #"""

#    recipe = []
    
#    print(recipes)
    
#    for recipe in recipes:
#        if recipe['view_recipe'] == recipe:
#            recipe = recipe
        
#    return render_template('view.html')
    
if __name__ == '__main__':
    app.run(host=os.environ.get('IP'),
            port=int(os.environ.get('PORT')),
            debug=True)
            
