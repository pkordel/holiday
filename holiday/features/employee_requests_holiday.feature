Feature: Employee requests holiday
  In order to get some time away
  As an employee
  I need to request holiday

  Scenario: Employee successfully requests holiday
    Given I have no other planned holidays
    When I request a holiday of two days in the future
    Then that holiday request is logged
