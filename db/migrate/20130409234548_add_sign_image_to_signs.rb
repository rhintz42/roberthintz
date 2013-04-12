class AddSignImageToSigns < ActiveRecord::Migration
  def change
    add_column :signs, :sign_image, :string
  end
end
