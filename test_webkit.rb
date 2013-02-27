require 'imgkit'
 
 kit = IMGKit.new("http://roberthintz.com")
 f = File.new("kat.jpg", 'wb')
 img = kit.to_img(:jpg)
 f.write(img)
 f.close
