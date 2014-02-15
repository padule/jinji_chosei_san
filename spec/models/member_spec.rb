require 'spec_helper'

describe Member do
  describe '.event' do
    let(:event){ FactoryGirl.create :event }
    let(:member){ FactoryGirl.create :member, event: event }

    specify{ expect(member.event).to eq event }
  end

  describe '.member_schedules' do
    let(:member){ FactoryGirl.create :member }
    let(:member_schedule){ FactoryGirl.create :member_schedule, member: member }

    before{ member_schedule.save }

    specify{ expect(member.member_schedules).to eq [member_schedule] }
  end
end
