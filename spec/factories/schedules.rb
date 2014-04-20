FactoryGirl.define do
  factory :schedule do
    date_time '2014/02/15 10:00~'
    association :event
  end
end
