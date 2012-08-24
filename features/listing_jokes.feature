Feature: Listing jokes
  As a student
  I want to view published jokes
  In order to humor myself and maybe learn a bit about software engineering as a side effect

  Scenario: Viewing list of published jokes
    Given the joke "This is fun" is published
    When I go to the jokes listing
    Then I should see a joke "This is fun"
