class AddParentNodeToNodes < ActiveRecord::Migration[6.1]
  def change
    add_reference :nodes, :parent_node, foreign_key: { to_table: :nodes }
  end
end
