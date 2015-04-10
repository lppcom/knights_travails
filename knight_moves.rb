class Node
  attr_accessor :neighbour_nodes, :value, :visited
  def initialize(x,y, neighbour_nodes=[], visited=[])
    @value = [x,y]
    @neighbour_nodes = neighbour_nodes
    @visited = visited
  end
end


class Knight
  attr_accessor :queue
  attr_reader :start_node, :end_node

  def initialize(start_node, end_node)
    @start_node = start_node
    @end_node = end_node
    @queue = []
  end

  def correct_node?(current_node)
    return current_node if current_node.value == end_node.value
  end

  # Generate all possible Neighbouring Nodes
  def generate_neighbours(current_node)
    moves = [[ 1, 2], [-1, 2], [ 1,-2], [-1,-2], [ 2, 1], [-2, 1], [ 2,-1], [-2,-1]]
    moves.each do |move|
      neigbour_helper(current_node, move[0], move[1])
    end
  end

  def valid?(new_node)
    true if new_node.value.all? {|coordinate| coordinate >= 0 && coordinate <8} 
  end


  def determine_path
    queue << start_node
    start_node.visited << start_node.value
    return start_node.visited if correct_node?(start_node)    
    return nil unless valid?(end_node)
    path_finder
  end

  def print_results
    path = determine_path
    puts "You made it in #{(path.count - 1)} moves. Here's your path:"
    path.each {|node| p node}
  end   

  private

    # Create 1 new Neighbouring Node
    def neigbour_helper(current_node, x, y)
      new_x = current_node.value[0] + x
      new_y = current_node.value[1] + y
      new_node = Node.new(new_x, new_y)
      current_node.neighbour_nodes << new_node if valid?(new_node)
    end

    # generates neigbours, checks each one, then proceeds to next in queue
    def path_finder  
      until queue.empty?  
        current_node = queue.shift()
        generate_neighbours(current_node)
        current_node.neighbour_nodes.each do |neighbour|
          track_visited(current_node, neighbour)
          correct_node?(neighbour) ? (return neighbour.visited) : (queue << neighbour)
        end
      end
    end

    def track_visited(current_node, neighbour)
      neighbour.visited += current_node.visited
      neighbour.visited << neighbour.value
    end
end




# optimising?
# !current_node.visited.include?(neighbour.value) && 
