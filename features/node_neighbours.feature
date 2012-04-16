Feature: Provide node neighbours information

  Providing information about the neighbours of a given node is sometimes daunting task. We need to provide
  accurate and fast access to them.

  Background:
    Given I have provided a graph

  Scenario: Provided node is not in the graph
    When I look for a node 10 neighbours
    Then Neighbour count should be 0

  Scenario: Provided node that is in the graph and doesn't have neighbours
    When I look for a node 1 neighbours
    Then Neighbour count should be 0

  Scenario: Provided node that is in the graph and have neighbours
    When I look for a node 2 neighbours
    Then Neighbour count should be 2
