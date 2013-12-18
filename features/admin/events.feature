Feature: Admin Events
  Background:
    Given There are Wedding, Birthday, and Special Events categories
    And I am logged in as an admin

  Scenario: I can add a new Brithday event
    Given I visit the list of events
    When I enter birthday event:
      | event title         | Emily's 66th day                  |
      | product highlighted | Tropical Baby Cake                |
      | description         | Pina coladas with toasted coconut |
      | more details        | link to facebook                  |
      | picture             | emily_66th_day.jpg                |
    Then The birthday events is stored
    And I see the details of the birthday event I just entered
