Feature: Find the path in a maze with given rows, columns, walls, start and end point

  Background: Maze is build with 10 rows, 10 columns
    Given a Maze with 10 rows and 10 columns
    And the Maze is build

  Scenario: Start and End point are the same
    When I set start at 1 and end at 1
    And the path finding is executed
    Then the path distance should be 0

  Scenario: Start and End point are different and there is a path
    When I set start at 1 and end at 12
    And the path finding is executed
    Then the path distance should be 5