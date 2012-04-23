Feature: Build a general maze

  Build a general case of a maze (that is to say, it is not necessary to have a Full maze) for this builder to work.

  Background:
    Given a created Maze with 4 rows and 4 columns

  Scenario: Provided cell position not in the maze
    When I check if cell 17 is in the maze
    Then it should not be in it

  Scenario: Provided cell position in the maze
    When I check if cell 3 is in the maze
    Then it should be in it

  Scenario: Check the neighbour count of a inner cell

    When I check the neighbours of cell 11
    Then their count should be 4

  Scenario: Check the neighbour count of a bound cell
    When I check the neighbours of cell 4
    Then their count should be 2

