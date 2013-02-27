class CreateParentToChildren < ActiveRecord::Migration
  def change
    create_table :parent_to_children do |t|
      t.integer :parent_id
      t.integer :child_id
      t.references :Categories

      t.timestamps
    end
  end
end
