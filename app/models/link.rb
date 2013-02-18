class Link < ActiveRecord::Base
  belongs_to :category
  attr_accessible :description,
                  :num_clicks, 
                  :picture_path,
                  :title, 
                  :url_path,
                  :category_id,
                  :category
end
