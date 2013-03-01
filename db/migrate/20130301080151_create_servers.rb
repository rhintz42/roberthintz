class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.string :url
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
