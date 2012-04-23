module NaughtyMaze
  class PathFinder
    def initialize(start_point, end_point, maze)
      @start_point = start_point
      @end_point = end_point
      @maze = maze
    end

    def execute
      if @start_point == @end_point
        return Path.new(@start_point)
      end
      unless @maze.include?(@start_point)
        raise CellNotFoundError.new("Start point: #@start_point is not in the maze")
      end
      unless @maze.include?(@end_point)
        raise CellNotFoundError.new("Start point: #@end_point is not in the maze")
      end

      visited = Set.new
      not_visited = Set.new
      not_visited << @start_point
      best_cost_from_start = []
      best_cost_from_start[@start_point] = 0
      parent_map = []
      parent_map[@start_point] = -1
      to_be_evaluated = PriorityQueue.new { |x, y| (x <=> y) == -1 }
      to_be_evaluated.push(@start_point, best_cost_from_start[@start_point])

      until to_be_evaluated.empty?
        current = to_be_evaluated.pop
        not_visited.delete(current)
        if current == @end_point
          return reconstruct_path(parent_map)
        end
        visited << current
        @maze.neighbours_of(current).each do |neighbour|
          if visited.include?(neighbour)
            next
          end
          tentative_best_cost_from_start = best_cost_from_start[current] + 1
          is_tentative_better = false
          if !not_visited.include?(neighbour)
            not_visited << neighbour
            to_be_evaluated.push(neighbour, tentative_best_cost_from_start)
            is_tentative_better = true
          elsif tentative_best_cost_from_start < best_cost_from_start[neighbour]
            is_tentative_better = true
          end

          if is_tentative_better
            parent_map[neighbour] = current
            best_cost_from_start[neighbour] = tentative_best_cost_from_start
          end
        end
      end

      raise NotExistingPathError.new("Path between #@start_point and #@end_point does not exist!")

    end

    private

    def reconstruct_path(parent_map)
      path = Path.new(@end_point)
      add_segments_to_path(path, parent_map, parent_map[@end_point])
      path.segments.reverse!
      path
    end

    def add_segments_to_path(path, parent_map, current_node)
      if current_node == -1
        return
      end
      path.segments << current_node
      add_segments_to_path(path, parent_map, parent_map[current_node])
    end

  end
end