class ParentToChild < ActiveRecord::Base
  #belongs_to :category
  belongs_to :parent, :class_name => "Category"
  belongs_to :child, :class_name => "Category"

  attr_accessible :parent_id,
                  :child_id
end
