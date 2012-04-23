module NaughtyMaze
  module CLI
    class MazeCLI

      def start
        default_command :new

        command :new do |command|
          command.syntax = 'naughty_maze new'
          command.description = 'Creates new maze solving simulation'
          command.action do
            rows = ask("Please, enter the number of rows", Integer)
            columns = ask("Please, enter the number of columns", Integer)
            maze_builder = MazeBuilder.new(rows, columns)

            while agree("Do you want to add a wall?") { |q| (q.default = "y") }
              row = ask("Please, enter the wall row", Integer)
              column = ask("Please, enter the wall column", Integer)
              wall = Wall.new(row, column)
              maze_builder.walls << wall
            end
            start_point = ask("Please enter starting point", Integer)
            end_point = ask("Please enter end point", Integer)
            maze = maze_builder.build
            path_finder = PathFinder.new(start_point, end_point, maze)
            path = path_finder.execute
            (1..rows).each do |row|
              (1..columns).each do |column|
                cell_num = cell_num_of(columns, column, row)
                if cell_num == start_point
                  print "S "
                elsif cell_num == end_point
                  print "E "
                elsif path.include?(cell_num)
                  print "P "
                elsif maze.wall?(row, column)
                  print "W "
                else
                  print "* "
                end
              end
              puts
            end
          end
        end
      end

      def cell_num_of(columns, column, row)
        column + (columns * row) - columns
      end
    end
  end
end
