Feature: Find the length path in a maze with given rows, columns, walls, start and end point

  Background: Maze is build with 4 rows, 4 columns
    Given a Maze with 4 rows and 4 columns

  Scenario: Start and End point are the same
    Given I set start at start row 1 and start column 1 and end row 1 and end column 1
    And the Maze is build
    When the path finding is executed
    Then the path distance should be 0

  Scenario: Start point is outside the maze
    Given I set start at start row 200 and start column 1 and end row 2 and end column 3
    And the Maze is build
    When the path finding is executed
    Then cell not in maze error is raised

  Scenario: Start point is at a wall position
    Given I set start at start row 1 and start column 1 and end row 2 and end column 4
    And a wall at row 1 and column 1
    And the Maze is build
    When the path finding is executed
    Then not existing path error is raised

  # S * W *
  # * * W *
  # * * W E
  # * * W *
  Scenario: Start and End point are unreachable due to walls
    Given I set start at start row 1 and start column 1 and end row 3 and end column 4
    And a wall at row 1 and column 3
    And a wall at row 2 and column 3
    And a wall at row 3 and column 3
    And a wall at row 4 and column 3
    And the Maze is build
    When the path finding is executed
    Then not existing path error is raised

  # S * W  *
  # * * W  *
  # * * W E
  # * * *  *
  Scenario: Start and End point are reachable, but walls interfere the shortest path walk
    Given I set start at start row 1 and start column 1 and end row 3 and end column 4
    And a wall at row 1 and column 3
    And a wall at row 2 and column 3
    And a wall at row 3 and column 3
    And the Maze is build
    When the path finding is executed
    Then the path distance should be 7

  # W W W W  *
  # *  *  *  W  *
  # *  W *  W  E
  # *  W *  W  *
  # *  S  *  W  *
  Scenario: Start is at the other side of the wall
    Given a Maze with 5 rows and 5 columns
    And I set start at start row 5 and start column 2 and end row 3 and end column 5
    And a wall at row 1 and column 1
    And a wall at row 1 and column 2
    And a wall at row 1 and column 3
    And a wall at row 1 and column 4
    And a wall at row 2 and column 4
    And a wall at row 3 and column 2
    And a wall at row 3 and column 4
    And a wall at row 4 and column 2
    And a wall at row 4 and column 4
    And a wall at row 5 and column 4
    And the Maze is build
    When the path finding is executed
    Then not existing path error is raised

  # W W W W  *
  # *  *  *  W  *
  # *  W *  W  E
  # *  *  *  W  *
  # *  S  *  W  *
  Scenario: Start is at the other side of the wall
    Given a Maze with 5 rows and 5 columns
    And I set start at start row 5 and start column 2 and end row 3 and end column 5
    And a wall at row 1 and column 1
    And a wall at row 1 and column 2
    And a wall at row 1 and column 3
    And a wall at row 1 and column 4
    And a wall at row 2 and column 4
    And a wall at row 3 and column 2
    And a wall at row 3 and column 4
    And a wall at row 4 and column 4
    And a wall at row 5 and column 4
    And the Maze is build
    When the path finding is executed
    Then not existing path error is raised

  # S * * *
  # * * * *
  # * * * E
  # * * * *
  Scenario: Start and End point are different and there is a path
    Given I set start at start row 1 and start column 1 and end row 3 and end column 4
    And the Maze is build
    When the path finding is executed
    Then the path distance should be 5

  # * * * *
  # * * E *
  # * * S *
  # * * * *
  Scenario: Start and End point are neighbours
    Given I set start at start row 3 and start column 3 and end row 4 and end column 3
    And the Maze is build
    When the path finding is executed
    Then the path distance should be 1

  # E * * S
  Scenario: Start and End point are on the same and only row
    Given a Maze with 1 rows and 4 columns
    And I set start at start row 1 and start column 4 and end row 1 and end column 1
    And the Maze is build
    When the path finding is executed
    Then the path distance should be 3

  # *  *   *  *
  # S  W W  *
  # *  *  W  E
  # *  *  *   *
  Scenario: Start and End point are neighbours
    Given I set start at start row 2 and start column 1 and end row 3 and end column 4
    And a wall at row 2 and column 2
    And a wall at row 2 and column 3
    And a wall at row 3 and column 3
    And the Maze is build
    When the path finding is executed
    Then the path distance should be 6