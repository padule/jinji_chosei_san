require 'spec_helper'

describe MemberSchedule do
  describe '.member' do
    let(:member){ FactoryGirl.create :member }
    let(:member_schedule){ FactoryGirl.create :member_schedule, member: member }

    specify{ expect(member_schedule.member).to eq member }
  end

  describe '.schedule' do
    let(:schedule){ FactoryGirl.create :schedule }
    let(:member_schedule){ FactoryGirl.create :member_schedule, schedule: schedule }

    specify{ expect(member_schedule.schedule).to eq schedule }
  end
end
