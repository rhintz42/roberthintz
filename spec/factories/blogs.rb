# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blog do
    title "MyString"
    content "MyText"
    user nil
  end
end
