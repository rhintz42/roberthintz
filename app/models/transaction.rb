class Transaction < ActiveRecord::Base
  attr_accessible :buyer, :description, :price, :purchase_date, :category
end
