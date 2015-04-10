require 'spec_helper'

describe Knight do 
  let (:node) { Node.new(0,0)}
  let (:node_2) { Node.new(3,3)}
  let (:k1) { Knight.new(node,node_2)}
  

  context "#intialize" do

    it "is initialized with starting_node" do
      expect(k1.start_node).to eq node
    end

    it "is initialized with end_node" do
      expect(k1.end_node).to eq node_2
    end
  end

  context "#correct_node" do
    it "should return current_node if correct" do
      current_node = node_2
      expect(k1.correct_node?(current_node)).to eq node_2
    end
  end

  context "#valid?" do
    it "should return true if valid" do
      valid_node = Node.new( 5,5)
      expect(k1.valid?(valid_node)).to eq true
    end

    it "should return nil if x < 0" do
      invalid_node = Node.new( -1,5)
      expect(k1.valid?(invalid_node)).to eq nil
    end

    it "should return nil if x > 8" do
      invalid_node = Node.new( 8,5)
      expect(k1.valid?(invalid_node)).to eq nil
    end

    it "should return nil if y < 0" do
      invalid_node = Node.new( 5,-1)
      expect(k1.valid?(invalid_node)).to eq nil
    end

    it "should return nil if y > 8" do
      invalid_node = Node.new( 5,8)
      expect(k1.valid?(invalid_node)).to eq nil
    end
  end


  context "#generate_neighbours" do
    it "should return only 2 neighbour when [0,0]" do
      current_node = node
      k1.generate_neighbours(current_node)
      expect(current_node.neighbour_nodes.count).to eq 2
    end

    it "should return only 2 neighbour when [7,7]" do
      current_node = Node.new(7,7)
      k1.generate_neighbours(current_node)
      expect(current_node.neighbour_nodes.count).to eq 2
    end

    it "should return only 4 neighbour when on left edge" do
      current_node = Node.new(0,4)
      k1.generate_neighbours(current_node)
      expect(current_node.neighbour_nodes.count).to eq 4
    end

    it "should return only 4 neighbour when on right edge" do
      current_node = Node.new(7,4)
      k1.generate_neighbours(current_node)
      expect(current_node.neighbour_nodes.count).to eq 4
    end

    it "should return only 4 neighbour when on top edge" do
      current_node = Node.new(4,0)
      k1.generate_neighbours(current_node)
      expect(current_node.neighbour_nodes.count).to eq 4
    end

    it "should return only 4 neighbour when on right edge" do
      current_node = Node.new(4,7)
      k1.generate_neighbours(current_node)
      expect(current_node.neighbour_nodes.count).to eq 4
    end

    it "should return 8 neighbour when in middle" do
      current_node = Node.new(4,4)
      k1.generate_neighbours(current_node)
      expect(current_node.neighbour_nodes.count).to eq 8
    end
  end

  context "#determine_path" do
    it "should return start_node if it is the same as the target" do
      k2 = Knight.new(node_2,node_2)
      expect(k2.determine_path).to eq [node_2.value]
    end

    it "should return Path to Target: Test 1" do
      node_3 = Node.new(2,1)
      k2 = Knight.new(node,node_3)
      expect(k2.determine_path).to eq [node.value, node_3.value]
    end

    it "should return Path to Target: Test 2" do
      node_3 = Node.new(3,3)
      k2 = Knight.new(node,node_3)
      expect(k2.determine_path).to eq [[0,0], [1,2], [3,3]]
    end

    it "should return Path to Target: Test 3" do
      node_3 = Node.new(3,3)
      k2 = Knight.new(node_3, node)
      expect(k2.determine_path).to eq [[3,3], [2,1], [0,0]]
    end


    it "should return nil if Target is too high" do
      node_3 = Node.new(9,1)
      k2 = Knight.new(node,node_3)
      expect(k2.determine_path).to eq nil
    end

    it "should return nil if Target not find" do
      node_3 = Node.new(-1,1)
      k2 = Knight.new(node,node_3)
      expect(k2.determine_path).to eq nil
    end

  end

end