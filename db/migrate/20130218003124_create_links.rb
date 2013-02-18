class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url_path
      t.string :title
      t.string :picture_path
      t.text :description
      t.integer :num_clicks
      t.references :category

      t.timestamps
    end
    add_index :links, :category_id
  end
end
