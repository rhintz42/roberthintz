class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :buyer
      t.date :purchase_date
      t.decimal :price
      t.string :category
      t.string :description

      t.timestamps
    end
  end
end
