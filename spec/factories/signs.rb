# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sign do
    name "MyString"
    chapter 1
    right_handshape_begin "MyString"
    right_handshape_end "MyString"
    left_handshape_begin "MyString"
    left_handshape_end "MyString"
    photo_path "MyString"
  end
end
