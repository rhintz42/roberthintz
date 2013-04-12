class Sign < ActiveRecord::Base
  attr_accessible :chapter, :left_handshape_begin, :left_handshape_end, :name, :right_handshape_begin, :right_handshape_end, :right_motion, :left_motion, :sign_image
  mount_uploader :sign_image, SignImageUploader
end
