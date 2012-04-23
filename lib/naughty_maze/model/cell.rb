module NaughtyMaze
  module Model
    class Cell
      attr_reader :row, :column

      def initialize(row, column)
        @row = row
        @column = column
      end
    end
  end
end