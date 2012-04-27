Given /^a wall at row (\d+) and column (\d+)$/ do |row, column|
  @maze_builder.walls << Wall.new(row, column)
end

Given /^a Maze with (\d+) rows and (\d+) columns$/ do |rows, columns|
  @maze_builder = MazeBuilder.new(rows, columns)
end

When /^the Maze is build$/ do
  @maze = @maze_builder.build
end