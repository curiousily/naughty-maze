module NaughtyMaze
  module Model
    class Maze

      attr_reader :free_positions, :start_point, :end_point

      def initialize(start_point, end_point, graph, cells)
        @graph = graph
        @cells = cells
        @start_point = start_point
        @end_point = end_point
      end

      def include?(cell)
        @cells.each_key do |key|
          if @cells[key].num == cell.num then
            return true
          end
        end
        false
      end

      def wall?(row, column)
        @cells[[row, column]].is_a?(Wall)
      end

      def neighbours_of(cell)
        @graph.neighbours_of(cell).collect! { |node| node.id }
      end
    end
  end
end
