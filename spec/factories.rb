FactoryGirl.define do
  factory :category do 
    title 'Root'
    description 'This is the root directory'
    picture '/root.png'
  end

  factory :link do
    title 'Google'
    url_path 'http://www.google.com'
    description "This should redirect to google's site"
    num_clicks 0
    picture_path '/other/google'
  end
  
  factory :user do
    email 'penisbutt@stanford.edu'
    first_name 'Robert'
    last_name 'Hintz'
    username "rhintz42"
    password "compman1"
  end
end
