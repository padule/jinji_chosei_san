class Schedule < ActiveRecord::Base
  belongs_to :event
  has_many :member_schedules
end
