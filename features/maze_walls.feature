Feature: A maze has walls and they cannot be trespassed

  Background:
    Given a Maze with 4 rows and 4 columns

  Scenario: Walls should not be trespassed
    Given a wall at row 2 and column 2
    And the Maze is build
    When I check the neighbours of cell 7
    Then their count should be 3