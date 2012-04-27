When /^I set start at start row (\d+) and start column (\d+) and end row (\d+) and end column (\d+)$/ do |start_row, start_column, end_row, end_column|
  @maze_builder.start_point= Cell.new(start_row, start_column)
  @maze_builder.end_point = Cell.new(end_row, end_column)
end

When /^the path finding is executed$/ do
  @path_finder = PathFinder.new(@maze)
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