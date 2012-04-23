When /^I set start at (\d+) and end at (\d+)$/ do |start_point, end_point|
  @path_finder = PathFinder.new(start_point, end_point, Maze.new)
end

When /^the path finding is executed$/ do
  @path_finder.execute
end
Then /^the path distance should be (\d+)$/ do |path_distance|
  path_distance.should == path_distance
end
