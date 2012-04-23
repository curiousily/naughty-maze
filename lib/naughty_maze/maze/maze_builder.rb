module NaughtyMaze
  module Maze
    class MazeBuilder
      def initialize(rows, columns, walls)
        @graph = Graph.new
        @rows = rows
        @columns = columns
        @walls = walls
        @cells = Hash.new
        build
      end

      def include?(cell)
        @cells.has_value? cell
      end

      def neighbours_of(cell)
        @graph.neighbours_of(cell).to_a
      end

      private
      def build
        (1..@rows).each do |row|
          (1..@columns).each do |column|
            cell_num = column + (@columns * row) - @columns
            @cells[[row, column]] = cell_num
            @graph.add_node(cell_num)
            assign_neighbours(cell_num, row, column)
          end
        end
      end

      def assign_neighbours(cell, row, column)
        if column - 1 > 0
          left_neighbour = cell_of(row, column - 1)
          @graph.connect(cell, left_neighbour)
        end
        if row - 1 > 0
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
