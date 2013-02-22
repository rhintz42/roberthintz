class Category < ActiveRecord::Base
=begin
This is extremely cool. I have another table "ParentToChild" that I'm able to
  join into this table extremely easily. It makes it extremely easy for my folder
  program to have multiple children and parents, and the method to get these is
  able to have a really simple name for this too!
=end
  has_many :children, :foreign_key => "parent_id", :class_name => "ParentToChild"
  has_many :parents, :foreign_key => "child_id", :class_name => "ParentToChild"
  has_many :links
  
  attr_accessible :description,
                  :picture,
                  :title, 
                  :links_attributes,
                  :parent_id,
                  :child_id

  accepts_nested_attributes_for :links#, :allow_destroy => true
end
