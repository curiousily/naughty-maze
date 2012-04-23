require "algorithms"
require "commander/import"
require "naughty_maze/algorithm/graph"
require "naughty_maze/algorithm/node"
require "naughty_maze/error/cell_not_in_maze_error"
require "naughty_maze/error/not_existing_path_error"
require "naughty_maze/model/cell"
require "naughty_maze/model/wall"
require "naughty_maze/model/maze"
require "naughty_maze/model/maze_builder"
require "naughty_maze/cli/maze_cli"
require "naughty_maze/version"
require "naughty_maze/path"
require "naughty_maze/path_finder"

module NaughtyMaze
  include Containers
  include Algorithm
  include Model
  include Error
  include CLI

  def start
    MazeCLI.new.start
  end
end
