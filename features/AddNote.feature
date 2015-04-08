Feature: Notes and note pages

  As a developer
  so that I can track the notes
  I want to add a new note to the list

  Scenario: Add a note
    Given A user named Jane Doe exists
    And I am on the note creation page
    When I fill in content
    And I pick an owner
    And I click to create a new note
    Then I should see the new note's page
    And I should see the correct content
    And I should see the correct user's username

  Scenario: Add a note without any info
    Given A user named Jane Doe exists
    And I am on the note creation page
    When I click to create a new note
    Then I should see errors on the page

  Scenario: Add a note without an owner
    Given I am on the note creation page
    When I fill in content
    And I click to create a new note
    Then I should see errors on the page

  Scenario: Add a note without content
    Given A user named Jane Doe exists
    And I am on the note creation page
    When I pick an owner
    And I click to create a new note
    Then I should see errors on the page

  Scenario: Click to the owner's page
    Given A user named Jane Doe exists
    And A note by Jane Doe is created
    When I click on the owner's username
    Then I should be on the owner's page