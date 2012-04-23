Feature: Find the length path in a maze with given rows, columns, walls, start and end point

  Background: Maze is build with 4 rows, 4 columns
    Given a Maze with 4 rows and 4 columns

  Scenario: Start and End point are the same
    Given the Maze is build
    When I set start at 1 and end at 1
    And the path finding is executed
    Then the path distance should be 0

  Scenario: Start point is outside the maze
    Given the Maze is build
    When I set start at 200 and end at 7
    And the path finding is executed
    Then cell not in maze error is raised

  # S * W *
  # * * W *
  # * * W E
  # * * W *
  Scenario: Start and End point are unreachable due to walls
    Given a wall at row 1 and column 3
    And a wall at row 2 and column 3
    And a wall at row 3 and column 3
    And a wall at row 4 and column 3
    And the Maze is build
    When I set start at 1 and end at 12
    And the path finding is executed
    Then not existing path error is raised

  # S * W *
  # * * W *
  # * * W E
  # * * * *
  Scenario: Start and End point are reachable, but walls interfere the shortest path walk
    Given a wall at row 1 and column 3
    And a wall at row 2 and column 3
    And a wall at row 3 and column 3
    And the Maze is build
    When I set start at 1 and end at 12
    And the path finding is executed
    Then the path distance should be 7

  # S * * *
  # * * * *
  # * * * E
  # * * * *
  Scenario: Start and End point are different and there is a path
    Given the Maze is build
    When I set start at 1 and end at 12
    And the path finding is executed
    Then the path distance should be 5