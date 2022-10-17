## Creating the login functionality

- Enable sessions in the ApplicationController - `enable :sessions`
- Create a Sessions Controller to handle login. This controller will handle '/login' and '/logout' functionality.
- Since the User's `post` to `"/users"` is creating or signing up a user, we can direct our form data from the front end to this action. Let's rename this route to `"/signup"`
- 