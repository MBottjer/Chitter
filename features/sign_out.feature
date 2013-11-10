Feature: Sign Out

  Scenario: Signing out as a logged in user
    Given I am on the homepage
    And I am logged in 
    When I press "Sign Out"
    Then I should see "You are no longer logged in"