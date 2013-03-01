class Server < ActiveRecord::Base
  attr_accessible :description, :name, :url, :user_id
  
  belongs_to :user
  
end
