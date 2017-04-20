FactoryGirl.define do

  factory :prototype do
    title       { Faker::Name.title }
    cach_copy   { Faker::Lorem.word }
    concept     { Faker::Lorem.sentence }
    user
  end

end
