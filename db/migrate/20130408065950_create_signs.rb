class CreateSigns < ActiveRecord::Migration
  def change
    create_table :signs do |t|
      t.string :name
      t.integer :chapter
      t.boolean :one_handed
      t.string :right_handshape_begin
      t.string :right_handshape_end
      t.string :left_handshape_begin
      t.string :left_handshape_end
      t.string :right_motion
      t.string :left_motion

      t.timestamps
    end
  end
end
