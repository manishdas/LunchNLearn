Feature: Manage New User Signup And Signin
In order to get new users
As a new User
I want to be able to sign up

  @javascript
    Scenario: Register new User
      Given I am on the new signing_up page
      And I fill in "Username" with "manish"
      And I fill in "Email" with "manish@gmail.com"
      And I fill in "Password" with "secret"
      And I fill in "Password confirmation" with "secret"
      And I press "Sign up"
      Then 1 user should exist
      And I should see "Welcome! You have signed up successfully"
      And I should see "Welcome manish@gmail.com"

  @javascript
    Scenario: Logging in a user
      Given a user exists with "new_id@gmail.com" and password "secret"
      Given I am on login page
      And I fill in "Email" with "new_id@gmail.com"
      And I fill in "Password" with "secret"
      And I press "Sign in"
      Then I should see "Signed in successfully"

