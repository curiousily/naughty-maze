module NaughtyMaze
  class Path

    attr_accessor :segments

    def initialize
      @segments = []
    end

    def length
      @segments.length
    end
  end
end