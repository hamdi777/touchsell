class CreateNodes < ActiveRecord::Migration[6.1]
  def change
    create_table :nodes do |t|
      t.references :organization
      t.string :name
      t.timestamps
    end
  end
end
