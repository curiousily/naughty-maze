module NaughtyMaze
  class Path

    attr_accessor :segments

    def initialize(start_segment)
      @segments = []
      @segments << start_segment
    end

    def include?(cell_num)
      @segments.include?(cell_num)
    end

    def length
      @segments.length - 1
    end
  end
end