Feature: Provide node connection information

  Background:
    Given I have provided a graph

  Scenario: Provided 2 nodes that are not in the graph
    When I check if node 10 and 11 are connected
    Then They should not be connected

  Scenario: Provided 2 nodes that are in the graph and aren't connected
    When I check if node 10 and 11 are connected
    Then They should not be connected

  Scenario: Provided 2 nodes that are in the graph and are connected
    When I check if node 2 and 5 are connected
    Then They should be connected