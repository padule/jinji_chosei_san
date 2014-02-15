FactoryGirl.define do
  factory :member do
    name Faker::Name.name
    comment Faker::Lorem.sentence
    association :event
  end
end
