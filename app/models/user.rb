class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :picture_path, :username
end
