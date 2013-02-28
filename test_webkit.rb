require 'imgkit'
 
 kit = IMGKit.new("http://www.google.com")
 f = File.new("kat.jpg", 'wb')
 img = kit.to_jpg
 f.write(img)
 f.close
