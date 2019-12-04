Database Recipe-Project

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
This is a basic online recipe book, I wanted it to be informative for the users and also easy to enter a new recipe.
I started by creating a front page with several photos of basic meals, I decided to use traditional meals that are easy to cook. By having a photo of the meal and a link to the recipe, it makes it more interesting and looks more appealing to the user. For the user to be able to see all the recipes, I decided to add a search bar at the top where the user can search existing recipes by using key words. I also wanted the user to be able to enter new recipes and decided to create a simple form for a new recipe to be added.

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

### Delete a Recipe
A recipe can be deleted by the user, by searching in the search bar for the recipe. This will bring up the option of view receipe or delete recipe, the delete recipe button will delete the recipe from the database.

### Wireframes 
I have created wireframes of my original ideas, to see these wireframes go to https://github.com/leemolton/recipes-project/tree/master/wireframes.

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
Manual testing for the application was undertaken and it passed. I put a plan together to test everything from the menu bar to the different links on each page. My first test was to test the buttons on the menu bar to access the different pages. The pages opened and on the correct page, the links were correctly written to the different template files. The hyperlinks were next to be tested, firstly on the home page to the different recipes and all the links to the recipes to ensure that they worked. The right recipes opened correctly. All of the navigation has been tested on smaller screen 
devices too.
    
Search Recipe bar
I firstly tested the input of the search bar and displayed a few different recipes. Next I clicked on the View Recipe button to display a range of specific recipes, the recipes selected all displayed correctly.
    
Add recipe form
The next test was on the recipe form, to test this I added a new recipe by completing each box of the form and then clicked on the submit button. The new recipe was added to the database successfully.
    

## Heroku Deployment

#### Running the server
The application was coded on Cloud9 and was then committed to GITHUB 
at https://github.com/leemolton/recipes-project. The application was 
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
