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

  Scenario: I can edit an existing event
    Given the Birthday category has:
      | event title         | product highlighted       | description                            | more details     | picture               |
      | Emily's 66th day    | Tropical Baby Cake        | Pina coladas with toasted coconut      | link to facebook | emily_66th_day.jpg    | 
      | Vanessa's Birthday  | Triple Chocolate Mint Cake| Cravings for chocolate with mint       | link to facebook | vanessa_birthday.jpg  |
    And I visit the list of events
    When I select to edit event "Emily's 66th day"
    And change the event title to "Emily's special day"
    And change the event picture to use "emily_66th_day1.jpg"
    Then the event title becomes "Emily's special day"
    And the event picture is updated to "emily_66th_day1.jpg"
