require 'mini_magick'
#require 'debugger'
#debugger
image = MiniMagick::Image.open("kat.jpg")
#image = MiniMagick::Image.open("/Users/roberth/cs/rails_projects/rails_roberthintz/kat.jpg")
image.resize "100x100"
image.write "output.jpg"
