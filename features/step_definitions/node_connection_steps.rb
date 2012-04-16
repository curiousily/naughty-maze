When /^I check if node (\d+) and (\d+) are connected$/ do |node1, node2|
  @node1 = node1
  @node2 = node2
end

Then /^They should not be connected$/ do
  @graph.connected?(@node1, @node2).should eql false
end
Then /^They should be connected$/ do
  @graph.connected?(@node1, @node2).should eql true
end