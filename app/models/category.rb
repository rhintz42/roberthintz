class Category < ActiveRecord::Base
  has_many :children, :foreign_key => "parent_id", :class_name => "Category"
  belongs_to :parent, :class_name => "Category"
  
  has_many :links
  
  attr_accessible :description,
                  :picture,
                  :title, 
                  :links_attributes,
                  :parent_id

  accepts_nested_attributes_for :links#, :allow_destroy => true
end
