FactoryGirl.define do
  
  factory :user do
    password = Faker::Internet.password(6)
    username              "aaaaaa"
    email                 { Faker::Internet.email }
    password              password
    password_confirmation password
  end

end
