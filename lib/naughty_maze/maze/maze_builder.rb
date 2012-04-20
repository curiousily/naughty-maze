module NaughtyMaze
  module Maze
    class MazeBuilder
      def initialize(rows, columns, walls)
        @rows = rows
        @columns = columns
        @walls = walls
        @cells = Hash.new
        build
      end

      def include?(cell)
        @cells.has_value? cell
      end

      def build
        (1..@rows).each do |row|
          (1..@columns).each do |column|
            @cells[[row, column]] = column + (@columns * row) - @columns
          end
        end
      end
    end
  end
end
