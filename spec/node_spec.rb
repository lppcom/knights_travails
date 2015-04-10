require 'spec_helper'

describe Node do 
  let (:node) { Node.new(0,0)}
  let (:node_2) { Node.new(2,1)}

  context "#intialize" do
    it "is initialized with x,y coordinates for its value" do
      expect(node.value).to eq [0,0]
    end

    it "is initialized with an empty array for Neighbouring Nodes" do
      expect(node.neighbour_nodes).to eq []
    end    

    it "can accept new nodes as Neighbours" do
      node.neighbour_nodes << node_2
      expect(node.neighbour_nodes).to eq [node_2]
    end     

    it "is initialized with an empty array for Visited" do
      expect(node.visited).to eq []
    end    

    it "can accept new nodes as Visited" do
      node.visited << node_2
      expect(node.visited).to eq [node_2]
    end     


  end
end

# is initialized with value of '' by default