Feature: Wedding & Events
  The Wedding & Events page shows past catering events along with photos and descriptions.

  Scenario: I see three event categories
    When I visit the Wedding & Events page
    Then I see the Wedding, Birthday, and Special Events categories

  Scenario: I can go through the content of the Birthday category
    Given the Birthday category has:
      | event title         | product highlighted       | description                            | more details     | picture               |
      | Emily's 66th day    | Tropical Baby Cake        | Pina coladas with toasted coconut      | link to facebook | emily_66th_day.jpg    | 
      | Vanessa's Birthday  | Triple Chocolate Mint Cake| Cravings for chocolate with mint       | link to facebook | vanessa_birthday.jpg  |
      | Thanksgiving + Bday | Chocolate Cranberry Cake  | Touch of cranberry with dark chocolate | link to facebook | thanksgiving_bday.jpg |
    When I am at the Wedding & Events page
    Then I can go through the content of each Birthday event
