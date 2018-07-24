import os
import json
from flask import Flask, render_template, request, flash

app = Flask(__name__)
app.secret_key = 'some_secret'


@app.route('/')
def index():
    return render_template("index.html")

    
@app.route('/add', methods=["GET", "POST"])
def add():
    if request.method == "POST":
       flash("Thanks {}, we have received your recipe!".format(
            request.form["name"]))
    return render_template("add.html", page_title="Add recipe")

    
@app.route('/view')
def view():
    return render_template("view.html", page_title="View recipes")

    
if __name__ == '__main__':
    app.run(host=os.environ.get('IP'),
            port=int(os.environ.get('PORT')),
            debug=True)