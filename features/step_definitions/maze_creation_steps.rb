Given /^I have provided width, height and walls$/ do
  @free_positions = []
  @free_positions << Wall.new(1, 1)
  @free_positions << Wall.new(2, 2)
  @maze = MazeBuilder.new(4, 4, @free_positions)
end


