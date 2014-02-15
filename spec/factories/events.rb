FactoryGirl.define do
  factory :event do
    name Faker::Name.title
    description Faker::Lorem.sentence
  end
end
