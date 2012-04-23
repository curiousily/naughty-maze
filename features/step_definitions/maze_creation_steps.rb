Given /^a wall at row (\d+) and column (\d+)$/ do |row, column|
  @maze.walls << Wall.new(row, column)
end

Given /^a created Maze with (\d+) rows and (\d+) columns$/ do |rows, columns|
  @maze = MazeBuilder.new(rows, columns)
  @maze.build
end

Given /^a Maze with (\d+) rows and (\d+) columns$/ do |rows, columns|
  @maze = MazeBuilder.new(rows, columns)
end

When /^the Maze is build$/ do
  @maze.build
end