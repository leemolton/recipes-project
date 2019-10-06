# Database Recipe-Project

This is my database project for the Full Stack Development course and I decided to use the Recipe idea. I wanted to create a database of recipes, largely English meals ranging
from a Roast Lamb Dinner to Gammon and Eggs. There is a database of recipes that can be searched and viewed by any user. This project can be viewed at https://my-cooking-recipe.herokuapp.com.


# Table of Contents
- [UX](https://github.com/leemolton/recipes-project/master/README.md#ux)
    - [Strategy](https://github.com/leemolton/recipes-project/README.md#strategy)
    - [Existing Features](https://github.com/leemolton/recipes-project/README.md#existing-features)
        - [Header and Footer](https://github.com/leemolton/recipes-project/README.md#header-and-footer)
        - [Index](https://github.com/leemolton/recipes-project/README.md#index)
        - [Add a Recipe](https://github.com/leemolton/recipes-project/README.md#dates-for-your-diary)
    - [Wireframes](https://github.com/leemolton/recipes-project/README.md#wireframes)
- [Technologies, Libraries and Languages](https://github.com/leemolton/recipes-project/README.md#technologies-libraries-and-languages)
- [Testing](https://github.com/leemolton/recipes-project/README.md#testing)
    - [Manual Testing](https://github.com/leemolton/recipes-project/README.md#manual-testing)
- [Heroku Deployment](https://github.com/leemolton/recipes-project/README.md#heroku-deployment)
- [Credits](https://github.com/leemolton/recipes-project/README.md#credits)
    - [Acknowledgements](https://github.com/leemolton/recipes-project/README.md#acknowledgements)


## UX

### Strategy
This is a basic online recipe book, As a user, I would expect to enter a new recipe.
As a user, I would expect to be able to see all the recipes.
As a user, I would expect to be able to search on existing recipes.

The primary purpose for this project was to display new recipes for users and also enable them to enter new recipes
to the website. I made a list of meals that I enjoy as I wanted the recipes to be of basic meals rather than 
complicated Chinese or Indian meals. I have created wireframes with my initial designs at https://github.com/leemolton/recipes-project/tree/master/wireframes.

I wanted to show pictures of the meals with the recipe title to give the user a quick and interesting view of the recipe with a button 
they can click on to view the recipe. 


## Existing Features

### Header and Footer
The header displays the title of the website which is clickable and will take the user back to the home page.
There is a menu bar on the top right with navigation to the various pages of the website.

### Index
The home page starts with a search bar which users can enter food or a country to view recipes.
Underneath this are 6 popular recipes with images and a link to let the user view the recipe.

### Add a Recipe
The page starts with a form for the user to input into. The user starts by inputting their name 
and country where they are from. They then add the name of the cuisine, the item(s),
quantity and if there are any allergens. The send button will then send this recipe to the database.


### Technologies, Libraries and Languages

Throughout this project I have used: 
- ## PyMongo

- ## Bootstrap 
 
- ## HTML 5

- ## CSS 3 

- ## Heroku 

## Testing
    
### Manual Testing

Navigation
The pages have been tested and all the links to the pages to ensure that they work 
properly and take the user to the right place. The navigation bar is at the
top of every page. All of the navigation has been tested on smaller screen 
devices too.
    
Search Recipe bar
I tested the input of the search bar and displayed a few different recipes. 
I clicked on the View Recipe button to display the specific recipe.
    
Add recipe form
I tested add recipe form and added a recipe to the database successfully.
    

## Heroku Deployment

#### Running the server
The application was coded on Cloud9 and was then committed to GITHUB 
at https://github.com/leemolton/footy_fanspage. The application was 
deployed from GITHUB to Heroku at https://my-cooking-recipe.herokuapp.com.
    
My database is stored on MongoDB and is setup within Heroku.

## Credits
Searching daily, weekly and monthly on the Stack Overflow 
website(https://stackoverflow.com)
I got the recipe images from searching on Google and saving the links
to the images.
I viewed the following page for ideas on how to structure my project
- www.myrecipes.com.

### Acknowledgements
The students in the slack forum and the Stack Overflow forum 
were a great help to me when I was struggling with my code.
My mentor also helped a lot with support and guidance for my project.
