class MemberSchedule < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :member
end
