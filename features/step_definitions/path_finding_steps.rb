When /^I set start at (\d+) and end at (\d+)$/ do |start_point, end_point|
  @path_finder = PathFinder.new(start_point, end_point, @maze_builder.build)
end

When /^the path finding is executed$/ do
  begin
    @path = @path_finder.execute
  rescue StandardError => error
    @error = error
  end
end
Then /^the path distance should be (\d+)$/ do |path_distance|
  @path.length.should == path_distance
end

Then /^cell not in maze error is raised$/ do
  @error.should be_instance_of(CellNotFoundError)
end
Then /^not existing path error is raised$/ do
  @error.should be_instance_of(NotExistingPathError)
end
