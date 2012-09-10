Feature: Searching jokes
  As a student
  I want to find a joke mentioning specific concept
  In order to read jokes realated to the topic and learn something

  Scenario: Searching jokes by title
    Given the joke "Funny stories on deployment" is published
    When I go to the jokes listing
    And I search for "deployment"
    Then I should see a joke "Funny stories on deployment"

  Scenario: Searching jokes by tag
    Given the joke "Funny stories on deployment" is published
    And it is tagged with "deployment, integration"
    When I go to the jokes listing
    And I search for "integration"
    Then I should see a joke "Funny stories on deployment"
