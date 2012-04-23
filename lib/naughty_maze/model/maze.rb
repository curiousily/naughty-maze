module NaughtyMaze
  module Model
    class Maze

      attr_reader :free_positions

      def initialize(graph, cells, free_positions)
        @graph = graph
        @free_positions = free_positions
        @cells = cells
      end

      def include?(cell)
        @cells.has_value? cell
      end

      def wall?(row, column)
        !@free_positions[[row, column]]
      end

      def neighbours_of(cell)
        @graph.neighbours_of(cell).collect! {|node| node.id}
      end
    end
  end
end
