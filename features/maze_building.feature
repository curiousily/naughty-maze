Feature: Build a general maze

  Build a general case of a maze (that is to say, it is not necessary to have a Full maze) for this builder to work.

  Background:
    Given I have provided width, height and wall positions

  Scenario: Provided cell position not in the maze
    When I check if cell 20 is in the maze
    Then It should not be in it
