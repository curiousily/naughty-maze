require "naughty_maze/version"
require "naughty_maze/algorithm/graph"
require "naughty_maze/algorithm/node"
require "naughty_maze/model/wall"
require "naughty_maze/model/maze"
require "naughty_maze/model/maze_builder"
require "naughty_maze/path_finder"

module NaughtyMaze
  include Algorithm
  include Model
end
