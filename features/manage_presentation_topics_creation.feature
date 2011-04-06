Feature: Manage New Presentation Topics Creation
  In order to create new presentation topics
  As a new User
  I wants to be able to create new presentation topic

  @javascript
    Scenario: Register new presentation_topics_creation
      Given I am authenticated
      And I follow "Wanna Speak? Post a topic"
      And I fill in "Title" with "html 5"
      And I fill in "Description" with "html 5 with css 3"
      And I fill in "Presentation Duration (in minutes)" with "25"
      And I press "Create"
      Then 1 presentation_topic should exist
      And I should see "You have posted a Presentation Topic successfully ! "
