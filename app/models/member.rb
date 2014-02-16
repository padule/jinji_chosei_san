class Member < ActiveRecord::Base
  belongs_to :event
  has_many :member_schedules

  accepts_nested_attributes_for :member_schedules
end
