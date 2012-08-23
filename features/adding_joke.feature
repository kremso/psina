Feature: Adding joke
  As a teacher
  I want to let my students submit new jokes
  In order to teach them software engineering in a funny way

  Scenario: Submitting new joke
    Given I go to the new joke submission page
    When I fill in a new joke "This is fun"
    And I submit the joke
    Then the joke should be queued for review by administrator

  Scenario: Submitting joke and assigning tags
    Given I go to the new joke submission page
    When I fill in a new joke "This is fun"
    And I assign it tags "deploy, integration"
    And I submit the joke
    Then the joke should be tagged with "deploy"
    And the joke should be tagged with "integration"
