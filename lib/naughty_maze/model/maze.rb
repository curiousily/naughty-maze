module NaughtyMaze
  module Model
    class Maze

      def initialize(graph, cells, free_positions)
        @graph = graph
        @free_positions = free_positions
        @cells = cells
      end

      def include?(cell)
        @cells.has_value? cell
      end

      def neighbours_of(cell)
        @graph.neighbours_of(cell).to_a
      end
    end
  end
end
