# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction do
    buyer "MyString"
    purchase_date "2013-04-07"
    price "9.99"
    type ""
    description "MyString"
  end
end
