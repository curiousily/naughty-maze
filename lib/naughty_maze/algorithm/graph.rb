module NaughtyMaze
  module Algorithm
    class Graph

      def initialize
        @nodes = Hash.new
      end

      def add_node node
        @nodes[node] = Node.new(node)
      end

      def connect(node1, node2)
        if contain_nodes(node1, node2)
          @nodes[node1].connect_to @nodes[node2]
          @nodes[node2].connect_to @nodes[node1]
        end
      end

      def connected?(node1, node2)
        if contain_nodes(node1, node2)
          return @nodes[node1].connected?(@nodes[node2])
        end
        false
      end

      def neighbours_of node
        if @nodes.has_key? node
          return @nodes[node].neighbours
        end
        Set.new
      end

      private

      def contain_nodes(node1, node2)
        @nodes.has_key?(node1) && @nodes.has_key?(node2)
      end
    end
  end
end