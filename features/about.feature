Feature: About
  This is the About page, which contains information about Square Bean.

  Scenario: I can see description about Square Bean
    When I visit the About page
    Then I should see a description about why Square face and why Bean face
