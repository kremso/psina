Feature: Finding duplicate jokes
  As a student
  I want to see if there are any similar jokes
  In order to not submit duplicate jokes

  Scenario: Duplicate detection on joke submission
    Given the joke "This is fun" is published
    When I go to the new joke submission page
    And I fill in a new joke "This is more fun"
    And I submit the joke
    Then I should see that there is a similar joke "This is fun"
