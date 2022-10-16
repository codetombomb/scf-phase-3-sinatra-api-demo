## Creating the controllers

- The `ApplicationController` is where we will add controller functionality that will be shared throughout the other controllers. 
- Write separate controllers to handle `CRUD` actions for each model (separation of concerns).
- When creating a new controller, we need to:
    - Create the file - use a naming convention that pluralizes the model name (ex: `users_controller.rb`)
    - Create the Ruby `class` - matching the naming of the file (ex: `class UsersController`)
    - Make sure that the controller that you just created is inheriting functionality from the base ApplicationController (ex: `class UsersController < ApplicationController`)
    - Tell the Sinatra app to use the new controller by adding it to the `config.ru` file (ex: use UsersController) after the `run ApplicationController` line.