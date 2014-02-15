FactoryGirl.define do
  factory :member_schedule do
    association :schedule
    association :member
  end
end
