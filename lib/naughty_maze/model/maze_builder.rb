module NaughtyMaze
  module Model
    class MazeBuilder

      attr_reader :walls
      attr_writer :start_point, :end_point

      def initialize(rows, columns)
        @graph = Graph.new
        @rows = rows
        @columns = columns
        @walls = []
        @cells = Hash.new
      end

      def build
        position_walls
        build_maze
        Maze.new(@start_point, @end_point, @graph, @cells)
      end

      private

      def position_walls
        @walls.each do |wall|
          wall.num = cell_num_of(wall.column, wall.row)
          @cells[[wall.row, wall.column]] = wall
        end
      end

      def free_position?(row, column)
        @cells[[row, column]].is_a?(Cell)
      end

      def build_maze
        (1..@rows).each do |row|
          (1..@columns).each do |column|
            unless @cells.has_key?([row, column])
              cell_num = cell_num_of(column, row)
              cell = Cell.new(row, column, cell_num)
              @cells[[row, column]] = cell
              @graph.add_node(cell_num)
              assign_neighbours(cell_num, row, column)
            end
          end
        end
        @start_point.num = cell_num_of(@start_point.column, @start_point.row)
        @end_point.num = cell_num_of(@end_point.column, @end_point.row)
      end

      def cell_num_of(column, row)
        column + (@columns * row) - @columns
      end

      def assign_neighbours(cell, row, column)
        if column - 1 > 0 && free_position?(row, column - 1)
          left_neighbour = cell_of(row, column - 1)
          @graph.connect(cell, left_neighbour.num)
        end
        if row - 1 > 0 && free_position?(row - 1, column)
          top_neighbour = cell_of(row - 1, column)
          @graph.connect(cell, top_neighbour.num)
        end
      end

      def cell_of(row, column)
        @cells[[row, column]]
      end
    end
  end
end
