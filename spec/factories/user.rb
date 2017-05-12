FactoryGirl.define do
  
  factory :user do
    password = Faker::Internet.password(6)
    username              { Faker::Internet.user_name('yoh') }
    email                 { Faker::Internet.email }
    password              password
    password_confirmation password
    member                { Faker::Company.name }
    profile               { Faker::Hacker.say_something_smart }
    works                 { Faker::Company.catch_phrase }
  end

end
