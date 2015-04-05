Feature: Users and user page

  As a developer
  so that I can track the users
  I want to add a new user to the list

  Scenario: Add a user
    Given I am on the user creation page
    When I fill in a name
    And I fill in a username
    And I fill in an email
    And I click to create a new user
    Then I should see the new user's page
    And I should see the correct name
    And I should see the correct username
    And I should see the correct email

  Scenario: Add a user without any info
    Given I am on the user creation page
    When I click to create a new user
    Then I should see errors on the page

  Scenario: Add a user without a name
    Given I am on the user creation page
    When I fill in a username
    And I fill in an email
    And I click to create a new user
    Then I should see errors on the page

  Scenario: Add a user without a username
    Given I am on the user creation page
    When I fill in a name
    And I fill in an email
    And I click to create a new user
    Then I should see errors on the page

  Scenario: Add a user without an email
    Given I am on the user creation page
    When I fill in a name
    And I fill in a username
    And I click to create a new user
    Then I should see errors on the page
