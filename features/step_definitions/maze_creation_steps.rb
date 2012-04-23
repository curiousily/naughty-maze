Given /^I have provided width, height and walls$/ do
  @walls = []
  @walls << Wall.new(1, 1)
  @walls << Wall.new(2, 2)
  @maze = MazeBuilder.new(4, 4, @walls)
end


