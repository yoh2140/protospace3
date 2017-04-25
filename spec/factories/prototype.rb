FactoryGirl.define do

  factory :prototype do
    title       { Faker::Name.title }
    cach_copy   { Faker::Lorem.word }
    concept     { Faker::Lorem.sentence }
    user
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }

  end
end
