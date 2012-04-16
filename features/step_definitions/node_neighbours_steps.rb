When /^I look for a node (\d+) neighbours/ do |node|
  @neighbour_nodes = @graph.neighbours_of node
end

Then /^Neighbour count should be (\d+)$/ do |neighbour_count|
  @neighbour_nodes.size.should == neighbour_count
end

