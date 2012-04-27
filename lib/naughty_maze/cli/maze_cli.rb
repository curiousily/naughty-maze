module NaughtyMaze
  module CLI
    class MazeCLI

      def start
        default_command :new

        command :new do |command|
          command.syntax = 'naughty_maze new'
          command.description = 'Creates new maze solving simulation'
          command.action do
            rows = ask("Please, enter the number of rows (1 to 10)", Integer) { |q| q.in = 1..10 }
            columns = ask("Please, enter the number of columns (1 to 10)", Integer) { |q| q.in = 1..10 }
            maze_builder = MazeBuilder.new(rows, columns)

            while agree("Do you want to add a wall?") { |q| (q.default = "y") }
              row = ask("Please, enter the wall row (1 to #{rows})", Integer) { |q| q.in = 1..rows }
              column = ask("Please, enter the wall column (1 to #{columns})", Integer) { |q| q.in = 1..columns }
              wall = Wall.new(row, column)
              maze_builder.walls << wall
            end
            start_row = ask("Please enter starting point row (1 to #{rows})", Integer) { |q| q.in = 1..rows }
            start_column = ask("Please enter starting point column (1 to #{columns})", Integer) { |q| q.in = 1..columns }
            end_row = ask("Please enter end point row (1 to #{rows})", Integer) { |q| q.in = 1..rows }
            end_column = ask("Please enter end point column (1 to #{columns})", Integer) { |q| q.in = 1..columns }
            maze_builder.start_point= Cell.new(start_row, start_column)
            maze_builder.end_point= Cell.new(end_row, end_column)
            maze = maze_builder.build
            path_finder = PathFinder.new(maze)
            begin
              path = path_finder.execute
              print_path(columns, maze, path, rows)
            rescue StandardError => error
              say("Error: " + error.message)
            end
          end
        end
      end

      def print_path(columns, maze, path, rows)
        (1..rows).each do |row|
          (1..columns).each do |column|
            if row == maze.start_point.row && column == maze.start_point.column
              print "S "
            elsif row == maze.end_point.row && column == maze.end_point.column
              print "E "
            elsif path.include?(cell_num_of(columns, column, row))
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

      def cell_num_of(columns, column, row)
        column + (columns * row) - columns
      end
    end
  end
end
