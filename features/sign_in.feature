Feature: Logging In 

  Scenario: Logging in as an existing user

    Given I am on the homepage
    And a user exists with the following details:
    |email                      |password          |password_confirmation    |name        |user_name        |
    |michaelbottjer@hotmail.com |devesh            |devesh                   |michael     |mbottjer         |
    When I follow "Sign In"
    And I fill in "email" with "michaelbottjer@hotmail.com"
    And I fill in "password" with "devesh"
    And I press "Sign In"
    Then I should see "Welcome, mbottjer"