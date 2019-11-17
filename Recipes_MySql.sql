/*******************************************************************************
   Recipe Database - Version 1.4
   Script: Recipes_MySql.sql
   Description: Creates and populates the Recipes database.
   DB Server: MySql
   Author: Lee Molton
********************************************************************************/

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
DROP DATABASE IF EXISTS `Recipes`;


/*******************************************************************************
   Create database
********************************************************************************/
CREATE DATABASE `Recipes`;


USE `Recipes`;


/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TABLE `Authors`
(
    `AuthorId` INT NOT NULL AUTO_INCREMENT,
    `Name` NVARCHAR(160) NOT NULL,
    `Recipe` NVARCHAR(160) NOT NULL,
    `CountryId` INT NOT NULL,
    CONSTRAINT `PK_Authors` PRIMARY KEY  (`AuthorId`)
);

CREATE TABLE `CountryOrigin`
(
    `CountryId` INT NOT NULL AUTO_INCREMENT,
    `Name` NVARCHAR(120),
    `Country` NVARCHAR(120),
    `AuthorId` INT NOT NULL,
    CONSTRAINT `PK_CountryOrigin` PRIMARY KEY  (`CountryId`)
);

CREATE TABLE `Cuisines`
(
    `CuisineId` INT NOT NULL AUTO_INCREMENT,
    `Food` NVARCHAR(40) NOT NULL,
    `ItemId` INT NOT NULL,
    CONSTRAINT `PK_Cuisines` PRIMARY KEY  (`CuisineId`)
);

CREATE TABLE `Ingredients`
(
    `ItemId` INT NOT NULL AUTO_INCREMENT,
    `Item` NVARCHAR(20) NOT NULL,
    `Quantity` NVARCHAR(20) NOT NULL,
    `CuisineId` INT NOT NULL,
    CONSTRAINT `PK_Ingredients` PRIMARY KEY  (`ItemId`)
);

CREATE TABLE `Allergens`
(
    `AllergenId` INT NOT NULL AUTO_INCREMENT,
    `Recipe` NVARCHAR(160) NOT NULL,
    `Allergen` INT NOT NULL,
    `ItemId` INT NOT NULL,
    CONSTRAINT `PK_Allergens` PRIMARY KEY  (`AllergenId`)
);
/*******************************************************************************
   Create Primary Key Unique Indexes
********************************************************************************/

/*******************************************************************************
   Create Foreign Keys
********************************************************************************/

ALTER TABLE `CountryOrigin` ADD CONSTRAINT `FK_CountryOriginAuthorId`
    FOREIGN KEY (`AuthorId`) REFERENCES `Authors` (`AuthorId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_CountryOriginAuthorId` ON `CountryOrigin` (`AuthorId`);

ALTER TABLE `Ingredients` ADD CONSTRAINT `FK_IngredientsCuisineId`
    FOREIGN KEY (`CuisineId`) REFERENCES `Cuisines` (`CuisineId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_IngredientsCuisineId` ON `Ingredients` (`CuisineId`);

ALTER TABLE `Allergens` ADD CONSTRAINT `FK_AllergensItemId`
    FOREIGN KEY (`ItemId`) REFERENCES `Ingredients` (`ItemId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_AllergensItemId` ON `Allergens` (`ItemId`);

ALTER TABLE `Authors` ADD CONSTRAINT `FK_AuthorsCountryId`
    FOREIGN KEY (`CountryId`) REFERENCES `CountryOrigin` (`CountryId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_AuthorsCountryId` ON `Authors` (`CountryId`);

ALTER TABLE `Cuisines` ADD CONSTRAINT `FK_CuisinesItemId`
    FOREIGN KEY (`ItemId`) REFERENCES `Ingredients` (`ItemId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_CuisinesItemId` ON `Cuisines` (`ItemId`);

/*******************************************************************************
   Populate Tables
********************************************************************************/
INSERT INTO `Authors` (`Name`, `Recipe`, `CountryId`) VALUES (N'John Smith', 'Scouse', 1);
INSERT INTO `Authors` (`Name`, `Recipe`, `CountryId`) VALUES (N'Mary Berry', 'Shepherds Pie', 2);
INSERT INTO `Authors` (`Name`, `Recipe`, `CountryId`) VALUES (N'Paul Evans', 'Corned beef hash', 3);
INSERT INTO `Authors` (`Name`, `Recipe`, `CountryId`) VALUES (N'Lee Majors', 'Roast lamb dinner', 4);
INSERT INTO `Authors` (`Name`, `Recipe`, `CountryId`) VALUES (N'Ken Barlow', 'Mixed grill', 5);
INSERT INTO `Authors` (`Name`, `Recipe`, `CountryId`) VALUES (N'Liz McDonald', 'Gammon amd eggs', 6);
INSERT INTO `Authors` (`Name`, `Recipe`, `CountryId`) VALUES (N'Gordon Ramsey', 'Curry and rice', 7);
INSERT INTO `Authors` (`Name`, `Recipe`, `CountryId`) VALUES (N'Jim Royle', 'Paella', 8);
INSERT INTO `Authors` (`Name`, `Recipe`, `CountryId`) VALUES (N'Marco Silva', 'Lasagne', 9);
INSERT INTO `Authors` (`Name`, `Recipe`, `CountryId`) VALUES (N'Justin Holbrook', 'Egg and chips', 10);

INSERT INTO `CountryOrigin` (`Name`, `Country`, `AuthorId`) VALUES (N'John Smith', 'England', 1);
INSERT INTO `CountryOrigin` (`Name`, `Country`, `AuthorId`) VALUES (N'Mary Berry', 'Spain', 2);
INSERT INTO `CountryOrigin` (`Name`, `Country`, `AuthorId`) VALUES (N'Paul Evans', 'France',  3);
INSERT INTO `CountryOrigin` (`Name`, `Country`, `AuthorId`) VALUES (N'Lee Majors', 'USA',  4);
INSERT INTO `CountryOrigin` (`Name`, `Country`, `AuthorId`) VALUES (N'Ken Barlow', 'Scotland',  5);
INSERT INTO `CountryOrigin` (`Name`, `Country`, `AuthorId`) VALUES (N'Liz McDonald', 'Belgium', 6);
INSERT INTO `CountryOrigin` (`Name`, `Country`, `AuthorId`) VALUES (N'Gordon Ramsey', 'Wales', 7);
INSERT INTO `CountryOrigin` (`Name`, `Country`, `AuthorId`) VALUES (N'Jim Royle', 'Ireland', 8);
INSERT INTO `CountryOrigin` (`Name`, `Country`, `AuthorId`) VALUES (N'Marco Silva', 'Portugal', 9);
INSERT INTO `CountryOrigin` (`Name`, `Country`, `AuthorId`) VALUES (N'Justin Holbrook', 'Australia', 10);

INSERT INTO `Cuisines` (`Food`, `ItemId`) VALUES (N'Scouse', 1);
INSERT INTO `Cuisines` (`Food`, `ItemId`) VALUES (N'Shepherds Pie', 2);
INSERT INTO `Cuisines` (`Food`, `ItemId`) VALUES (N'Corned beef hash', 3);
INSERT INTO `Cuisines` (`Food`, `ItemId`) VALUES (N'Roast lamb dinner', 4);
INSERT INTO `Cuisines` (`Food`, `ItemId`) VALUES (N'Mixed grill', 5);
INSERT INTO `Cuisines` (`Food`, `ItemId`) VALUES (N'Gammon and eggs', 6);
INSERT INTO `Cuisines` (`Food`, `ItemId`) VALUES (N'Curry and rice', 7);
INSERT INTO `Cuisines` (`Food`, `ItemId`) VALUES (N'Paella', 8);
INSERT INTO `Cuisines` (`Food`, `ItemId`) VALUES (N'Lasagne', 9);
INSERT INTO `Cuisines` (`Food`, `ItemId`) VALUES (N'Egg and chips', 10);

INSERT INTO `Ingredients` (`Item`, `Quantity`, `CuisineId`) VALUES (N'Beef stew meat, Potatoes, Carrots, Stock', N'half a pound, 5 pounds, 1 pound, 2', 1);
INSERT INTO `Ingredients` (`Item`, `Quantity`, `CuisineId`) VALUES (N'Mince, Potatoes, Gravy', N'half a pound, 2 pounds, 2 tbsp', 2);
INSERT INTO `Ingredients` (`Item`, `Quantity`, `CuisineId`) VALUES (N'Corned beef, potatoes, carrots, stock', N'2 pound, 10, 100g, 2', 3);
INSERT INTO `Ingredients` (`Item`, `Quantity`, `CuisineId`) VALUES (N'Lamb, roast potatoes, peas, cauliflower', N'1 leg, 7, 100g, 2 florets', 4);
INSERT INTO `Ingredients` (`Item`, `Quantity`, `CuisineId`) VALUES (N'Sausages, steak, chicken, chips', N'2, 8oz, 1, 8', 5);
INSERT INTO `Ingredients` (`Item`, `Quantity`, `CuisineId`) VALUES (N'gammon slices, eggs, peas', N'2, 2, 100g', 6);
INSERT INTO `Ingredients` (`Item`, `Quantity`, `CuisineId`) VALUES (N'Curry powder, rice', N'4 teaspoons, 2 cups', 7);
INSERT INTO `Ingredients` (`Item`, `Quantity`, `CuisineId`) VALUES (N'Long grain rice, chorizo sausage, leek or onion, frozen pea, 1 hot fish or chicken stock', N'300g, 100g, 1, 200g, 1', 8);
INSERT INTO `Ingredients` (`Item`, `Quantity`, `CuisineId`) VALUES (N'Large onion, pasta, large carrot, beef mince, chopped tomatoes, tomato puree', N'1, 1lb 2oz, 400g, 2tbsp', 9);
INSERT INTO `Ingredients` (`Item`, `Quantity`, `CuisineId`) VALUES (N'Eggs, chips', N'2, 10', 10);

INSERT INTO `Allergens` (`Recipe`, `Allergen`, `ItemId`) VALUES (N'Scouse', N'Wheat gluten, soya, milk', 1);
INSERT INTO `Allergens` (`Recipe`, `Allergen`, `ItemId`) VALUES (N'Shepherds pie', N'WHheat gluten', 2);
INSERT INTO `Allergens` (`Recipe`, `Allergen`, `ItemId`) VALUES (N'Corned beef hash', N'None', 3);
INSERT INTO `Allergens` (`Recipe`, `Allergen`, `ItemId`) VALUES (N'Roast lamb dinner', N'None', 4);
INSERT INTO `Allergens` (`Recipe`, `Allergen`, `ItemId`) VALUES (N'Mixed grill', N'None', 5);
INSERT INTO `Allergens` (`Recipe`, `Allergen`, `ItemId`) VALUES (N'Gammon and eggs', N'None', 6);
INSERT INTO `Allergens` (`Recipe`, `Allergen`, `ItemId`) VALUES (N'Curry and rice', N'None', 7);
INSERT INTO `Allergens` (`Recipe`, `Allergen`, `ItemId`) VALUES (N'Paella', N'None', 8);
INSERT INTO `Allergens` (`Recipe`, `Allergen`, `ItemId`) VALUES (N'Lasagne', N'Gluten', 9);
INSERT INTO `Allergens` (`Recipe`, `Allergen`, `ItemId`) VALUES (N'Egg and chips', N'None', 10);