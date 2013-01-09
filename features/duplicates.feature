Feature: Finding duplicate jokes
  As a student
  I want to see if there are any similar jokes
  In order to not submit duplicate jokes

  Scenario: Duplicate detection on joke submission
    Given the joke "Idu dve babky po pusti a padne na ne balkon" is published
    When I go to the new joke submission page
    And I fill in a new joke "Idu dve babky po pusti a padne na ne balkon"
    And I submit the joke
    Then I should see that there is a similar joke "Idu dve babky po pusti a padne na ne balkon"

  Scenario: Duplicate overriding on joke submission
    Given the joke "Idu dve babky po pusti a padne na ne balkon" is published
    When I go to the new joke submission page
    And I fill in a new joke "Idu dve babky po pusti a padne na ne kvetinac"
    And I submit the joke
    Then I should see that there is a similar joke "Idu dve babky po pusti a padne na ne balkon"
    When I force submit the joke again
    Then the joke "Idu dve babky po pusti a padne na ne kvetinac" should be queued for review by administrator
