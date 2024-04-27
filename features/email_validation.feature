Feature: email validation
  In order to avoid duplicate accounts
  As a user
  I want to be warned when I use the same email to register

Scenario: I can't use the same email twice
  Given I already have an account
  When I sign out
  When I try to register with the same email
  Then I should see an error message
