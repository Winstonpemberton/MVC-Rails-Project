# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 

There's three models that have a has many relationship. Characters has many potions, merchants has many weapons, potions and armors and inventories have the same has many relationship as merchants.

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)

There's a lot of belongs to relationships just to name a couple, enemies and bosses belong to a game, weapons,armors, and potions belong to a character, user and inventory.

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)

Merchants and Characters are both a join table between Users and Games 

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)

Users have many Games through Characters and Games have many Users through characters 

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)

Merchants and Characters both have a name and background attribute that must be filled out

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

Merchants and Characters are the only models that have a form and they must be filled out in order to continue 

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

Though scope methods didn't really have a practical purpose in my program, I showcased them in a separate form with the character model 

- [x] Include signup (how e.g. Devise)

Users a first brought to the login page where they can click a link to signup

- [x] Include login (how e.g. Devise)

Login page is the homepage

- [x] Include logout (how e.g. Devise)

logout link is displayed on every page 

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)

Even in the lab for Omniauth everything is setup but it gets a github page 404 and I can't seem to find a way for it to actually find the page.

- [x] Include nested resource show or index (URL e.g. users/2/recipes)

Characters and Games have their show route nested with Users

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
Games have their new route nested in Users 

- [x] Include form display of validation errors (form URL e.g. /recipes/new)

If the user doesn't fill in the name and background for both character and merchant they are brought back and are told what's missing 

Confirm:
- [x] The application is pretty DRY

I tried making as dry as possible but there's a couple links that are repeated because the path for it has a different parameter depending on the page 

- [x] Limited logic in controllers

There's some if statements but that's only used for determining what page to load, everthing else is in a method.

- [x] Views use helper methods if appropriate

Didn't see a need for helper methods 

- [x] Views use partials if appropriate

User new and edit page are the only models that needed a partial
