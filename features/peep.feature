Feature: Viewing a Peep

  Scenario: Seeing a Peep on the homepage
    Given a peep with the following details: 
    |post           |created_at      |
    |"Table tennis" |10/11/13        |
    When I am on the homepage
    Then I should see "Table tennis"

  Scenario: A user can peep
    Given a user is logged in:
    And I am on the homepage
    When I follow "Peep"
    And I fill in "post" with "Champion of table tennis"
    And I press "Share"
    Then I should see "Champion of table tennis"