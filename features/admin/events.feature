Feature: Admin Events
  Background:
    Given There are Wedding, Special Events, and Catering categories
    And I am logged in as an admin

  Scenario: I can add a new Catering event
    Given I visit the list of events
    When I enter Catering event:
      | event title         | Emily's 66th day                  |
      | product highlighted | Tropical Baby Cake                |
      | description         | Pina coladas with toasted coconut |
      | more details        | link to facebook                  |
      | picture             | emily_66th_day.jpg                |
    Then The Catering event is stored
    And I see the details of the Catering event I just entered

  Scenario: I can edit an existing event
    Given the Catering category has:
      | event title         | product highlighted       | description                            | more details     | picture               |
      | Emily's 66th day    | Tropical Baby Cake        | Pina coladas with toasted coconut      | link to facebook | emily_66th_day.jpg    | 
      | Vanessa's Birthday  | Triple Chocolate Mint Cake| Cravings for chocolate with mint       | link to facebook | vanessa_birthday.jpg  |
    And I visit the list of events
    When I select to edit event "Emily's 66th day"
    And change the event title to "Emily's special day"
    And change the event picture to use "emily_66th_day1.jpg"
    Then the event title becomes "Emily's special day"
    And the event picture is updated to "emily_66th_day1.jpg"

  Scenario: I can delete an existing event
    Given the Catering category has:
      | event title         | product highlighted       | description                            | more details     | picture               |
      | Emily's 66th day    | Tropical Baby Cake        | Pina coladas with toasted coconut      | link to facebook | emily_66th_day.jpg    | 
      | Vanessa's Birthday  | Triple Chocolate Mint Cake| Cravings for chocolate with mint       | link to facebook | vanessa_birthday.jpg  |
    And I visit the list of events
    When I select to delete event "Emily's 66th day"
    Then the list of events should not have "Emily's 66th day"
    And the list of events should still have "Vanessa's Birthday"

  Scenario: The admin event page shows the list of events and links to other admin pages
    When I visit the admin event page
    Then I see the list of events 
    And I see links to admin Product page, Event page, and FAQ page

  Scenario: I can change the ordering of existing events
    Given the Catering category has:
      | event title       | product highlighted| description                      | more details     | picture               |display order|
      | Emily's 66th day  | Tropical Baby Cake | Pina coladas with toasted coconut| link to facebook | emily_66th_day.jpg    |1            |
      | Vanessa's Birthday| Chocolate Mint Cake| Cravings for chocolate with mint | link to facebook | vanessa_birthday.jpg  |2            |
    And I visit the list of events
    When I change the display order of event "Emily's 66th day" to "3"
    Then the display order of event "Emily's 66th day" becomes "3"

  Scenario: When I add a new event without specifying the display order, it defaults to display last
    Given the Catering category has:
      | event title       | product highlighted| description                      | more details     | picture               |display order|
      | Emily's 66th day  | Tropical Baby Cake | Pina coladas with toasted coconut| link to facebook | emily_66th_day.jpg    |1            |
      | Vanessa's Birthday| Chocolate Mint Cake| Cravings for chocolate with mint | link to facebook | vanessa_birthday.jpg  |2            |
    And I visit the list of events
    When I enter Catering event:
      | event title         | Aaron's Birthday                  |
      | product highlighted | Strawberry Cake                   |
      | description         | Simple Strawberry Cake            |
      | more details        | link to facebook                  |
      | picture             | emily_66th_day.jpg                |
    Then the display order of event "Aaron's Birthday" becomes "3"
