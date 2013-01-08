Feature: Publishing jokes
  As a teacher
  I want to explicitely publish submitted jokes
  In order to filter stupid jokes and possibly spam

  Scenario: Viewing a list of unpublished jokes
    Given the joke "Very funny" is submitted
    When I go to the joke publishing screen
    Then I should see the joke "Very funny" in the list of unpublished jokes

  Scenario: Publishing joke
    Given the joke "Very funny" is submitted
    When I go to the joke publishing screen
    And I rate the joke "Very funny" with 3 stars and add a comment "Good one" and confirm the publishing
    Then the joke "Very funny" should be published

  Scenario: Deleting joke
    Given the joke "Very funny" is submitted
    When I go to the joke publishing screen
    And I delete the joke "Very funny"
    Then the joke "Very funny" should not exist
