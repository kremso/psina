Feature: Editing jokes
  As a teacher
  I want to edit already published jokes
  In order to fix errors or update content

  Scenario: Editing published jokes
    Given the joke "Very funny" is published
    When I go to the joke editation screen
    And I edit the joke "Very funny" and change its title to "So funny"
    Then the joke "Very funny" should not exist
    But the joke "So funny" should exist

  Scenario: Unpublishing joke
    Given the joke "Very funny" is published
    When I go to the joke editation screen
    And I unpublish joke "Very funny"
    Then the joke "Very funny" should not be published
