class Node < ApplicationRecord
    belongs_to :organization

    has_many :subnodes, :class_name => "Node", :foreign_key => "parent_node_id", :dependent => :destroy
    belongs_to :parent_node, :class_name => "Node", :optional => true
end
