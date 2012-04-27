module NaughtyMaze
  module Model
    class Cell
      attr_reader :row, :column
      attr_accessor :num

      def initialize(row, column, num = 0)
        @row = row
        @column = column
        @num = num
      end

      def hash
        puts "called"
        @num.hash
      end

      def eql?(other)
        puts "called"
        @num.eql?(other.num)
      end

    end
  end
end