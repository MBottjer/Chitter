Feature: Adding a User

  Scenario: Add a New User
    Given I am on the homepage
    And I follow "Sign Up"
    And I fill in "email" with "michaelbottjer@hotmail.com"
    And I fill in "password" with "devesh"
    And I fill in "password_confirmation" with "devesh"
    And I fill in "name" with "michael"
    And I fill in "user_name" with "mbottjer"
    When I press "Sign Up"
    Then I should see "Welcome, mbottjer"

  Scenario: Adding a User with Unmatched Passwords 
    Given I am on the sign up page 
    And I fill in "email" with "michaelbottjer@hotmail.com"
    And I fill in "password" with "devesh"
    And I fill in "password_confirmation" with "devash"
    And I fill in "name" with "michael"
    And I fill in "user_name" with "mbottjer"
    When I press "Sign Up"
    Then I should see "Password does not match the confirmation"

  Scenario: Adding a duplicate user 

    Given I am on the sign up page
    And a User exists with the following details:
    |email                      |password_digest   |name        |user_name        |
    |michaelbottjer@hotmail.com |devesh            |michael     |mbottjer         |
    When I fill in "email" with "michaelbottjer@hotmail.com"
    And I fill in "password" with "devesh"
    And I fill in "password_confirmation" with "devesh"
    And I fill in "name" with "michael"
    And I fill in "user_name" with "mbottjer"
    And I press "Sign Up"
    Then I should see "Email is already taken"

  Scenario: Adding a user with a pre-existing username

    Given I am on the sign up page
    And a User exists with the following details:
    |email                      |password_digest   |name        |user_name        |
    |michaelbottjer@hotmail.com |devesh            |michael     |mbottjer         |
    When I fill in "email" with "devesh@hotmail.com"
    And I fill in "password" with "devesh"
    And I fill in "password_confirmation" with "devesh"
    And I fill in "name" with "michael"
    And I fill in "user_name" with "mbottjer"
    And I press "Sign Up"
    Then I should see "User name is already taken"