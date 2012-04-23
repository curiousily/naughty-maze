module NaughtyMaze
  module Model
    class MazeBuilder

      attr_reader :walls

      def initialize(rows, columns)
        @graph = Graph.new
        @rows = rows
        @columns = columns
        @free_positions = Hash.new
        @walls = []
        @cells = Hash.new
      end

      def build
        assign_free_positions
        build_maze
      end

      def include?(cell)
        @cells.has_value? cell
      end

      def neighbours_of(cell)
        @graph.neighbours_of(cell).to_a
      end

      private

      def assign_free_positions
        (1..@rows).each do |row|
          (1..@columns).each do |column|
            @free_positions[[row, column]] = true
          end
        end
        @walls.each do |wall|
          @free_positions[[wall.row, wall.column]] = false
        end
        @free_positions
      end

      def free_position?(row, column)
        @free_positions[[row, column]]
      end

      def build_maze
        (1..@rows).each do |row|
          (1..@columns).each do |column|
            cell_num = cell_num_of(column, row)
            @cells[[row, column]] = cell_num
            @graph.add_node(cell_num)
            assign_neighbours(cell_num, row, column)
          end
        end
      end

      def cell_num_of(column, row)
        column + (@columns * row) - @columns
      end

      def assign_neighbours(cell, row, column)
        if column - 1 > 0 && free_position?(row, column - 1)
          left_neighbour = cell_of(row, column - 1)
          @graph.connect(cell, left_neighbour)
        end
        if row - 1 > 0 && free_position?(row - 1, column)
          top_neighbour = cell_of(row - 1, column)
          @graph.connect(cell, top_neighbour)
        end
      end

      def cell_of(row, column)
        @cells[[row, column]]
      end
    end
  end
end
