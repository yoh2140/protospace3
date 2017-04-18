FactoryGirl.define do
  
  factory :comment do
    prototype
    user
    content   { Faker::Lorem.sentences }
  end

end
