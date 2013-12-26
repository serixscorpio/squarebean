Feature: Frequently Asked Questions
  This is the FAQ page, which contains frequently asked questions about Square Bean.

  Scenario: I can see a list of questions and answers about Square Bean
    Given predefined Q&A content:
      | Question                        | Answer                                                                                 | order |
      | Do I order your cakes as gifts? | We are currently unable to ship any of our cakes since we use the freshest ingredients | 1     |
      | Do you deliver?                 | Yes                                                                                    | 2     |
    When I visit the FAQ page
    Then I should see the list of questions and answers
