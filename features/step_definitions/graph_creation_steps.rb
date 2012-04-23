Given /^I have provided a graph$/ do
  @graph = Graph.new
  @graph.add_node 1
  @graph.add_node 2
  @graph.add_node 5
  @graph.add_node 9

  @graph.connect(2, 5)
  @graph.connect(2, 9)
end