When /^I check if cell (\d+) is in the maze$/ do |cell|
  @cell = cell
end

Then /^it should not be in it$/ do
  @maze.include?(@cell).should == false
end

Then /^it should be in it$/ do
  @maze.include?(@cell).should == true
end

When /^I check the neighbours of cell (\d+)$/ do |cell|
  @neighbours = @maze.neighbours_of cell
end

Then /^their count should be (\d+)$/ do |neighbour_count|
  @neighbours.length.should == neighbour_count
end
