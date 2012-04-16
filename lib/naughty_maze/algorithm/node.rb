require "set"

module NaughtyMaze
  module Algorithm
    class Node
      attr_reader :id, :neighbours

      def initialize(id)
        @id = id
        @neighbours = Set.new
      end

      def connect_to node
        @neighbours << node
      end

      def connected? node
        @neighbours.include? node
      end

      def ==(other)
        @id == other.id
      end

      def eql?(other)
        @id.eql?(other.id)
      end

      def hash
        @id.hash
      end

    end
  end
end